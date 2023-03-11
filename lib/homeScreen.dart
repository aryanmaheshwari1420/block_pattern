import 'package:block_pattern/Cubit/Internet_Cubit.dart';
import 'package:block_pattern/blocs/internet_bloc/internet_bloc.dart';
// import 'package:block_pattern/blocs/internet_bloc/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: BlocConsumer<InternetCubit, InternetState>(
          listener: (context, state) {
            if (state == InternetState.Gain) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Internet Connected!"),
                backgroundColor: Colors.blue,
              ));
            } else if (state == InternetState.Lost) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Internet not Connected!"),
                backgroundColor: Colors.red,
              ));
            }
          },
          builder: (context, state) {
            if (state == InternetState.Gain) {
              return Text("Connected!");
            } else if (state == InternetState.Lost) {
              return Text("Lost Connection!");
            } else {
              return Text("Loading...");
            }
          },
        ),
      )),
    );
  }
}
