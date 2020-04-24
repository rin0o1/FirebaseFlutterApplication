import 'dart:convert';

import 'package:easyqueue/Model/mBaseModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:easyqueue/Model/mShiftSettings.dart';
import 'package:easyqueue/Model/mSingleShift.dart';

class DataManager
{
  //Inizializando il file al primo avvio
  settingUpSharedPreferences() async{

    String IsSetKey="SharedPreferenceIsAlreadySetUp";
 
    SharedPreferences sp =  await SharedPreferences.getInstance();
    bool Value= sp.getBool('Value') ?? false;

    //Already set
    if (Value){return;}

    //setting up default settings
    ShiftSettings shiftSettings= ShiftSettings(5,7);
    saveModel(shiftSettings);

    //sp.setString(shiftSettings.Key,JsonEncode);
    //Now the file is set up
    //sp.setBool(IsSetKey, true);

  }

  //Get shift Settings information
  //return a ShiftSetting object async
  Future<ShiftSettings> readShiftSettingsFromKey() async{
    String key="ShiftSettings";
    SharedPreferences sp= await SharedPreferences.getInstance();
    String r= sp.getString(key);
    Object JsonDecode= json.decode(r);
    ShiftSettings shift = ShiftSettings.ShiftSettingsFromJson(JsonDecode);
    shift.setKey();
    return shift ;
  }


  Future<List<SingleShift>> getMonthlyShiftFromDate( DateTime Date) async{


    String Month= Date.month.toString() ;
    String Year = Date.year.toString() ;



    SharedPreferences sp= await SharedPreferences.getInstance();

    List<SingleShift> Shifts=new List<SingleShift>();

    for(int i=1; i<31; i++)
    {

      //Finding shift from month, building the key...
      String _day= i.toString();
      String _month= Month;
      String _year= Year;
      String Key= _day + "-" + _month+ "-"+ _year;

      //Reading shift
      String SingleShift_= sp.getString(Key);

      //There is a shift
      if (SingleShift_!=null) {
        Object Jsondecode= json.decode(SingleShift_);
        SingleShift s= SingleShift.SingleShiftFromJson(Jsondecode);

        s.setKeyFromJson();
        Shifts.add(s);
      }
    }
    return Shifts;
  }

  Future<List<double>> getTotalPayment() async{

    SharedPreferences sp= await SharedPreferences.getInstance();

    String keySett="ShiftSettings";
    String r= sp.getString(keySett);
    if (r==null){return null;}
    Object JsonDecode= json.decode(r);
    ShiftSettings ShiftSetting = ShiftSettings.ShiftSettingsFromJson(JsonDecode);

    double PaymentForShift= ShiftSetting.PaymentForHour*ShiftSetting.DurationInHours;

    List<double> _totalPayment= new List<double>();
    String _year=DateTime.now().year.toString();
    String key;
    //for each year
    for (int m=0; m<12; m++){
      double TotalForMonth=0;
      String _month=(m+1).toString();

      //for each month
      for (int d=1; d<31; d++){
        String _day=d.toString();

        key= _day+"-"+_month+"-"+_year;

        String SingleShift_= sp.getString(key);

        if (SingleShift_!=null) {
          Object Jsondecode= json.decode(SingleShift_);
          SingleShift s= SingleShift.SingleShiftFromJson(Jsondecode);

          //se non è valorizzato il guardagno per ogni ora straordinaria prendere quello di default
          //altrimenti prendere il valore settato
          double Straordinari;
          if (s.AdditionalPayment!=0.0){
            Straordinari= s.AdditionalPayment*s.AdditionalHours;
          }
          else  {
            Straordinari= ShiftSetting.PaymentForHour*s.AdditionalHours;
          }
          TotalForMonth+= (Straordinari+PaymentForShift);
        }
       // print("${_month} --------------> ${TotalForMonth}");

      }
      _totalPayment.add(TotalForMonth);
    }
    return _totalPayment;
  }

  //Write model
  saveModel(BaseModel model) async{

    SharedPreferences sp= await SharedPreferences.getInstance();
    //Getting model in Json
    String JsonEncode=json.encode(model.getClassInJson());

    //Saving model
    sp.setString(model.Key, JsonEncode);
  }

  removeModelFromKey(String Key) async  {
      SharedPreferences sp= await SharedPreferences.getInstance();
      sp.remove(Key);
  } 

  //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  // 1- this method required the date, it is called _datetime in calendar class
  //  I am looking a way to get that information from calendar class on swap the tab bar
  // e.g. _dataManager.getTotalHoursAndTotalMoneyFromMonth(MyDateTime);
  //
  // 2- Remove the void statement and replace it with Future<List<double>>
  //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  //Future<List<double>>
  Future<List<double>> getTotalHoursAndTotalMoneyFromMonth (DateTime date)  {

    List<double> result;
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    //Remove this rows when the method @settingUpSharedPreferences will be implemented
    ShiftSettings shiftSettings= ShiftSettings(5,7);
    saveModel(shiftSettings);
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

      return getMonthlyShiftFromDate(date).then(( List <SingleShift> shifts)  {

      if (shifts==null){return null;}

      return readShiftSettingsFromKey().then((ShiftSettings shiftSettings) {

        if (shiftSettings==null){return null;}

        double PaymentForShift= shiftSettings.getPaymentForShift();
        double HoursPerShift= shiftSettings.DurationInHours;

        //get shifts of a specific month

        int TotaleDaysWorked=shifts.length;

        double TotaleAdditionalPayment=0;
        double TotalAdditionHours=0;

        for (SingleShift s in shifts){
          TotaleAdditionalPayment+= s.AdditionalPayment;
          TotalAdditionHours+=s.AdditionalHours;
        }

       result= new List<double>();


        double TotalePayment = (PaymentForShift*TotaleDaysWorked) + TotaleAdditionalPayment;
        double TotalHours = (HoursPerShift*TotaleDaysWorked) + TotalAdditionHours;


        /*print(TotaleDaysWorked);
        print(TotalePayment);
        print(TotalHours);*/

        result.add(TotaleDaysWorked.toDouble());
        result.add(TotalePayment);
        result.add(TotalHours);

        return result;
      });
    });

  }


}