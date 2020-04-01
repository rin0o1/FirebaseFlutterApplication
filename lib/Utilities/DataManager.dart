import 'dart:convert';
import 'package:easyqueue/Model/mBaseModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:easyqueue/Model/mShiftSettings.dart';
import 'package:easyqueue/Model/mSingleShift.dart';

class DataManager
{
  //Iniziallizando il file
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


  Future<ShiftSettings> readShiftSettingsFromKey() async{
    String key="ShiftSettings";
    SharedPreferences sp= await SharedPreferences.getInstance();
    Object JsonDecode= json.decode(sp.getString(key));
    return ShiftSettings.ShiftSettingsFromJson(JsonDecode);

  }



  //Write model
  saveModel(BaseModel model) async{
    SharedPreferences sp= await SharedPreferences.getInstance();
    String JsonEncode=json.encode(model.getClassInJson());
    print(JsonEncode);
    sp.setString(model.Key, JsonEncode);
  }

  removeModelFromKey(String Key) async
  {
    SharedPreferences sp= await SharedPreferences.getInstance();
    sp.remove(Key);

  }



}