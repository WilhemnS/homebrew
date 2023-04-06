import 'package:flutter/material.dart';
import 'package:homebrew/screens/cups.dart'; 
import 'package:homebrew/models/coffee.dart';


class ChooseDeviceScreen extends StatefulWidget {
  
  ChooseDeviceScreen();

  @override
  _ChooseDeviceScreenState createState() => _ChooseDeviceScreenState();
}

class _ChooseDeviceScreenState extends State<ChooseDeviceScreen> {

  bool frenchPress = false;
  bool dripMachine = false;
  bool continueButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Center(
            child: SizedBox(
              width: 309,
              height: 22,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  "What coffee maker are you using?",
                  textAlign: TextAlign.center,
                  key: Key('device'),
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: Color(0xFF4C748B),
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 24),
          
          Container(
            width: 337,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Color(0xFF4C748B), width: 2),
              ),
            ),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    'French Press',
                    key: Key('french-press'),
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF4C748B),
                    ),
                  ),
                  trailing: frenchPress ? Icon(Icons.check, color: Color(0xFF4C748B)) : Icon(Icons.check, color: Colors.transparent),
                  onTap: (){
                    if(frenchPress){
                      frenchPress = !frenchPress;
                      continueButton = !continueButton;
                    }else{
                      frenchPress = !frenchPress;
                      dripMachine = false;
                      continueButton = true;
                    }
                    setState(() {});
                  }, 
                ),
                Divider(
                  height: 1,
                  thickness: 2,
                  color: Color(0xFF4C748B),
                ),
                ListTile(
                  title: Text(
                    'Drip Machine',
                    key: Key('drip-machine'),
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF4C748B),
                    ),
                  ),
                  trailing: dripMachine ? Icon(Icons.check, color: Color(0xFF4C748B)) : Icon(Icons.check, color: Colors.transparent),
                  onTap: (){
                    if(dripMachine){
                      dripMachine = !dripMachine;
                      continueButton = !continueButton;
                    }else{
                      dripMachine = !dripMachine;
                      frenchPress = false;
                      continueButton = true;
                    }
                    setState(() {});
                  }, 
                ),
              ],
            ),
          ),

          SizedBox(height: 24),

          ElevatedButton(
            onPressed: () {
              setState(() {
                if(continueButton){
                  if(frenchPress){
                    Navigator.push(context, 
                      MaterialPageRoute(builder: (context)=>CupsScreen(Homebrew("french_press"))));     
                  }
                  if(dripMachine){
                    Navigator.push(context, 
                      MaterialPageRoute(builder: (context)=>CupsScreen(Homebrew("drip_machine"))));        
                  }                  
                }
              });
            },
            child: Text(
                "Continue",
                key: Key('continue1'),
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: continueButton? Colors.white: Color(0xFF757474),
                ),
              ), 
              style: ElevatedButton.styleFrom(
              minimumSize: Size(280, 46),
              primary: continueButton ? Color(0xFF4C748B) : Color(0xFFE2E2E2), 
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 0, 
            ),
          ),
        ],
      )
    );
  }
}
