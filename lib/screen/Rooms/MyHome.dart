import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  bool Security = false;
  bool lighting = false;
  bool ccTV = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Container(
              height: 160,
              width: 170,
              decoration: BoxDecoration(
                color: HexColor('707BC5'),
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.security_sharp, color: Colors.white,size: 48,),
                    Text(
                      'Security',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      '6 Rooms',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontFamily: 'Montserrat',
                      ),
                    ),
                    IconButton(
                        onPressed: (){
                          setState(() {
                            Security = !Security;
                          });
                        },
                        icon: Security?
                           Icon(Icons.toggle_on,color: Colors.white,size: 40,) :
                           Icon(Icons.toggle_off,color: Colors.grey,size: 40,),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 190,
              width: 170,
              decoration: BoxDecoration(
                color: HexColor('242424'),
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.wifi, color: Colors.white,size: 55,),
                    SizedBox(height: 25,),
                    Text(
                      'Internet',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      '12.11 Mbits/s',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Container(
              height: 190,
              width: 170,
              decoration: BoxDecoration(
                color: HexColor('242424'),
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child: Center(
                child: Column(
                  children: [
                    Icon(Icons.light, color: lighting? Colors.amberAccent : Colors.white,size: 100,),
                    SizedBox(height: 5,),
                    Text(
                      'Lighting',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Center(
                      child: Text(
                        'Living Room - 3 Devices',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: (){
                        setState(() {
                          lighting = !lighting;
                        });
                      },
                      icon: lighting?
                      Icon(Icons.toggle_on,color: Colors.white,size: 40,) :
                      Icon(Icons.toggle_off,color: Colors.grey,size: 40,),
                    ),
                  ],
                ),
              ),

            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 160,
              width: 170,
              decoration: BoxDecoration(
                color: HexColor('242424'),
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Icon(Icons.videocam , color: ccTV? Colors.red : Colors.white,size: 40,),
                    Container(
                      height: 50,
                      width: 50,
                      child: Image.asset('images/cctv.png'),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      'CCTV',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    IconButton(
                      onPressed: (){
                        setState(() {
                          ccTV = !ccTV;
                        });
                      },
                      icon: ccTV?
                      Icon(Icons.toggle_on,color: HexColor('6FC1C5'),size: 40,) :
                      Icon(Icons.toggle_off,color: Colors.grey,size: 40,),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
