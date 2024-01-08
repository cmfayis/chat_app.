import 'package:chat_app/application/feature/auth/view/loginpage.dart';
import 'package:chat_app/application/feature/auth/view/main_page.dart';
import 'package:chat_app/application/feature/auth/view/signup_page.dart';
import 'package:chat_app/application/feature/home/view/homepage.dart';
import 'package:chat_app/application/feature/splash/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme:const TextTheme(
          displayLarge: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 26),
        )
      ),
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/':(context)=>SplashPageWrapper(),
        '/home':(context)=>HomePage(),
        '/register':(context)=>RegisterPageWrapper(),
        '/Login':(context)=>LoginPage(),
        '/SignUp':(context)=>SignUpPage(),
      },
    );
      
  }
}
