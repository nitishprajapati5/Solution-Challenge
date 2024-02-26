import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mindfuldost_hub/homepage/home1.dart';
import  'package:mindfuldost_hub/models/login_request_model.dart' show Data, loginrequestmodel;
import  'package:mindfuldost_hub/models/login_request_model.dart';
import 'package:mindfuldost_hub/models/login_response_model.dart' hide Data;
import 'package:mindfuldost_hub/services/api_service.dart';
import 'package:mindfuldost_hub/services/share_service.dart';
import 'package:mindfuldost_hub/config.dart';
// import 'package:flutter/foundation.dart';
// import 'package:mindfuldost_hub/models/login_request_model.dart';
// import 'package:flutter_form_helper/flutter_form_helper.dart';



class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}




class _SignInPageState extends State<SignInPage> {
  bool isApiCallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? emailAddress;
  String? password;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Form(
            key: globalFormKey,
            child: signinUI(context),
          ),
          // inAsyncCall: isApiCallProcess,
          key: UniqueKey(),
        ),
      ),
    );
  }

  Widget signinUI(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signin'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // Company Logo
              Image.asset('assets/images/login-signup/logo.png',
                  width: 100, height: 100),

              SizedBox(height: 16.0),

              // Sign In Text
              Text(
                'Sign In to Your Account',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 16.0),

              // Email Input
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 202, 164, 164),
                  border: Border.all(
                    color: Colors.grey,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: ' Email Address',
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email address';
                    }
                    if (!isValidEmail(value)) {
                      return 'Invalid email address';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    emailAddress = value;
                  },
                ),
              ),

              SizedBox(height: 16.0),

              // Password Input
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 202, 164, 164),
                  border: Border.all(
                    color: Colors.grey,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: ' Password',
                    prefixIcon: Icon(Icons.lock),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    password = value;
                  },
                ),
              ),

              SizedBox(height: 16.0),

              // Sign in Button
              ElevatedButton(
                onPressed: () {
                  if (validateAndSave()) {
                    setState(() {
                      isApiCallProcess = false;
                    });
                    loginrequestmodel model = loginrequestmodel(
                      data: Data(
                        emailAddress: emailAddress!,
                        password: password!,
                      ),
                    );
                    APIService.login(model).then((Response) 
                    
                    {
                      debugPrint('Response: $Response');
                      if (Response ) { 
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/age', (route) => false);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Invalid email or password'),
                        ));
                      }
                    });
                  }
                },
                child: Text('Sign In'),
              ),

              SizedBox(height: 16.0),

              // Sign Up Text
              TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/signup', (route) => false);
                },
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Dont have an account?',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      TextSpan(
                        text: ' Sign Up',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 206, 91, 4),
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool isValidEmail(String email) {
    final pattern = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
    final regExp = RegExp(pattern);
    return regExp.hasMatch(email);
  }
  
  bool validateAndSave() {
    
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  
  }
}


class CircleWidget extends StatelessWidget {
  const CircleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 960,
      height: 960,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.green,
                
              
          ),
      );
  }
}
