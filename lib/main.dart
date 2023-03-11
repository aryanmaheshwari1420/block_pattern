import 'package:block_pattern/Cubit/Internet_Cubit.dart';
import 'package:block_pattern/blocs/internet_bloc/internet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:block_pattern/homeScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetCubit(),
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
