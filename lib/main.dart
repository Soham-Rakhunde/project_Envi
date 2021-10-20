import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_envi/screens/homescreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project_envi/screens/start_screen.dart';
import 'package:project_envi/services/providers.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      const ProviderScope(
        child: MyApp(),
      )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.immersiveSticky,
    );
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        fontFamily: 'Montserrat',
      ),
      home: Consumer(
        builder: (BuildContext context, T Function<T>(ProviderBase<Object?, T>) watch, Widget? child) {
          return StreamBuilder(
            stream:watch(authProvider).authStateChanges(),
            builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
              print("streamin");
              if(!snapshot.hasData && snapshot.data != null) {
                watch(userIdProvider).state = watch(authProvider).currentUser!.uid;
                print("uidchanges ${watch(userIdProvider).state}");
                print("1if ${snapshot.data}");
                return const StartScreen();
              } else {
                return AuthWrapper();
              }
            },

          );
        },

      ) ,
    );
  }
}

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  _AuthWrapperState createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  // late Future<String> _data;
  String? name;

  Future<String> getData() async {
    context.read(userIdProvider).state = context.read(authProvider).currentUser!.uid;
    final dat = await context.read(leaderCollection).doc(context.read(userIdProvider).state).get();
    print("uid ${context.read(userIdProvider).state}");
    context.read(usernameProvider).state = dat['username'];
    name = dat['username'];
    return dat['username'];
  }



  // @override
  // // void initState() {
  // //   _data = getData();
  //   super.initState();
  // }


  @override
  Widget build(BuildContext context) {
    if(context.read(authProvider).currentUser != null)  {

      return FutureBuilder(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<String> snap){
            print("future");
            print(snap.hasData);
            print(name);
            if(snap.hasData && name != null) {
              print("iurf ${snap.data}");
              return const HomeScreen();
            }
            else {
              print("elsess ${snap.data}");
              return const Expanded(
                  child: ColoredBox(
                    color: Colors.white,
                    child: Center(
                        child: SizedBox(
                            width:70,
                            height: 70,
                            child: CircularProgressIndicator()
                        )
                    ),
                  )
              );
            }
          }
      );
    }
    else {
      return const StartScreen();
    }
  }
}
