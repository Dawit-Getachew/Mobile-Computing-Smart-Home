import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mobile_computing_smart_home/screen/Rooms/BedRoomDevices.dart';
import 'package:mobile_computing_smart_home/screen/Rooms/GuestRoom.dart';
import 'package:mobile_computing_smart_home/screen/Rooms/KitchenDevices.dart';
import 'package:mobile_computing_smart_home/screen/Rooms/LivingRoomDevices.dart';
import 'package:mobile_computing_smart_home/screen/Rooms/MyHome.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> items = [
    "My Home",
    "Living Room",
    "Bed Room",
    "Kitchen",
    "Guest Room",
  ];
  static final List<Widget> _widgetRoom = <Widget>[
    const MyHome(),
    const LivingRoom(),
    const BedRoom(),
    const Kitchen(),
    const GuestRoom(),
  ];
  int current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color(0x44000000),
        leading: IconButton(
          onPressed: (){
            Navigator.pushNamed(context, "/SignIn");
          },
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          Container(
            width: 30,
            height: 30,
            child: IconButton(
                onPressed: (){
                  Navigator.pushNamed(context, "/Profile");
                }, 
                icon: Icon(Icons.person,color: HexColor('#6FC1C5'),)
            ),
            ),
          SizedBox(width: 20,)
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome, Abel',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        child: const Icon(
                          Icons.cloudy_snowing,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '24 Dec 2022',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                          fontFamily: 'Oxanium',
                        ),
                      ),
                      SizedBox(
                        width: 170,
                      ),
                      Icon(
                          Icons.add_circle,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Add Device',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: 'Oxanium'
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20,0,0,0),
                    child: Text(
                        'OverView',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat'
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: Container(
                      height: 100,
                      width: 360,
                      decoration: BoxDecoration(
                        color: HexColor('6FC1C5'),
                          borderRadius: BorderRadius.all( Radius.circular(20.0))
                      ),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Padding(
                                  padding: EdgeInsets.fromLTRB(20,30,8,0),
                                child: Text(
                                    'Electric Usage',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: 'Oxanium',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0,0,0,0),
                                child: Text(
                                  ' Dec 1 - Dec 24',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontFamily: 'Oxanium',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 100,),
                          Padding(
                            padding: EdgeInsets.fromLTRB(20,8,8,8),
                            child: Text(
                              '720',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontFamily: 'Oxanium',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0,8,8,8),
                            child: Text(
                              'Kwh',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'Oxanium',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: items.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (cxt, index){
                        return GestureDetector(
                          onTap: (){
                            setState(() {
                              current = index;
                            });
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.fromLTRB(15,10,15,10),
                            decoration: BoxDecoration(
                              color: current == index?Colors.white:null,
                              borderRadius: BorderRadius.all( Radius.circular(20.0)),
                              border: Border.all( color: Colors.white,width: 1)
                              ),
                            child: Text(items[index],
                              style: TextStyle(
                                  color: current == index ? Colors.black: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'Oxanium',
                              ),
                            ),
                          ),
                        );
                      }),
                  ),
                  // --------  Controlles Section(light,speacker,Tv,)  ------
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.all(12),
                    width: double.infinity,
                    height: 400,
                    child: _widgetRoom[current],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
