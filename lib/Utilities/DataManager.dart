import 'dart:convert';
import 'package:easyqueue/Model/mBaseModel.dart';
import 'package:flutter/cupertino.dart';
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
    ShiftSettings shiftSettings= ShiftSettings('5','7');
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
    return ShiftSettings.ShiftSettingsFromJson(JsonDecode);
  }

    //if month is null means that is required current month
   Future<List<SingleShift>> readMonthlyShiftFromDate( [String Date]) async{

    String Month= Date ?? DateTime.now().month.toString();
    String Year = Date ?? DateTime.now().year.toString();


    SharedPreferences sp= await SharedPreferences.getInstance();

    List<SingleShift> Shifts=new List<SingleShift>();

    for(int i=1; i<31; i++)
    {

      //Finding shift from month
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
        return Shifts;
      }
    }

    return null;

  }

  //During the application initialization
  getTotalInformation(){}

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



}