import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test_project/core/utils/app_colors.dart';

import 'package:flutter_test_project/injection_container.dart';
import 'package:flutter_test_project/core/helpers/status_page.dart';
import 'package:flutter_test_project/features/splash/presentation/bloc/splash_cubit.dart';

class Splash extends StatusPage<SplashState, SplashCubit> {
  const Splash({Key? key}) : super(key: key);

  @override
  SplashCubit createBloc(BuildContext context) =>
      sl<SplashCubit>()..load(context);

  @override
  Widget buildPage(BuildContext context, SplashState state, SplashCubit bloc) {
    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      body: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.center,
        children: [
          Center(
            child: AnimatedSize(
              curve: Curves.easeIn,
              duration: const Duration(seconds: 3),
              child: CircleAvatar(
                radius: state.sizeLogo,
                backgroundColor: Colors.transparent,
                child: SvgPicture.asset(
                  'assets/logos/dvp_logo.svg',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
