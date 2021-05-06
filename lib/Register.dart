import 'package:flutter/material.dart';
import 'package:impfspontan/BackgroundTask.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  TextEditingController name = TextEditingController();
  TextEditingController vorname = TextEditingController();
  TextEditingController gebDat = TextEditingController();
  TextEditingController addr = TextEditingController();
  TextEditingController tel = TextEditingController();
  TextEditingController vorerkrank = TextEditingController();

  List<TextEditingController> controllerList = [TextEditingController(), TextEditingController(), TextEditingController(), TextEditingController(), TextEditingController(), TextEditingController(), TextEditingController()];
  List<String> attributes = ["Vollständiger Name", "Passwort erstellen", "Geburtsdatum", "Adresse", "E-Mail Adresse", "Telefonnummer", "Vorerkrankung"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            
            children: [
              SizedBox(height: 15),
              Text(
                "Registrieren",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold
                ),
              ),

              SizedBox(height: 50),

              Expanded(
                child: ListView.builder(
                  itemCount: controllerList.length,
                  itemBuilder: (BuildContext context, int index){
                    return Container(
                      child: Column(
                        children: [
                          TextField(
                            controller: controllerList[index],
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: attributes[index]
                            ),
                          ),
                          SizedBox(height: 15),
                        ],
                      ),
                    );
                  },
                ),
              ),

              
              TextButton(
                onPressed: (){

                  Background().createListAndRegister(controllerList);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Registrieren",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white
                    ),
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green[400])
                ),
              ),
              SizedBox(height: 10,),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Zurück zur Anmeldung",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white
                    ),
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.grey[700])
                ),
              )
              
            ],
          ),
        ),
      ),
    );
  }
}