import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mindfuldost_hub/config.dart';
import 'package:mindfuldost_hub/homepage/home1.dart';
import 'package:mindfuldost_hub/models/register_request_model.dart' show Data, registratrationrequestmodel;
import 'package:mindfuldost_hub/models/register_request_model.dart';
import 'package:mindfuldost_hub/models/register_response_model.dart' hide Data;
import 'package:mindfuldost_hub/services/api_service.dart';
// import 'package:mindfuldost_hub/services/share_service.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}
class _SignupPageState extends State<SignupPage> {

  bool isApiCallProcess = false;
  bool hidePassword = true;
  static final GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? userName;
  String? password;
  String? email;
  String? confirmpassword;

 bool isValidEmail(String email) {
    final pattern = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
    final regExp = RegExp(pattern);
    return regExp.hasMatch(email);
  }

  bool validateAndSave() {
    
      final form = globalFormKey.currentState!;
      // if(form != null){
      //   form.save();
      //   }
      if (form.validate()) {
        form.save();
        return true;
      }
      return false;
  }
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      body: Center(
        child: Form(
          key: globalFormKey,
          child: signupUI(context),),
          key: UniqueKey(), ),
    ));

    // return signupui(context);
  }
  @override
  Widget signupUI(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Signup'),
      // ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              
              // Company Logo
              Image.asset('assets/images/login-signup/logo.png',
                  width: 100, height: 100),

              SizedBox(height: 16.0),

              // Sign Up Text
              Text(
                'Sign Up for Free',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 16.0),

              // Name Input
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
                    labelText: ' Name',
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
              //       (onSavedVal) => {
              //   password = onSavedVal,
              // },                ),
              onSaved: (newValue) {
                userName = newValue;
              },
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
                    if (value==null || value.isEmpty) {
                      return 'Please enter your email address';
                    }
                    if (!isValidEmail(value)) {
                      return 'Invalid email address';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                email = newValue;
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
                    // return null;
                  },
                  onSaved: (newValue) {
                password = newValue;
              },
                ),
              ),

              SizedBox(height: 16.0),

              // Confirm Password Input
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
                    labelText: ' Confirm Password',
                    prefixIcon: Icon(Icons.lock),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                confirmpassword = newValue;
              },
                ),
              ),

              SizedBox(height: 16.0),

              // Sign Up Button
              ElevatedButton(
                onPressed: () {
                  if (validateAndSave()) {
                    setState(() {
                      isApiCallProcess = false;
                    });
                      if (email != null && password != null && userName != null && confirmpassword != null) {
                     registratrationrequestmodel model = registratrationrequestmodel(
                      data: Data(
                        emailAddress: email!,
                        password: password!,
                        name: userName!,  
                        confirmPassword: confirmpassword!,
                      ),
                    );

                    APIService.register(model).then((Response) {
                      // Continue with your sign-up logic here
                      print(Response);
                      if (Response) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'Registration Sucessful please login to the account.'),
                          ),
                        );
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/login',
                          (route) => false,
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Registration Sucessful please login to the account.'),
                          ), // Navigator.pop(context);
                        );
                      }
                    });
                      }
                      else{
                        print('One or more fields are null');
                      }
                  }
                },

                child: Text('Sign Up'),
              
              ),
              SizedBox(height: 16.0),

              // Already have an account? Sign In
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Already have an account?',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      TextSpan(
                        text: ' Sign In',
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
