import 'package:flutter/material.dart';
import 'package:homebrew/screens/recommended.dart';
import 'package:homebrew/models/coffee.dart';

class CupsScreen extends StatefulWidget {

  final Homebrew maker;
  CupsScreen(this.maker);

  @override
  _CupsScreen createState() => _CupsScreen();
}

class _CupsScreen extends State<CupsScreen> {

  final cupsTextController = TextEditingController();
  String numCups;
  bool continueButton = false;
  bool validInput = false;

  @override

  Widget build(BuildContext context) {

    numCups = cupsTextController.text;

    return Scaffold(

      appBar: AppBar(
        leading: IconButton(
            key: Key('back1'),
            onPressed: () {
              setState(() {
                Navigator.pop(context);
              });
            },
            icon: Icon(Icons.arrow_back_ios)),
        backgroundColor: Colors.transparent,
        foregroundColor: Color(0xFF4C748B),
        elevation: 0,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(
              "How many cups would you like?", textAlign: TextAlign.center,
              key: Key('cups'),
              style: TextStyle(
                fontFamily: 'Montserrat', 
                fontWeight: FontWeight.w400,
                fontSize: 18,
                color: Color(0xFF4C748B),
              ),
            ),
          ),

          SizedBox(height: 24),

          Container(
            width: 337,
            height: 48,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Color(0xFF4C748B), width: 2),
              ),
            ),
            child: TextField( 
              controller: cupsTextController,
              key: Key('cup-input'),
              style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF4C748B), 
              ),
              decoration: InputDecoration(
                border: InputBorder.none,                
                contentPadding: EdgeInsets.all(12),
              ),
              onChanged: (value) {
                setState(() {
                  numCups = value;
                  if(widget.maker.validInput(value) == false){
                    validInput = false;
                    continueButton = false;
                  }else{
                    validInput = true;
                    continueButton = true;
                  }
                });
              },
            ),
          ),

          SizedBox(height: 24),

          ElevatedButton(
            onPressed: () {       
              cupsTextController.clear();              
              setState(() {
                if (validInput == true) {
                  cupsTextController.clear();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RecommendedScreen(widget.maker, int.parse(numCups))),
                  );
                }  
              });
            },
            child: Text(
                "Continue",
                key: Key('continue2'),
                style: TextStyle(
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
