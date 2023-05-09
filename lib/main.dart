import 'package:bloc/bloc.dart';
import 'package:chatapp/Features/auth/presentation/views/login/login_screen.dart';
import 'package:chatapp/core/utils/constants/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Features/start/presentation/views/splash_screen.dart';
import 'Features/start/presentation/views/widgets/splash_body.dart';
import 'core/helpers/bloc_obsever.dart';
import 'firebase_options.dart';
import 'core/helpers/cachehelper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Chat App',
         home: const SplashScreen(),
          theme: ThemeData(
            primaryColor: AppColors.lightGrey,
            primaryColorLight: AppColors.lightGrey,
          ),
          //routerConfig: AppRouter.router,
        );
      },
    );
  }
}
