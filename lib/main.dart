import 'package:flutter/material.dart';
import 'package:arn/screens/login_alert.dart';
import 'package:arn/screens/user_activation.dart';
import 'package:arn/screens/user_message.dart';
import 'package:arn/screens/welcome_user.dart';
import 'package:arn/screens/home.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ARN',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        // '/': (context) => const HomeScreen(title: 'ARN Alert'),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/': (context) => const WelcomeUser(
              title: 'Welcome',
            ),
        '/activation': (context) => const UserActivation(
              title: 'Activation', notified: true,
          
            ),
        '/message': (context) => const UserMessage(
              title: 'Message',
            ),
        '/alert': (context) => const LoginAlert(
              title: 'Alert',
          notified: true,
            ),
      },
    );
  }
}
