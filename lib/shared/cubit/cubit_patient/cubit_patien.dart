import 'dart:convert' as convert;

import 'package:bloc/bloc.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:untitled1/shared/cubit/cubit_patient/patient_state.dart';

import '../../../models/appData.dart';
import '../../constants.dart';

class PatientCubit extends Cubit<PatientStates> {
  PatientCubit() : super(PatientInitialState());

  static PatientCubit get(context) => BlocProvider.of(context);
  AppData? userModel;

  Future<AppData?> getData() async {
    emit(LoadingPatientGetData());
    var response = await http.get(
      Uri.parse('http://rescuerapp-001-site1.gtempurl.com/api/User/UserData'),
      headers: {
        'Accept': '*/*',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      userModel = AppData.fromJson(jsonResponse);
      emit(SuccessPatientGetData());
    } else {
      print('Request failed with status: ${response.statusCode}.');
      emit(ErrorPatientData(
          'Request failed with status: ${response.statusCode}.'));
    }
    return userModel;
  }

  //
  Future<UserModel?> updateProfile({
    required String username,
    required String email,
    required String phone,
    required String rescuerNumber,
    required String address,
    required String age,
  }) async {
    emit(LoadingPatientUpdate());
    await http
        .put(
      Uri.parse('http://rescuerapp-001-site1.gtempurl.com/api/User/UserData'),
      headers: <String, String>{
        'Accept': '*/*',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: convert.jsonEncode(<String, dynamic>{
        'DoctorSpecializationId': userModel!.data!.doctorSpecializationId,
        'Id': userModel!.data!.id,
        'UserName': username,
        'Email': email,
        'BirthDate': age,
        'RescuerMobileNumber': rescuerNumber,
        'MobileNumber': phone,
        'Address': address
      }),
    )
        .then((value) {
      emit(SuccessPatientUpdate());

      print('Request when I upload data :${value.statusCode}');
      return UserModel.fromJson(convert.jsonDecode(value.body));
    }).catchError((error) {
      emit(ErrorPatientUpdate(
          'Request failed with status: ${error.toString()}.'));
      print('Request failed with status: ${error.toString()}.');
    });
  }

  Future updateDate(
      {required BuildContext context,
      required TextEditingController controller}) async {
    emit(LoadingDatePatientUpdate());
    await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(2100))
        .then((value) {
      birthdate = formatDate(
          DateTime(value!.year.toInt(), value.month.toInt(), value.day.toInt()),
          [yyyy, '-', mm, '-', dd]);
      int get = int.parse(birthdate.substring(0, 4));
      controller.text = (DateTime.now().year - get).toString();
      print(controller.text);
      emit(SuccessDatePatientUpdate());
      return controller.text;
    }).catchError((error) {
      emit(ErrorDatePatientUpdate(error));
    });
  }
}
