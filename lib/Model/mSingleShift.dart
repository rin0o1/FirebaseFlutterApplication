import 'dart:ui';

import 'package:easyqueue/Model/mBaseModel.dart';

class SingleShift extends BaseModel
{


  String Date;
  double  AdditionalHours;
  double AdditionalPayment;


  String Notes;

  SingleShift (DateTime Date, [double AdditionHours,
    double AdditionPayment, String Notes])
  {
    buildKey(Date);
    this.AdditionalHours=AdditionHours ?? 0;
    this.AdditionalPayment=AdditionPayment ?? 0;
  }


  @override
  Map<String, dynamic> getClassInJson() => {
    'Key' :Key,
    'Date': Date,
    'AdditionalInHours': (AdditionalHours==null) ? '0' :AdditionalHours.toString(),
    'AdditionalPayment':(AdditionalPayment==null) ? '0' : AdditionalPayment.toString(),
    'Notes': Notes
  };


  SingleShift.SingleShiftFromJson ( Map<String, dynamic> json )
      :
        Date= json['Date'] ,
        AdditionalHours = double.tryParse(json['AdditionalInHours']),
        AdditionalPayment = double.tryParse(json['AdditionalPayment']),
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

  setAdditionalDurationInHoursInString(String additionalhours){

    if(additionalhours==null || additionalhours.isEmpty){return;}

    this.AdditionalHours= (double.tryParse(additionalhours));

  }
  setAdditionalPaymentForHourInString(String additionpayment){

    //se è null or empty
    if (additionpayment==null|| additionpayment.isEmpty ){ return;}

    this.AdditionalPayment= double.parse(additionpayment);

  }

  getAdditionalHoursInStirng()
  {
    return AdditionalHours.toString();
  }

  getAdditionPaymentInString(){
    return AdditionalPayment.toString();
  }

  setNotes(String notes) {
    this.Notes=notes;
  }

}