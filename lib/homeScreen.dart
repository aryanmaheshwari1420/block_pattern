import 'package:block_pattern/blocs/internet_bloc/internet_bloc.dart';
import 'package:block_pattern/blocs/internet_bloc/internet_state.dart';
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
        child: BlocConsumer<InternetBloc, InternetState>(
          listener: (context, state) {
            if (state is InternetGainState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Internet Conncetion!"),
                backgroundColor: Colors.blue,
              ));
            } else if (state is InternetLostState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Internet not Connected!"),
                backgroundColor: Colors.red,
              ));
            }
          },
          builder: (context, state) {
            if (state is InternetGainState) {
              return Text("Connected!");
            } else if (state is InternetLostState) {
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
