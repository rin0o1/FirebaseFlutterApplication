import 'package:shared_preferences/shared_preferences.dart';

class DataManager
{

  //Iniziallizando il file
  settingUpSharedPreferences() async{

    String IsSetKey="SharedPreferenceIsAlreadySetUp";

    SharedPreferences sp =  await SharedPreferences.getInstance();
    bool Value= sp.getBool('Value');

    //Already set
    if (Value){return;}

    //setting up default settings



    //Now the file is set up
    sp.setBool(IsSetKey, true);


  }

  addStringToFile() async{
    print("Getting instance...");
    SharedPreferences sp= await SharedPreferences.getInstance();
    print("Setting value...");
    sp.setString('stringValue', "Voenoinrevobnrteiouvbnrtoiu");
  }


  getDataStringValue() async{
    print("Getting instance...");
    SharedPreferences sp= await SharedPreferences.getInstance();
    print("Getting value...");
    String res= sp.getString('stringValue');
    print("=============================================== $res");
  }

}