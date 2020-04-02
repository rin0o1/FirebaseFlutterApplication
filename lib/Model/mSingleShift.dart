import 'dart:ui';

import 'package:easyqueue/Model/mBaseModel.dart';

class SingleShift extends BaseModel
{
  String Date;
  String AdditionalDurationInHours;
  String AdditionalPaymentForHour;
  String Notes;

  SingleShift (DateTime Date, [String AdditionDurationInHours,
    String AdditionPaymentForHour, String Notes])
  {
    buildKey(Date);
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
        Date= json['Date'] ,
        AdditionalDurationInHours=json['AdditionalDurationInHours'],
        AdditionalPaymentForHour = json['AdditionalPaymentForHour'],
        Notes= json['Notes']    ;

  setKeyFromJson()
  {
    Key=Date.toString();
  }

  buildKey(DateTime date)
  {
    String Month= date.month.toString();
    String Day=date.day.toString();
    String Year= date.year.toString();
    Key= Day +"-"+ Month + "-" + Year;
    Date= Key;
  }

  setDate(DateTime dateTime) {
    buildKey(dateTime);

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