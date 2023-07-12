
// if your classses is Empty you can make it as enum only when there is no data
// and remember all of the state must be empty to defined enum

// cubit is function based and bloc is event based

import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: constant_identifier_names
enum InternetState { Initial, Lost, Gain }

class InternetCubit extends Cubit<InternetState> {
  final Connectivity _connectivity = Connectivity();

  StreamSubscription? connectivitySubscription;

  InternetCubit() : super(InternetState.Initial) {
    connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        emit(InternetState.Gain);
      } else {
        emit(InternetState.Lost);
      }
    });
  }

  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }
}
