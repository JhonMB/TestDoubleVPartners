part of 'splash_cubit.dart';

class SplashState {
  final double sizeLogo;
  final bool activateAnimation;

  SplashState({required this.sizeLogo, required this.activateAnimation});

  factory SplashState.initial() => SplashState(
        sizeLogo: 0.0,
        activateAnimation: false,
      );

  SplashState copyWith({
    double? sizeLogo,
    bool? activateAnimation,
  }) {
    return SplashState(
      sizeLogo: sizeLogo ?? this.sizeLogo,
      activateAnimation: activateAnimation ?? this.activateAnimation,
    );
  }
}
