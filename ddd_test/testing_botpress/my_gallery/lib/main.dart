
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Features/home/presentation/views/home_screen.dart';
import 'Features/login/presentation/manger/cubit/login_cubit.dart';
import 'Features/login/presentation/views/login_screen.dart';
import 'core/app_colors.dart';
import 'core/helpers/observer.dart';

void main() {
  Bloc.observer = Observer();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428,926) ,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<LoginCubit>(create: (context) =>  LoginCubit(),),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            useMaterial3: true,
          ),
          initialRoute: LoginScreen.id,
          routes: {
            LoginScreen.id: (context) => const LoginScreen(),
            HomePage.id: (context) => const HomePage(),
          },
        ),
      ),
    );
  }
}
