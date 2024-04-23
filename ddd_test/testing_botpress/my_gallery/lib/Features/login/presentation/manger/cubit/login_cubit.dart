import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import '../../../../../core/utils/endpoints.dart';
import '../../../../home/presentation/views/home_screen.dart';
import '../../../data/login_data_model.dart';
import 'login_cubit_state.dart';
import 'package:http/http.dart'as http;
late LoginDataModel loginDataModel;
class LoginCubit extends Cubit<LoginCubitState> {
  LoginCubit() : super(LoginCubitInitial());
  late String token;
  var loginData;
  bool isLogged=false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future login({required String email, required String password,required bool keepMeLoggedIn,required BuildContext context}) async {
    emit(LoginCubitLoading());
    try {
      http.Response response;
      response= await http.post(
        Uri.parse(EndPoints.baseUrl+EndPoints.loginEndpoint),
        body: {
          'email':email,
          'password':password,
        },
      );
      var data = jsonDecode(response.body);
      loginData=data['data'];
      if(response.statusCode>=200 && response.statusCode<300){
        emit(LoginCubitSuccess());
        if(context.mounted){
          goToHomePage(context);
        }
        loginDataModel=LoginDataModel.fromJson(data);
        token = data['data']['token'];
        if (kDebugMode) {
          print(token);
        }


      }else if(response.statusCode==422){
        print(data);
        emit(LoginCubitFailure( err: data));


      }else{
        throw Exception(response.reasonPhrase.toString());
      }

    } on Exception catch (e) {
      emit(LoginCubitFailure(err: {
        'error':e.toString(),
      }));
    }
  }
  void goToHomePage(BuildContext context){
    Navigator.pushNamed(context, HomePage.id);
  }

}
