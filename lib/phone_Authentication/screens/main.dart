import 'package:block_pattern/firebase_options.dart';
import 'package:block_pattern/phone_Authentication/cubit/auth_cubit/auth_cubit.dart';
import 'package:block_pattern/phone_Authentication/cubit/auth_cubit/auth_state.dart';
import 'package:block_pattern/phone_Authentication/screens/sign_in.dart';
import 'package:block_pattern/phone_Authentication/screens/verify_phone_number.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(BlocProvider(
    create: (context) => AuthCubit(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocBuilder< AuthCubit,AuthState>(
        builder: (context, state) {
          return SignInScreen();
        },
      ),
    ),
  ));
}
