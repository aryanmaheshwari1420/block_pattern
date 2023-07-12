import 'package:block_pattern/firebase_options.dart';
import 'package:block_pattern/phone_Authentication/screens/sign_in.dart';
import 'package:block_pattern/phone_Authentication/screens/verify_phone_number.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);

  runApp(MaterialApp(
    home: VerifyPhoneNumberScreen(),
  ));
}
