import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_test_project/navigator.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState.initial());

  Future<void> load(BuildContext context) async {
    emit(SplashState.initial());
    opacityLogo();
    navigateToHome();
  }

  void opacityLogo() {
    if (state.activateAnimation == false) {
      Future.delayed(
        const Duration(seconds: 1),
        () => emit(state.copyWith(sizeLogo: 100.0, activateAnimation: true)),
      );
    }
  }

  void navigateToHome() => Future.delayed(
        const Duration(seconds: 3),
        () => AppNavigator.pushNamedAndRemoveUntil(Routes.HOME),
      );
}
