import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_gallery/core/app_colors.dart';
import 'package:my_gallery/core/app_styles.dart';

import '../manger/cubit/login_cubit.dart';
class LoginScreen extends StatelessWidget {
  static const String id = 'login_screen';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/2log in.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //create form for email and password
              children: [
                const Title(),

                LoginForm(),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit =BlocProvider.of<LoginCubit>(context);
    return Padding(
      padding:  EdgeInsets.all(40.w),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              borderRadius: BorderRadius.circular(44.r),
            ),
            padding: const EdgeInsets.all(40),
            child: Form(
              key: cubit.formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Text("Log In",style: AppStyles.loginTiltle.copyWith(
                      fontSize: 30.sp,
                    ),),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Container(
                    padding:  EdgeInsets.symmetric(horizontal: 20.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(44.r),
                      color: Colors.white,
                    ),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Email',
                        border: InputBorder.none,
                    ),
                  ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Container(
                    padding:  EdgeInsets.symmetric(horizontal: 20.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(44.r),
                    ),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Password',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),

                  const submitButton(),
                ],
              ),

            )
          ),
        ),
      ),
    );
  }
}

class submitButton extends StatelessWidget {
  const submitButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: (){},
        style: TextButton.styleFrom(
          backgroundColor: AppColors.customBlueColor,
          padding: EdgeInsets.symmetric(
              horizontal: 40.w,
              vertical: 20.h,
          ),

        ),
        child: Text("Submit",style: AppStyles.loginSubmitButtonText,),
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("My",style: AppStyles.loginTiltle,),
        Text("Gallery",style: AppStyles.loginTiltle,),
      ],
    );
  }
}
