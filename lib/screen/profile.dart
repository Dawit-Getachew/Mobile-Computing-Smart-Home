import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),

        backgroundColor: Color(0x44000000),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children:  [
          const Padding(
            padding: EdgeInsets.only(bottom:45), //apply padding to all four sides
            child: Text("User Profile", style: TextStyle(color: Colors.white, fontSize:35.0 )),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom:45),
            child: CircleAvatar(
              radius: 50.0,
              backgroundColor:Colors.white,
            ),
          ),
          Card(
            color: HexColor('242424'),
            shape: RoundedRectangleBorder( //<-- SEE HERE
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const <Widget>[
                  ListTile(
                    leading: Icon(Icons.person,color: Colors.white,),
                    title: Text('Name',style: TextStyle(color: Colors.white)),
                    subtitle: Text('Some Dude',textAlign: TextAlign.center,style: TextStyle(color: Colors.grey)),
                  ),
                ]
            ),
          ),
          Card(
            color: HexColor('242424'),
            shape: RoundedRectangleBorder( //<-- SEE HERE
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const <Widget>[
                  ListTile(
                    leading: Icon(Icons.person,color: Colors.white,),
                    title: Text('Name',style: TextStyle(color: Colors.white)),
                    subtitle: Text('Some Dude',textAlign: TextAlign.center,style: TextStyle(color: Colors.grey)),
                  ),
                ]
            ),
          ),
          Card(
            color: HexColor('242424'),
            shape: RoundedRectangleBorder( //<-- SEE HERE
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const <Widget>[
                  ListTile(
                    leading: Icon(Icons.person,color: Colors.white,),
                    title: Text('Name',style: TextStyle(color: Colors.white)),
                    subtitle: Text('Some Dude',textAlign: TextAlign.center,style: TextStyle(color: Colors.grey)),
                  ),
                ]
            ),
          ),
        ],
      ),
    );
  }
}

