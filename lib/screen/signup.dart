// import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_computing_smart_home/screen/Home.dart';
import 'package:mobile_computing_smart_home/screen/login.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';



class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isAPIcallProcess = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  late DatabaseReference userDB;

  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  bool? autoValidate = false;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? confirmPassword;


  bool hidePassword = true;
  @override
  void initState(){
    super.initState();
    userDB = FirebaseDatabase.instance.ref().child('Users');
  }
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: ProgressHUD(
          child: Form(
            key: globalFormKey,
            child: _SignUpUI(context),
          ),
          inAsyncCall: isAPIcallProcess,
          opacity: 0.3,
          key: UniqueKey(),
        ),
      ),
    );
  }

  Widget _SignUpUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 80,
          ),
          Padding(
            padding: EdgeInsets.only(left: 50, top: 80),
            child: Text(
              "SignUp to SMART HOME",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: HexColor('#6FC1C5'),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
              child: TextFormField(
                // ignore: non_constant_identifier_names
                validator: (Value) {
                  if (Value == null || Value.isEmpty) {
                    return "First Name cannot be empty";
                  } else if (Value.length < 3) {
                    return 'First Name must be more than 2 character';
                  }
                  return null;
                },
                // onSaved: ((newValue) {
                //   firstName = newValue;
                // }),
                style: TextStyle(color: Colors.white,),
                controller: firstNameController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(6),
                  hintText: 'FirstName',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  prefixIcon: Icon(Icons.person,color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: HexColor('#6FC1C5'),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              )),
          Padding(
              padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
              child: TextFormField(
                validator: (Value) {
                  if (Value == null || Value.isEmpty) {
                    return "Last Name cannot be empty";
                  }
                  return null;
                },
                onSaved: (ValueKey) {
                  lastName = ValueKey;
                },
                style: TextStyle(color: Colors.white,),
                controller: lastNameController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(6),
                  hintText: 'LastName',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  prefixIcon: Icon(Icons.person,color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      )),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: HexColor('#6FC1C5'),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              )),
          Padding(
              padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
              child: TextFormField(
                validator: (Value) {
                  if (Value == null || Value.isEmpty) {
                    return "email cannot be empty";
                  }
                  return null;
                },
                onSaved: (newValue) {
                  email = newValue;
                },
                style: TextStyle(color: Colors.white,),
                controller: emailController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(6),
                  hintText: 'email',
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      )),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: HexColor('#6FC1C5'),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              )),
          Padding(
              padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
              child: TextFormField(
                validator: (Value) {
                  if (Value == null || Value.isEmpty) {
                    return "password cannot be empty";
                  }
                  return null;
                },
                onSaved: (newValue) {
                  password = newValue;
                },
                obscureText: true,
                style: TextStyle(color: Colors.white,),
                controller: passwordController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(6),
                  hintText: 'password',
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                  prefixIcon: Icon(Icons.key,color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      )),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: HexColor('#6FC1C5'),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              )),
          Padding(
              padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
              child: TextFormField(
                validator: (Value) {
                  if (Value == null || Value.isEmpty) {
                    return "password cannot be empty";
                  } else if (Value != passwordController.text) {
                    return "password doesn't Match";
                  }
                  return null;
                },
                onSaved: (newValue) {
                  confirmPassword = newValue;
                },
                obscureText: true,
                style: TextStyle(color: Colors.white,),
                controller: confirmPasswordController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(6),
                  hintText: 'ConfirmPassword',
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                  prefixIcon: Icon(Icons.key,color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      )),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: HexColor('#6FC1C5'),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              )),
          SizedBox(
            height: 20,
          ),
          Center(
            child: FormHelper.submitButton(
              'SignUp',
                    (){
                if (_validateInputs()) {
                  Map<String, String> Users = {
                    'firstName': firstNameController.text,
                    'lastName': lastNameController.text,
                    'email':emailController.text,
                    'password': passwordController.text
                  };
                    FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text).then((value) {
                          print("Successfully ");
                      Navigator.push(context,MaterialPageRoute(builder: (context)=> Home()));
                    }).onError((error, stackTrace) {
                      print("Error ${error.toString()}");
                    });

                  userDB.push().set(Users);
                }

              },
              btnColor: HexColor('#6FC1C5'),
              borderColor: Colors.black,
              txtColor: Colors.white,
              borderRadius: 10,
              ),
            ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              "OR",
              style: TextStyle(
                  color: HexColor('#6FC1C5'),
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(right: 25.0, top: 5),
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14.0,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'already have an account?',
                        style: TextStyle(color: Colors.grey)),
                    TextSpan(
                        text: 'Login',
                        style: TextStyle(
                          color: HexColor('#6FC1C5'),
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, "/SignIn");
                          }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool _validateInputs() {
    if (globalFormKey.currentState!.validate()) {
      globalFormKey.currentState!.save();
      return true;
    }
    return false;
  }

}
