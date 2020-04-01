
import 'package:easyqueue/Model/mBaseModel.dart';

class ShiftSettings extends BaseModel
{

  String DurationInHours;
  String PaymentForHour;

  ShiftSettings(String DurationInHoursInString, String PaymentForHoursInString){

    Key="ShiftSettings";
    this.DurationInHours=DurationInHoursInString;
    this.PaymentForHour=PaymentForHoursInString;
  }

  setDurationInHours(String DurationInHoursInString){
    this.DurationInHours=DurationInHoursInString;
  }

  setPaymentForHour(String PaymentForHour){
    this.PaymentForHour=PaymentForHour;
  }


  //Costruct this class from Json
  ShiftSettings.ShiftSettingsFromJson ( Map<String, dynamic> json )
          : DurationInHours= json['DurationInHours'],
            PaymentForHour = json['PaymentForHour'] ;

  //Save proprieties in Json
  @override
  Map<String, dynamic> getClassInJson() => {
    'DurationInHours': DurationInHours,
    'PaymentForHour': PaymentForHour
  };

  //Save one proprieties in Json



}