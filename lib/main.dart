import 'package:flutter/material.dart';
import 'package:mindfuldost_hub/services/share_service.dart';
import 'splash_screen/splash_screen.dart'; // Import your splash screen
import 'package:mindfuldost_hub/screens/screen1.dart';
import 'package:mindfuldost_hub/screens/screen2.dart';
import 'package:mindfuldost_hub/welcomescreen/ws1.dart';
import 'package:mindfuldost_hub/welcomescreen/ws2.dart';
import 'package:mindfuldost_hub/welcomescreen/ws3.dart';
import 'package:mindfuldost_hub/welcomescreen/ws4.dart';
import 'package:mindfuldost_hub/signin_signup/signin.dart';
import 'package:mindfuldost_hub/signin_signup/signup.dart';
import 'package:mindfuldost_hub/homepage/home1.dart';
import 'package:mindfuldost_hub/assesment1/age.dart';
import 'package:mindfuldost_hub/assesment1/gender.dart';
import 'package:mindfuldost_hub/assesment1/weight.dart';
import 'package:mindfuldost_hub/assessment2/assesment1.dart';
// import 'package:mindfuldost_hub/assessment2/assesment1.dart';
import 'package:mindfuldost_hub/assessment2/assesment2.dart';
import 'package:mindfuldost_hub/assessment2/assesment3.dart';
import 'package:mindfuldost_hub/assessment2/assesment4.dart';
import 'package:mindfuldost_hub/assessment2/assesment5.dart';
import 'package:mindfuldost_hub/assessment2/assesment6.dart';
import 'package:mindfuldost_hub/homepage/home1.dart';


// import 'splash_screen/dem01.dart'; // Import your splash screen
// import 'homepage/home1.dart'; // Import your home screen
Widget _defaultHome=const SignInPage();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  bool _result =await SharedService.isLoggedIn();
  if (_result) {
    _defaultHome = Homepage(username: 'User');
    
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor:Color.fromRGBO(37, 20, 4, 1),
        
        // Add any other theme configurations as needed
      ),
      home:splash_screen(),
      routes: {
        '/splashscreen': (context) => splash_screen(),
        '/screen1': (context) => const SplashScreen1(),
        '/shakingScreen': (context) => ShakingScreen(),
        '/ws1': (context) =>  WelcomeScreen(),
        '/ws2': (context) =>  WelcomeScreen2(),
        '/ws3': (context) =>  WelcomeScreen3(),
        '/ws4': (context) =>  WelcomeScreen4(),
        '/signup': (context) =>  SignupPage(),
        '/login': (context) =>  SignInPage(),
        '/age': (context) =>  AgeAssessment(),
        '/gender': (context) =>  GenderScreen(),
        '/weight': (context) =>  WeightPage(),
        '/assesment1': (context) =>  MentalHealthAssessmentScreen(),
        '/assesment2': (context) =>  MoodScreen(),
        '/assesment3': (context) =>  HelpScreen(),
        '/assesment4': (context) =>  DistressScreen(),
        '/assesment5': (context) =>  MentalHealthAssessment(),
        '/assesment6': (context) =>  medications(),
        // '/home1': (context) =>  Homepage(username: 'User'),        
        '/home1': (context) =>  Homepage(username: 'User'),
        // '/':(context) => _defaultHome,
      },
    );
  }
}
