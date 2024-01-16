// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// void main()
// {
//   runApp(MaterialApp(home: otp(),));
// }
//
// class otp extends StatefulWidget {
//   const otp({super.key});
//
//   @override
//   State<otp> createState() => _otpState();
// }
//
// class _otpState extends State<otp> {
//
//
//   TextEditingController t1= TextEditingController();
//   TextEditingController t2= TextEditingController();
//   FirebaseAuth auth= FirebaseAuth.instance;
//
//   String v_id="";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("OTP"),),
//      body: Column(children: [
//        TextField(controller: t1,),
//        ElevatedButton(onPressed: () async {
//          await FirebaseAuth.instance.verifyPhoneNumber(
//            phoneNumber: '+91${t1.text}',
//            verificationCompleted: (PhoneAuthCredential credential) async {
//              await auth.signInWithCredential(credential);
//            },
//            verificationFailed: (FirebaseAuthException e) {
//              if(e.code== 'invalid'){
//                print('phone number is not valid');
//              }
//            },
//            codeSent: (String verificationId, int? resendToken) {
//              v_id = verificationId;
//              setState(() {});
//            },
//            codeAutoRetrievalTimeout: (String verificationId) {},
//          );
//
//        }, child: Text("SEND OTP")),
//        TextField(controller: t2,),
//        ElevatedButton(onPressed: () {
//
//
//        }, child: Text("SEND OTP"))
//      ],),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> main()
async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  );
  runApp(MaterialApp(home: first(),));
}
class first extends StatefulWidget {
  const first({super.key});

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {

  TextEditingController t1= TextEditingController();
  TextEditingController t2= TextEditingController();
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(""),),
      body: Column(children: [
        TextField(controller: t1,),
        TextField(controller: t2,),
        ElevatedButton(onPressed: () {
          String name=t1.text;
          String contact=t2.text;
          users
              .add({
            'name': name, // John Doe
            'contact': contact, // Stokes and Sons
          })
              .then((value) => print("User Added"))
              .catchError((error) => print("Failed to add user: $error"));
        }, child: Text("submit")),
      ],),
    );
  }
}

