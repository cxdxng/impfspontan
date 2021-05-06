import 'package:flutter/material.dart';

class Background{


  bool checkData(String email, String pass){
    if(email == "test"){
      return true;
    }
    return false;
  } 

  void createListAndRegister(List<TextEditingController> controllerList){
    

    List<String> userData = [];

    for(int i=0; i < controllerList.length; i++){
      print(i);
      userData.add(controllerList[i].text.toString());
    }

    // Call insert method here
    
  }


}