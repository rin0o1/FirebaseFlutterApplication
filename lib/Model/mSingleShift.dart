import 'dart:ui';

import 'package:easyqueue/Model/mBaseModel.dart';

class SingleShift extends BaseModel
{
  DateTime Date;
  String AdditionalDurationInHours;
  String AdditionalPaymentForHour;
  String Notes;

  SingleShift (DateTime Date, [String AdditionDurationInHours,
    String AdditionPaymentForHour, String Notes])
  {
    this.Date=Date;
    buildKey();
    this.AdditionalDurationInHours=AdditionDurationInHours;
    this.AdditionalPaymentForHour=AdditionPaymentForHour;
  }


  @override
  Map<String, dynamic> getClassInJson() => {
    'Key' :Key,
    'Date': Date,
    'AdditionalDurationInHours': AdditionalDurationInHours,
    'AdditionalPaymentForHour': AdditionalPaymentForHour,
    'Notes': Notes
  };



  SingleShift.SingleShiftFromJson ( Map<String, dynamic> json )
      :
        Date= json['Date'],
        AdditionalDurationInHours=json['AdditionalDurationInHours'],
        AdditionalPaymentForHour = json['AdditionalPaymentForHour'],
        Notes= json['Notes']    ;

  setKeyFromJson()
  {
    Key=Date.toString();
  }

  buildKey()
  {
    String Month= Date.month.toString();
    String Day=Date.day.toString();
    String Year= Date.year.toString();
    Key= Day +"-"+ Month + "-" + Year;
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