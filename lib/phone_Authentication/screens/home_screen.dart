import 'package:block_pattern/phone_Authentication/cubit/auth_cubit/auth_cubit.dart';
import 'package:block_pattern/phone_Authentication/cubit/auth_cubit/auth_state.dart';
import 'package:block_pattern/phone_Authentication/screens/sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home"),
      ),
      body: SafeArea(
        child: Container(
          child: Center(

            child: BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                
                if(state is AuthLoggedOutState) {
                  Navigator.popUntil(context, (route) => route.isFirst);
                  Navigator.pushReplacement(context, CupertinoPageRoute(
                    builder: (context) => SignInScreen()
                  ));
                }

              },
              builder: (context, state) {
                return CupertinoButton(
                  onPressed: () {
                    BlocProvider.of<AuthCubit>(context).logOut();
                  },
                  child: Text("Log Out"),
                );
              },
            ),

          ),
        ),
      ),
    );
  }
}