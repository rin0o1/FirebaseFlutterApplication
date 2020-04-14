
import 'package:easyqueue/Model/mBaseModel.dart';

class ShiftSettings extends BaseModel
{

  double DurationInHours;
  double PaymentForHour;


  ShiftSettings(double DurationInHours, double PaymentForHours){

    setKey();
    this.DurationInHours=DurationInHours;
    this.PaymentForHour=PaymentForHours;
  }

  setDurationInHoursFromString(double DurationInHoursInString){
    this.DurationInHours=DurationInHoursInString;
  }

  setPaymentForHourFromString(double PaymentForHour){
    this.PaymentForHour=PaymentForHour;
  }

  setKey(){
    Key="ShiftSettings";
  }


  //Costruct this class from Json
  ShiftSettings.ShiftSettingsFromJson ( Map<String, dynamic> json )
          :
            DurationInHours= double.tryParse( json['DurationInHours']),
            PaymentForHour = double.tryParse( json['PaymentForHour'] );

  //Save proprieties in Json
  @override
  Map<String, dynamic> getClassInJson() => {

    'DurationInHours': (DurationInHours==null) ? '5': DurationInHours.toString(),
    'PaymentForHour': (PaymentForHour==null) ? '7': PaymentForHour.toString()
  };


  double getPaymentForShift(){
    return DurationInHours * PaymentForHour;
  }



}