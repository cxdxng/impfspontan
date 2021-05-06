import 'package:flutter/material.dart';
import 'package:impfspontan/Home.dart';
import 'package:impfspontan/Register.dart';
import 'BackgroundTask.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      "/": (context) => Login(),
      "/register": (context) => Register(),
      "/home": (context) => Home(),
    },
  ));
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  Color accent = Color(0xff59dc89);

  // Create Controller for Textfields
  final emailController = TextEditingController();
  final passController = TextEditingController();

  // Create necessary Variables
  bool errMsgVisible = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "ImpfSpontan",
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold
                      ),
                    ),

                    SizedBox(width: 20,),

                    Image.asset("assets/fast.png", height: 70,),
                    
                  ],
                ),
                SizedBox(height: 150),

                Visibility(
                  visible: errMsgVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text(
                      "Die angegebenen Daten sind falsch",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 16
                      ),
                    ),
                  ),
                ),

                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'E-mail'
                  ),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: passController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Passwort'
                  ),
                ),
                SizedBox(height: 20,),
                Center(
                  child: TextButton(
                    onPressed: () => letDataCheck(),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 24,
                        color: accent
                      ),
                    ),
                  ),
                ),
                
                Center(
                  child: TextButton(
                    onPressed: (){
                      Navigator.pushNamed(context, "/register");
                    },
                    child: Text(
                      "Registrieren",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.grey
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Check data entered from user
  void letDataCheck(){
    bool isDataCorrect = Background().checkData(emailController.text, passController.text);
    // If data is correct the homescreen will be shown
    // otherwise the user will getan error message
    if(isDataCorrect){
      Navigator.pushReplacementNamed(context, "/home");
    }else{
      setState(() {
        errMsgVisible = true;
      });
    }
  }
}


