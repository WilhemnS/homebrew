import 'package:flutter/material.dart';
import 'package:homebrew/models/coffee.dart';
import 'package:homebrew/screens/splash_screen.dart';

class RecommendedScreen extends StatefulWidget {

  final Homebrew maker;
  final int numCups; 
  RecommendedScreen(this.maker, this.numCups);

  @override
  _RecommendedScreenState createState() => _RecommendedScreenState();
}

class _RecommendedScreenState extends State<RecommendedScreen> {

  @override

  Widget build(BuildContext context) {

    Map<String, int> recommendations = widget.maker.recommended(widget.numCups, widget.maker.device());

    return Scaffold(

      appBar: AppBar(
        leading: IconButton(
            key: Key('back2'),
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
          Center(
            child: Container(
              width: 337,
              height: 164,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: Color(0xFF4C748B), width: 2),
                ),
              ),
              
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 22,
                    width: 135,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                        child: Text("Recommended",
                        key: Key('recommended'),
                        style: TextStyle(
                          fontFamily: 'Kollektif',
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF4C748B),
                          letterSpacing: 0.1,                
                        )
                      )                  
                    )
                  ),

                  SizedBox(height: 8),

                  Divider(
                    thickness: 2,
                    color: Color(0xFF4C748B),
                    indent: 22,
                    endIndent: 22,
                  ),

                  SizedBox(height: 25),

                  
                  Container(
                    height: 15,
                    width: 202,
                    child: FittedBox(
                      fit: BoxFit.none,
                        child: Text("${recommendations['Coffee']}g - ${widget.maker.coffeeTypes(widget.maker.device())} ground coffee",
                        key: Key('type-coffee'),
                        style: TextStyle(
                          fontFamily: 'Kollektif',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF4C748B),
                          letterSpacing: 0.1,                
                        )
                      )                  
                    )
                  ),

                  SizedBox(height: 4),

                  Container(
                    height: 15,
                    width: 202,
                    child: FittedBox(
                      fit: BoxFit.none,
                        child: Text("${recommendations['Water']}g - water",
                        key: Key('water'),
                        style: TextStyle(
                          fontFamily: 'Kollektif',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF4C748B),
                        )
                      )                  
                    )
                  ),          

                  SizedBox(height: 14),

                  Container(
                    height: 12,
                    width: 162,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                        child: Text("Enjoy your delicious coffee",
                        key: Key('delicious'),
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 10,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF4C748B),
                        )
                      )
                    )
                  ),  
                ], 
              ),  
            ),
          ),
          SizedBox(height: 170),

          ElevatedButton(
            onPressed: () {
                  Navigator.push(context, 
                    MaterialPageRoute(builder: (context)=>SplashScreen()));                      
              setState(() {});
            },
            child: Text(
                "Done",
                key: Key('done'),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFFFFFFF), 
                ),
              ), 
            style: ElevatedButton.styleFrom(
            minimumSize: Size(280, 46),
            primary: Color(0xFF4C748B),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 0, 
          ),
          ),
        ],        
      )
    );
  }
}
