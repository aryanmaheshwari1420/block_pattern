import 'package:block_pattern/Cubit/HomeScreen.dart';
import 'package:block_pattern/Cubit/Internet_Cubit.dart';
import 'package:block_pattern/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetCubit(),
      child: MaterialApp(
          home: HomeScreen2(),
        ),
    );
  }
}
