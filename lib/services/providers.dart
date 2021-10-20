import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final indexProvider = StateProvider<int>((ref) => 0);
final imageProvider = StateProvider<XFile?>((ref) => null);


late StateProvider<Map<String,dynamic>> userProvider;
final firestoreInst =  Provider<FirebaseFirestore>((ref)=> FirebaseFirestore.instance);
final leaderCollection =  Provider<CollectionReference>((ref)=> ref.watch(firestoreInst).collection("leaderboard"));

final firebaseProvider = StreamProvider<QuerySnapshot>((ref) {
  return ref.watch(leaderCollection)
      .orderBy("score", descending: true)
      .snapshots();
}
);


final authProvider = Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);
final userIdProvider = StateProvider<String?>(
        (ref) {
          final curr = ref.watch(authProvider).currentUser;
          if(curr == null){
            return null;
          }
          else{
            return curr.uid;
          }
    }
);

final usernameProvider = StateProvider<String?>((ref)=>null);
final animNotifier = StateNotifierProvider<LottieController,bool>((ref) => LottieController());

class LottieController extends StateNotifier<bool>{
  LottieController() : super(true){
    start();
  }

  void start(){
    state = true;
    Future.delayed(const Duration(seconds: 1),
      (){
        stop();

      }
    );
  }

  void stop(){
    state = false;
  }
}
