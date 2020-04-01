
import 'dart:ui';

import 'package:easyqueue/Model/mBaseModel.dart';

class SingleShift extends BaseModel
{
  DateTime Date;
  String AdditionalDurationInHours;
  String AdditionalPaymentForHour;
  String Notes;

  SingleShift ([DateTime Date, String AdditionDurationInHours,
               String AdditionPaymentForHour, String Notes])
  {
    this.Date=Date ;

    setKey();

    this.AdditionalDurationInHours=AdditionDurationInHours;
    this.AdditionalPaymentForHour=AdditionPaymentForHour;
  }


  @override
  Map<String, dynamic> getClassInJson() => {
    'Date': Date,
    'AdditionalDurationInHours': AdditionalDurationInHours,
    'AdditionalPaymentForHour': AdditionalPaymentForHour,
     'Notes': Notes
  };



  SingleShift.setClassFromJson ( Map<String, dynamic> json )
      :
        Date= json['Date'],
        AdditionalDurationInHours=json['AdditionalDurationInHours'],
        AdditionalPaymentForHour = json['AdditionalPaymentForHour'],
        Notes= json['Notes']    ;


  setKey()
  {
    Key=Date.toString();
  }

  setDate(DateTime dateTime) {
      this.Date=dateTime;
  }
  setAdditionalDurationInHours(String additionaldurationinhours){
    this.AdditionalDurationInHours=additionaldurationinhours;
  }
  setAdditionalPaymentForHour(String additionpaymentforhour){
    this.AdditionalPaymentForHour=additionpaymentforhour;
  }
  setNotes(String notes) {
    this.Notes=notes;
  }




}