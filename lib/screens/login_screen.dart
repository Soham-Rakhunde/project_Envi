import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_envi/colors.dart';
import 'package:project_envi/screens/homescreen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_envi/services/providers.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  @override
  void initState() {
    // TODO: implement initState
    emailController= TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        // physics: NeverScrollableScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width,
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: IntrinsicHeight(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                const Spacer(flex: 3,),

                Expanded(
                  flex: 30,
                  child: Hero(
                    tag: 'svg',
                    child: SvgPicture.asset(
                      'assets/images/start2.svg',
                      width: _size.width*0.8,
                    ),
                  ),
                ),

                Expanded(
                  flex: 60,
                  child: Hero(
                    tag:'container1',
                    child: Container(
                      margin: EdgeInsets.all(_size.width*0.075),
                      padding: const EdgeInsets.all(10),
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
                          const Expanded(
                            flex: 30,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30.0),
                              child: Center(
                                child: Text(
                                  "Welcome\nBack",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: "Cinzel",
                                    fontSize: 45,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          const Spacer(
                            flex:3,
                          ),
                          Expanded(
                            flex: 10,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: buildFormField("Email",emailController,false),
                            ),
                          ),
                          const Spacer(
                            flex:2,
                          ),
                          Expanded(
                            flex: 10,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: buildFormField("Password",passwordController,true),
                            ),
                          ),
                          const Spacer(flex: 5,),
                          Expanded(
                            flex: 15,
                            child: TextButton(
                              onPressed: (() async {
                                setState(() async {

                                  try {
                                    await context.read(authProvider)
                                        .signInWithEmailAndPassword(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                    print("authenticatd!");
                                    final user = await context.read(leaderCollection).doc(context.read(userIdProvider).state).get();
                                    context.read(usernameProvider).state = user['username'];
                                    await Navigator.pushAndRemoveUntil(
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
                                              return const HomeScreen();
                                            }),
                                        (route) => false,
                                    );
                                  }
                                  on FirebaseAuthException catch (e){
                                    alertDialog(context);
                                    print(e);
                                  }
                                  // context.read(authStateChangesProvider);
                                });
                              }),
                              child: const Text('Login'),
                              style: TextButton.styleFrom(
                                shadowColor: Colors.grey,
                                elevation: 0,
                                primary: Colors.black,
                                backgroundColor: Colors.white,
                                fixedSize: Size(_size.width*(0.9),_size.height*(0.1)),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(_size.width/(20))),
                                ),
                                textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),



                const Spacer(
                  flex:2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildFormField(String name, TextEditingController controller , bool obscure) {
    return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: TextFormField(
                          controller: controller,
                          obscureText: obscure,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 25,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                              hintText: name,
                              hintStyle:const TextStyle(
                              fontSize: 25,
                          ),
                          ),
                        ),
                      );
  }

  void alertDialog(BuildContext context) => showDialog(
    barrierColor: Colors.white,
    context: context,
    barrierDismissible: false,
    builder: (_) => AlertDialog(
      content: const Text(
        'Invalid email or password!',
        style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold
        ),
        textAlign: TextAlign.center,
      ),
      shape: RoundedRectangleBorder(borderRadius: const BorderRadius.all(Radius.circular(25))),
      actions: <Widget>[
        TextButton(
          child: const Center(child: Text(
            'Try Again',
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),
            textAlign: TextAlign.center,
          ),),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}

