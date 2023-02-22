import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mobile_computing_smart_home/screen/Bottom_Navigation.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'package:firebase_auth/firebase_auth.dart';


class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isAPIcallProcess = false;
  bool hidePassword = true;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? email;
  String? password;


  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
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
            child: _loginUI(context),
          ),
          inAsyncCall: isAPIcallProcess,
          opacity: 0.3,
          key: UniqueKey(),
        ),
      ),
    );
  }

  Widget _loginUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
          ),
          Padding(
            padding: EdgeInsets.only(left: 100, top: 180),
            child: Text(
              "SMART HOME",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(40, 5, 40, 5),
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
              padding: const EdgeInsets.fromLTRB(40, 5, 40, 5),
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
                  prefixIcon: Icon(
                    Icons.key,
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
          SizedBox(height: 20,),
          // ElevatedButton.icon(
          //   icon: Icon(Icons.lock_open),
          //     label: Text('Login'),
          //     onPressed: LOgin
          // ),
          Center(
            child: FormHelper.submitButton(
              'Login', () {
                if (validateAndSave()) {
                  FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text)
                      .then((value) {
                        Navigator.pushNamedAndRemoveUntil(context, '/BottomBar', (route) => false);
                      } );
                }
                Navigator.pushNamedAndRemoveUntil(context, '/BottomBar', (route) => false);
                },
                btnColor: HexColor('#6FC1C5'),
                borderColor: Colors.black,
                txtColor: Colors.white,
                borderRadius: 10,
            ),
          ),
          SizedBox(height: 10,),
          Center(
            child: Text(
              "OR",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
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
                        text: 'Don\'t have an account?',
                        style: TextStyle(color: Colors.grey)),
                    TextSpan(
                        text: 'SignUp',
                        style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, "/SignUp");
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

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  Future LOgin()async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
  }
}