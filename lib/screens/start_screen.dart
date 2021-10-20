import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_envi/colors.dart';
import 'package:project_envi/screens/login_screen.dart';
import 'package:project_envi/screens/signup_screen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          const Spacer(flex: 3,),
          Expanded(
            flex: 85,
            child: Container(
              margin: EdgeInsets.all(_size.width*0.075),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.all(Radius.circular(
                    _size.width / 14),
                ),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0,6),
                      color: Colors.white.withOpacity(0.4),
                      spreadRadius: 2,
                      blurRadius: 10
                  )
                ]
              ),
              child: Column(
                children: [
                  const Spacer(
                    flex:1,
                  ),
                  const Expanded(
                    flex: 10,
                    child: Center(
                      child: Text
                        (
                        "Eco\nMobility",
                        // textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Cinzel",
                            fontSize: 55,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(
                    flex:3,
                  ),
                  Expanded(
                    flex: 23,
                    child: Hero(
                      tag: 'svg',
                      child: SvgPicture.asset(
                        'assets/images/start2.svg',
                        width: _size.width*0.8,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const Spacer(flex: 3,),
          Expanded(
            flex: 10,
            child: Hero(
              tag:'container2',
              child: Container(
                child: TextButton(
                  onPressed: (() async {
                    await Navigator.push(
                        context,
                        PageRouteBuilder(
                            transitionDuration:
                            const Duration(milliseconds: 300),
                            reverseTransitionDuration:
                            const Duration(milliseconds: 300),
                            transitionsBuilder:
                                (BuildContext context,
                                Animation<double>
                                animation,
                                Animation<double>
                                secAnimation,
                                Widget child) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                            pageBuilder: (BuildContext
                            context,
                                Animation<double> animation,
                                Animation<double> secAnimation) {
                              return const SignupScreen();
                            }));
                  }),
                    child: const Text('Sign Up'),
                  style: TextButton.styleFrom(
                    primary: Colors.black,
                    backgroundColor: Colors.grey.withOpacity(0.2),
                    shadowColor: Colors.grey,
                    elevation: 0,
                    fixedSize: Size(_size.width*(0.85),_size.height*(0.1)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(_size.width/(14))),
                    ),
                    textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Spacer(flex: 3,),
          Expanded(
            flex: 10,
            child: Hero(
              tag:'container1',
              child: Container(
                child: TextButton(
                  onPressed: (() async {
                    await Navigator.push(
                    context,
                    PageRouteBuilder(
                    transitionDuration:
                    const Duration(milliseconds: 300),
                    reverseTransitionDuration:
                    const Duration(milliseconds: 300),
                    transitionsBuilder:
                    (BuildContext context,
                    Animation<double>
                    animation,
                    Animation<double>
                    secAnimation,
                    Widget child) {
                    return FadeTransition(
                    opacity: animation,
                    child: child,
                    );
                    },
                    pageBuilder: (BuildContext
                    context,
                    Animation<double> animation,
                    Animation<double> secAnimation) {
                    return const LoginScreen();
                    }));
                  }),
                  child: const Text('Login'),
                  style: TextButton.styleFrom(
                    shadowColor: Colors.grey,
                    elevation: 0,
                    primary: Colors.black,
                    backgroundColor: primaryC,
                    fixedSize: Size(_size.width*(0.85),_size.height*(0.1)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(_size.width/(14))),
                    ),
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),

          const Spacer(
            flex:5,
          ),
        ],
      ),
    );
  }
}
