import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_envi/services/providers.dart';


class Leaderboard extends ConsumerWidget {

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    Size _size = MediaQuery.of(context).size;
    return StreamBuilder(
      stream:watch(authProvider).authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        final username = watch(usernameProvider).state;
        print("username $username");
        return StreamBuilder(
          stream: watch(firebaseProvider.stream),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (!snapshot.hasData) {
              return Container();
            } else {
              print("stream ${snapshot.data.docs.length}");
              return ListView.builder(
                itemCount: snapshot.data.docs.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  // print(snapshot.data.docs[].data());
                  final dat = snapshot.data.docs[index].data();
                  return Shimmer(
                    enabled: username == dat['username'],
                    duration: const Duration(seconds: 3), //Default value
                    interval: const Duration(seconds: 2),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(20, 20, 10, 20),
                      margin: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 10),
                      decoration: BoxDecoration(
                        color: username == dat['username']
                            ? Colors.amber
                            : Colors.white,
                        borderRadius: BorderRadius.all(
                            Radius.circular(_size.width / 10)
                        ),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(0, 6),
                              color: Colors.grey.withOpacity(0.4),
                              spreadRadius: 2,
                              blurRadius: 10
                          )
                        ],
                      ),
                      child: ListTile(
                        title: Center(
                          child: Text(
                            "${dat['username']}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                        ),
                        // subtitle:
                        leading: Text(
                          "#${index + 1}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22
                          ),
                        ),
                        trailing: Text(
                          "${dat['score'].toStringAsPrecision(3)}km",
                          style: const TextStyle(
                            // fontWeight: FontWeight.bold,
                              fontSize: 17
                          ),
                        ),
                        // SizedBox(
                        //   width: 65,
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.end,
                        //     children: [
                        //       Text(
                        //         dat['coins'].toStringAsPrecision(2),
                        //         style: const TextStyle(
                        //           fontWeight: FontWeight.bold,
                        //             fontSize: 20
                        //         ),
                        //       ),
                        //       const FaIcon(
                        //         FontAwesomeIcons.leaf,
                        //         color: Colors.lightGreen,
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ),
                    ),
                  );
                },
              );
            }
          },
        );
      }
    );
    // return Container();
  }
}
