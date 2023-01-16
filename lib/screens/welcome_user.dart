import 'package:animated_widgets/animated_widgets.dart';
import 'package:arn/screens/login_alert.dart';
import 'package:arn/screens/user_activation.dart';
import 'package:arn/screens/user_message.dart';
import 'package:flutter/material.dart';

class WelcomeUser extends StatefulWidget {
  const WelcomeUser({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<WelcomeUser> createState() => _WelcomeUserState();
}

class _WelcomeUserState extends State<WelcomeUser> {
  late bool notified=true;
  int _selectedIndex = 0;
  void _onItemTapped(int index) {

      if(index==0){
        if(_selectedIndex!=index){
          setState(() {
            _selectedIndex = index;
            notified = true;
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const WelcomeUser(title: "Welcome Screen")));
          });
        }
      }
      else if(index==1){
        if(_selectedIndex!=index){
          setState(() {
            _selectedIndex = index;
            notified = false;
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const UserActivation(title: "User Activation Screen", notified: false,)));
          });
        }
      }
      else if(index==2){
        if(_selectedIndex!=index){
          setState(() {
            _selectedIndex = index;
            notified = true;
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginAlert(title: "Login Alert Screen", notified: true,)));
          });
        }

      }
      else if(index==3){
        if(_selectedIndex!=index){
         setState(() {
           _selectedIndex = index;
           notified = true;
           Navigator.push(context, MaterialPageRoute(builder: (context)=>const UserMessage(title: "User Message Screen")));
         });
        }

      }
  }
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          leading: Container(),
          // Here we take the value from the WelcomeUser object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        // ignore: avoid_unnecessary_containers
        body: Container(
          margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/images/logo-black.png",
                        height: 60,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: const [
                    Center(
                        child: Text(
                      'Welcome Mr Joe to Antidote Response ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ))
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Center(
                        child: Text(
                      'Network ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Center(
                          child: Text(
                        'Your Pharmacy  is GPC Pharmacy ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: const [
                    Center(
                        child: Text(
                      'This application is being used for',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: const [
                    Center(
                        child: Text(
                      'Emergency Alert. Notification will appear',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: const [
                    Center(
                        child: Text(
                      ' at the screen in the event of an emergency. ',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: const [
                    Center(
                        child: Text(
                      'DO NOT UNINSTALL THIS APPLICATION. ',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ))
                  ],
                ),
              ),
            ],
          ),
        ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        iconSize: 36,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        onTap:_onItemTapped,
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: ShakeAnimatedWidget(
              enabled: notified,
              duration: const Duration(milliseconds: 1500),
              shakeAngle: Rotation.deg(z: 40),
              curve: Curves.linear,
              child: Container(
                  decoration: BoxDecoration(
                      border: (notified==true)?const Border(
                          top: BorderSide(color: Colors.red, width: 2.0),
                          left: BorderSide(color: Colors.red, width: 2.0),
                          right: BorderSide(color: Colors.red, width: 2.0),
                          bottom: BorderSide(color: Colors.red, width: 2.0)
                      ):const Border(
                          top: BorderSide.none,
                          left: BorderSide.none,
                          right: BorderSide.none,
                          bottom: BorderSide.none
                      )
                  ),
                  child: const Icon(Icons.check_circle))), label: "Acknowledge"),
          const BottomNavigationBarItem(icon: Icon(Icons.message), label: "Messages"),
          const BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ],),
    );
  }
}
