import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:chatapp/bloc/state.dart';
import 'package:chatapp/core/utils/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../../../core/helpers/cachehelper.dart';
import '../../../../../core/utils/constants/assets_images.dart';
import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/keys.dart';
import '../../../../../screens/chat_screen.dart';
import '../../../../auth/presentation/views/login/login_screen.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedSplashScreen(
        backgroundColor: AppColors.backgroundColor,
        splash: SpinKitRotatingPlain	(
          size: 300.sp,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                  AppAssetsImages.logoImage,
                ),
                  fit: BoxFit.contain,
                )
              ),
            );
          },
          duration: const Duration(milliseconds: 3620),
        ),
        nextScreen: CacheHelper.getDate(key: AppKeys.loginDone) == false
            ? const ChatScreen()
            : const LoginScreen(),
        ///Todo change it to true
        splashIconSize: 100.sp,
        duration: 1800,
        //splashTransition: SplashTransition.slideTransition,
        animationDuration: const Duration(seconds: 2),
      ),
    );
  }
}
