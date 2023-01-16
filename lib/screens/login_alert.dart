import 'dart:io';

import 'package:animated_widgets/animated_widgets.dart';
import 'package:arn/screens/user_activation.dart';
import 'package:arn/screens/user_message.dart';
import 'package:arn/screens/welcome_user.dart';
import 'package:duration_button/duration_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class LoginAlert extends StatefulWidget {
  const LoginAlert({super.key, required this.title, required this.notified});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final bool notified;

  @override
  State<LoginAlert> createState() => _LoginAlertState();
}

class _LoginAlertState extends State<LoginAlert> {
  late AudioPlayer player;
  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
    notified = widget.notified??true;
  }

  late bool notified;
  int _selectedIndex = 2;
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
  void _onItemTapped2(int index) {}

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
        leading: (notified == true)
            ? Container()
            : IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_new)),
        // Here we take the value from the LoginAlert object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
        child: Column(
          children: [
            (notified == true)
                ? Container()
                : Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 40),
                    child: DurationButton(
                      duration: const Duration(seconds: 0),
                      onPressed: () {},
                      coverColor: Colors.white,
                      hoverColor: Colors.white,
                      splashColor: Colors.white,
                      backgroundColor: Colors.white,
                      splashFactory: NoSplash.splashFactory,
                      onComplete: () async {
                        await player.setAsset('assets/sound/sound.mp3');
                        player.setLoopMode(LoopMode.all);

                        player.setVolume(3.0);
                        player.setSkipSilenceEnabled(true);
                        player.play();
                        if (Platform.isAndroid) {
                          showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: ((context) {
                                return AlertDialog(
                                  title: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: IconButton(
                                          onPressed: () {
                                            player.dispose();
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                  const WelcomeUser(
                                                      title:
                                                      "Welcome Screen")),
                                            );
                                          },
                                          icon: const Icon(Icons.cancel, color: Colors.black,size: 36,),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text("Login Alert"),
                                      ),
                                    ],
                                  ),
                                  content: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text("Please Log On Now to Assist"),
                                  ),

                                );
                              }));
                        } else if (Platform.isIOS) {
                          showCupertinoDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: ((context) {
                                return CupertinoAlertDialog(
                                  title: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: CupertinoButton(
                                          onPressed: () {
                                            player.dispose();
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const WelcomeUser(
                                                            title:
                                                                "Welcome Screen")),
                                                );
                                          },
                                          child: const Icon(Icons.cancel, color: Colors.black,size: 36,),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text("Login Alert"),
                                      ),
                                    ],
                                  ),
                                  content: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text("Please Log On Now to Assist"),
                                  ),
                                );
                              }));
                        }
                      },
                      child: Container(),
                    ),
                  ),
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
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: const [
                  Text(
                    'No one from your entity logged on.',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Center(
                      child: Text(
                        'Please Log on now to assist',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: const [
                  Text(
                    'https://antidoteresponsenetwork.org/',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  //),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: (notified == true)
          ? BottomNavigationBar(
              currentIndex: _selectedIndex,
              iconSize: 36,
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.black,
              showUnselectedLabels: true,
              onTap: _onItemTapped,
              items: [
                const BottomNavigationBarItem(
                    icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: ShakeAnimatedWidget(
                        enabled: notified,
                        duration: const Duration(milliseconds: 1500),
                        shakeAngle: Rotation.deg(z: 40),
                        curve: Curves.linear,
                        child: Container(
                            decoration: BoxDecoration(
                                border: (notified == true)
                                    ? const Border(
                                        top: BorderSide(
                                            color: Colors.red, width: 2.0),
                                        left: BorderSide(
                                            color: Colors.red, width: 2.0),
                                        right: BorderSide(
                                            color: Colors.red, width: 2.0),
                                        bottom: BorderSide(
                                            color: Colors.red, width: 2.0))
                                    : const Border(
                                        top: BorderSide.none,
                                        left: BorderSide.none,
                                        right: BorderSide.none,
                                        bottom: BorderSide.none)),
                            child: const Icon(Icons.check_circle))),
                    label: "Acknowledge"),
                const BottomNavigationBarItem(
                    icon: Icon(Icons.message), label: "Messages"),
                const BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: "Settings"),
              ],
            )
          : BottomNavigationBar(
              backgroundColor: Colors.white,
              currentIndex: _selectedIndex,
              iconSize: 36,
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.black,
              showUnselectedLabels: true,
              onTap: _onItemTapped2,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.filter_none,
                      color: Colors.white,
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.filter_none,
                      color: Colors.white,
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.filter_none,
                      color: Colors.white,
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.filter_none,
                      color: Colors.white,
                    ),
                    label: ""),
              ],
            ),
    );
  }
}
