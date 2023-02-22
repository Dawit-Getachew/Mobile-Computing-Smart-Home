import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class LivingRoom extends StatefulWidget {
  const LivingRoom({Key? key}) : super(key: key);

  @override
  State<LivingRoom> createState() => _LivingRoomState();
}

class _LivingRoomState extends State<LivingRoom> {
  bool door = false;
  bool light1 = false;
  bool TvSet = false;
  bool Fan = false;
  bool speaker = false;

  bool prev = false;
  bool play = false;
  bool next = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          children: [
            Container(
              height: 150,
              width: 240,
              decoration: BoxDecoration(
                color: HexColor('242424'),
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child: Row(
                children: [
                  Container(
                    height:120,
                    child: Image.asset('images/smart-door.png'),
                  ),
                  SizedBox(width: 10,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Main Door',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: (){
                          setState(() {
                            door = !door;
                          });
                        },
                        icon: door?
                        Icon(Icons.toggle_on,color: HexColor('6FC1C5'),size: 50,) :
                        Icon(Icons.toggle_off,color: Colors.grey,size: 50,),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: 10,),
            Container(
              height: 150,
              width: 116,
              decoration: BoxDecoration(
                color: HexColor('242424'),
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const[
                  Text('Room Temp',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '36',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontFamily: 'Oxanium',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'celsius',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: 10,),

        Container(
          height: 150,
          width: 70,
          decoration: BoxDecoration(
            color: HexColor('242424'),
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Image.asset('images/air-conditioner.png'),
              ),
              SizedBox(width: 30,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Air Conditioner',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  IconButton(
                    onPressed: (){
                      setState(() {
                        Fan = !Fan;
                      });
                    },
                    icon: Fan?
                    Icon(Icons.toggle_on,color: HexColor('6FC1C5'),size: 50,) :
                    Icon(Icons.toggle_off,color: Colors.grey,size: 50,),
                  ),
                ],
              ),
            ],
          ),
        ),

        SizedBox(height: 10,),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 170,
              height: 120,
              decoration: BoxDecoration(
                color: HexColor('242424'),
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child: Column(
                children: [
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.lightbulb_circle, color: light1? HexColor('6FC1C5') : Colors.grey ,size: 40,),
                      SizedBox(width: 25,),
                      IconButton(
                        onPressed: (){
                          setState(() {
                            light1 = !light1;
                          });
                        },
                        icon: light1?
                        Icon(Icons.toggle_on,color: HexColor('6FC1C5'),size: 40,) :
                        Icon(Icons.toggle_off,color: Colors.grey,size: 40,),
                      ),
                    ],
                  ),
                  Text(
                    'Smart Lamp',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                      'Active for 8hr',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'Montserrat'
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 25,),
            Container(
              width: 170,
              height: 120,
              decoration: BoxDecoration(
                color: HexColor('242424'),
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child: Column(
                children: [
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.tv, color: TvSet? HexColor('6FC1C5') : Colors.grey ,size: 40,),
                      SizedBox(width: 25,),
                      IconButton(
                        onPressed: (){
                          setState(() {
                            TvSet = !TvSet;
                          });
                        },
                        icon: TvSet?
                        Icon(Icons.toggle_on, color: HexColor('6FC1C5'),size: 40,) :
                        Icon(Icons.toggle_off,color: Colors.grey,size: 40,),
                      ),
                    ],
                  ),
                  Text(
                    'Smart Tv',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text( TvSet? 'online'
                    :'offline',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Montserrat'
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: 10,),

        Container(
          height: 150,
          width: 170,
          decoration: BoxDecoration(
            color: HexColor('242424'),
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Image.asset('images/speaker.png'),
              ),
              SizedBox(width: 30,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Smart Sound System',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  IconButton(
                    onPressed: (){
                      setState(() {
                        speaker = !speaker;
                      });
                    },
                    icon: speaker?
                    Icon(Icons.power_settings_new_rounded,color: HexColor('6FC1C5'),size: 50,) :
                    Icon(Icons.power_settings_new_outlined,color: Colors.grey,size: 50,),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: (){
                          setState(() {
                            prev = !prev;
                          });
                        },
                        icon: prev?
                        Icon(Icons.skip_previous,color: HexColor('6FC1C5'),size: 30,) :
                        Icon(Icons.skip_previous,color: Colors.grey,size: 30,),
                      ),
                      IconButton(
                        onPressed: (){
                          setState(() {
                            play = !play;
                          });
                        },
                        icon: play?
                        Icon(Icons.pause,color: HexColor('6FC1C5'),size: 30,) :
                        Icon(Icons.play_arrow,color: Colors.grey,size: 30,),
                      ),
                      IconButton(
                        onPressed: (){
                          setState(() {
                            next = !next;
                          });
                        },
                        icon: next?
                        Icon(Icons.skip_next,color: HexColor('6FC1C5'),size: 30,) :
                        Icon(Icons.skip_next,color: Colors.grey,size: 30,),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
