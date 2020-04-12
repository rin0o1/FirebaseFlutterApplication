
import 'package:easyqueue/Model/mBaseModel.dart';

class ShiftSettings extends BaseModel
{

  double DurationInHours;
  double PaymentForHour;

  

  ShiftSettings(double DurationInHours, double PaymentForHours){

    Key="ShiftSettings";
    this.DurationInHours=DurationInHours;
    this.PaymentForHour=PaymentForHours;
  }

  setDurationInHours(double DurationInHoursInString){
    this.DurationInHours=DurationInHoursInString;
  }

  setPaymentForHour(double PaymentForHour){
    this.PaymentForHour=PaymentForHour;
  }


  //Costruct this class from Json
  ShiftSettings.ShiftSettingsFromJson ( Map<String, dynamic> json )
          :
            DurationInHours= double.parse( json['DurationInHours']),
            PaymentForHour = double.parse( json['PaymentForHour'] );

  //Save proprieties in Json
  @override
  Map<String, dynamic> getClassInJson() => {

    'DurationInHours': DurationInHours.toString(),
    'PaymentForHour': PaymentForHour.toString()
  };


  double getPaymentForShift(){
    return DurationInHours * PaymentForHour;
  }



}