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
    Object JsonDecode= json.decode(sp.getString(key));
    ShiftSettings shift = ShiftSettings.ShiftSettingsFromJson(JsonDecode);
    return shift ;
  }

   //if month is null means that is required current month
  Future<List<SingleShift>> readMonthlyShiftFromDate( [DateTime Date]) async{


    String Month= Date.month.toString() ?? DateTime.now().month.toString();
    String Year = Date.year.toString() ?? DateTime.now().year.toString();



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
        s.setDoubelValueFromStrings();
        s.setKeyFromJson();
        Shifts.add(s);
      }
    }
    return Shifts;
  }


  //Write model
  saveModel(BaseModel model) async{

    SharedPreferences sp= await SharedPreferences.getInstance();
    //Getting model in Json
    String JsonEncode=json.encode(model.getClassInJson());
    print(JsonEncode);
    //Saving model
    sp.setString(model.Key, JsonEncode);
  }

  removeModelFromKey(String Key) async  {
      SharedPreferences sp= await SharedPreferences.getInstance();
      sp.remove(Key);
  }

  //Future<List<double>>
  void getTotalHoursAndTotalMoneyFromMonth ([DateTime date]) async{

    readMonthlyShiftFromDate(date).then(( List <SingleShift> shifts) {

      if (shifts==null){return;}

      readShiftSettingsFromKey().then((ShiftSettings shiftSettings) {

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

        List<double> result= new List<double>();

        double TotalePayment = (PaymentForShift*TotaleDaysWorked) + TotaleAdditionalPayment;
        double TotalHours = (HoursPerShift*TotaleDaysWorked) + TotalAdditionHours;

        print(TotalePayment);
        print(TotalHours);

        result.add(TotalePayment);
        result.add(TotalHours);


      });

      //return result;

    });



  }



}