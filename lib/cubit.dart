import 'dart:convert' as convert;
import 'dart:convert';

import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:untitled1/models/special_model.dart';
import 'package:untitled1/modules/doctor/personal_doctor.dart';
import 'package:untitled1/shared/cubit/cubit_doctor/state.dart';

import '../../../apihelper/api.dart';
import '../../../models/appData.dart';
import '../../../models/model.dart';
import '../../../modules/doctor/home_doctor.dart';
import '../../../modules/doctor/notifications.dart';
import '../../../modules/patient/home_patient.dart';
import '../../../modules/personal_patient.dart';
import '../../constants.dart';

class DoctorCubit extends Cubit<DoctorStates> {
  DoctorCubit() : super(DoctorInitialState());

  static DoctorCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> bodyDoctor = [
    DoctorHomeScreen(),
    NotificationScreen(),
    PersonalDoctor(),
  ];
  List<Widget> bodyPatient = [
    PatientHome(),
    NotificationScreen(),
    PersonalPatient(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(DoctorBottomNavState());
  }

  var bar = [
    Text(
      'Home',
      style: TextStyle(color: Colors.white),
    ),
    Text('Notifications', style: TextStyle(color: Colors.white)),
    Text('Profile', style: TextStyle(color: Colors.white))
  ];


  //getDataType
  String? token;

  getToken(token) async {
    this.token = await token;
  }

//user data
  AppData? userModel;
  Special? special;
  dynamic data;
  Map<String,dynamic>? userData;
  Future<AppData?> getDoctorData() async {
    emit(LoadingDoctorData());
    var response = await http.get(
      Uri.parse('http://rescuerapp-001-site1.gtempurl.com/api/User/UserData'),
      headers: {
        'Accept': '*/*',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    userData=jsonDecode(response.body);

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      // data = jsonResponse['Data']['DoctorSpecializationId'];
      // id = jsonResponse['Id'];
      userModel = AppData.fromJson(jsonResponse);
      // print(userModel);
      // print('Number of books about http: $data.');
      print('Request when I get data :${response.statusCode}');
      emit(SuccessDoctorData());
    } else {
      print('Request failed with status: ${response.statusCode}.');
      emit(ErrorDoctorData(
          'Request failed with status: ${response.statusCode}.'));
    }
    return userModel!;
  }

  Future<Special?> getAllSpecialization() async {
    emit(LoadingDoctorDataSpecial());
    var response = await http.get(
      Uri.parse(
          'http://rescuerapp-001-site1.gtempurl.com/api/Doctor/GetAllSpecializations'),
      headers: {
        'Accept': '*/*',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);

      special = Special.fromJson(jsonResponse);

      print('Request when I get data :${response.statusCode}');
      emit(SuccessDoctorDataSpecial());
    } else {
      print('Request failed with status: ${response.statusCode}.');
      emit(ErrorDoctorDataSpecial(
          'Request failed with status: ${response.statusCode}.'));
    }
    return special!;
  }

  //
  // ignore: prefer_typing_uninitialized_variables
  // late final response;

  Future<UserModel?> updateDoctorProfile({
    required String username,
    required String email,
    required String phone,
    required String address,
  }) async {
    emit(LoadingDoctorUpdate());
    await http
        .put(
      Uri.parse('http://rescuerapp-001-site1.gtempurl.com/api/User/UserData'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'text/plain',
        'Authorization': 'Bearer $token',
      },
      body: convert.jsonEncode(<String, dynamic>{
        'Id': userModel!.data!.id!,
        'DoctorSpecializationId': userModel!.data!.doctorSpecializationId,
        'UserName': username,
        'BirthDate': birthdate + 'T22:10:00.297Z',
        'Email': email,
        'MobileNumber': phone,
        'Address': address,
      }),
    )
        .then((value) {
      print('Request when I upload data :${value.statusCode}');
      emit(SuccessDoctorUpdate());
      // getData();

      return UserModel.fromJson(convert.jsonDecode(value.body));
    }).catchError((error) {
      emit(ErrorDoctorUpdate(
          'Request failed with status: ${error.toString()}.'));
      // print('Request failed with status: ${response.statusCode}.');
      print('Request failed with status: ${error.toString()}.');
    });

    // throw Exception('Failed to update your data.');
  }

  updateDate({required BuildContext context,
    required TextEditingController controller}) async {
    emit(LoadingDoctorUpdateDate());
    await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100))
        .then((value) {
      birthdate = formatDate(
          DateTime(value!.year.toInt(), value.month.toInt(), value.day.toInt()),
          [yyyy, '-', mm, '-', dd]);
      print(birthdate);
      //
      int get = int.parse(birthdate.substring(0, 4));
      // dynamic date = DateFormat.yMd().format();
      controller.text = (DateTime
          .now()
          .year - get).toString();

      print(controller.text);
      emit(SuccessDoctorUpdateDate());
      return controller.text;
    }).catchError((error) {
      emit(ErrorDoctorUpdateDate(error));
    });
  }


// get patient data for doctor

  Model? patientData;
  Map<String,dynamic>? json;
  getPatientData() async {
    emit(DoctorLoadingGetPatientDataState());
    await http.get(
        Uri.parse(
            'http://rescuerapp-001-site1.gtempurl.com/api/Doctor/PatientsData'),
        headers: {
          'Accept': '*/*',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }).then((value) {
      emit(DoctorSuccessGetPatientDataState());
      var jsonResponse = convert.jsonDecode(value.body);
      json=jsonDecode(value.body);
      patientData = Model.fromJson(jsonResponse);
    }).catchError((value) {
      emit(DoctorErrorGetPatientDataState());
    });
  }

  Map<String,dynamic>? doctorJson;
  doctorData() async {
    emit(PatientLoadingGetDoctorDataState());
    await http.get(
        Uri.parse(
            'http://rescuerapp-001-site1.gtempurl.com/api/Patient/PatientData'),
        headers: {
          'Accept': '*/*',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }).then((value) {
      emit(PatientSuccessGetDoctorDataState());
       doctorJson =jsonDecode(value.body);
    }).catchError((value) {
      emit(PatientErrorGetDoctorDataState());
    });
  }

// function add patient
  void addPatient(int? patientId) async {
    emit(LoadingDoctorAddPatient());
    getDoctorData();
    await http.post(
        Uri.parse(
            'http://rescuerapp-001-site1.gtempurl.com/api/Doctor/PatientAssign'),
        body: jsonEncode({
          'DoctorId':userData!['Data']['Id'],
          'PatientId': patientId
        }),
        headers: {
          'Accept': '*/*',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }).then((value) {
          Map<String,dynamic> jso=jsonDecode(value.body);
          print(jso['Message']);
          print(value);
          emit(SuccessDoctorAddPatient());
    }).catchError((e){
      emit(ErrorDoctorAddPatient());
    });
    // emit(LoadingDoctorAddPatient());
    // await Api().post(url: 'Doctor/PatientAssign',body:{'DoctorId':userData!['Data']['Id'],
    //   'PatientId': patientId},token: token );
    // emit(SuccessDoctorAddPatient());
  }
  //search
  search(int id)async {
      emit(LoadingDoctorSearch());
      await http.get(
          Uri.parse(
              'http://rescuerapp-001-site1.gtempurl.com/api/Patient/PatientData?patientId=$id'),
          headers: {
            'Accept': '*/*',
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          }).then((value) {
        emit(SuccessDoctorSearch());
        json=jsonDecode(value.body);
      }).catchError((value) {
        emit(ErrorDoctorSearch());
      });
    }

  bool? type;
  getType(type){
    this.type=type;
  }

}

