import 'package:untitled1/shared/cubit/cubit_doctor/cubit.dart';

abstract class DoctorStates {}

class DoctorInitialState extends DoctorStates {}

class DoctorBottomNavState extends DoctorStates {}

class DoctorNavState extends DoctorStates {}

class LoadingDoctorData extends DoctorStates {}

class SuccessDoctorData extends DoctorStates {}

class ErrorDoctorData extends DoctorStates {
  final String error;

  ErrorDoctorData(this.error);
}

class LoadingDoctorDataSpecial extends DoctorStates {}

class SuccessDoctorDataSpecial extends DoctorStates {}

class ErrorDoctorDataSpecial extends DoctorStates {
  final String error;

  ErrorDoctorDataSpecial(this.error);
}

class LoadingDoctorUpdate extends DoctorStates {}

class SuccessDoctorUpdate extends DoctorStates {}

class ErrorDoctorUpdate extends DoctorStates {
  final String error;

  ErrorDoctorUpdate(this.error);
}

class LoadingDoctorUpdateDate extends DoctorStates {}

class SuccessDoctorUpdateDate extends DoctorStates {}

class ErrorDoctorUpdateDate extends DoctorStates {
  final String error;

  ErrorDoctorUpdateDate(this.error);
}


class DoctorSuccessGetPatientDataState extends DoctorStates{}
class DoctorLoadingGetPatientDataState extends DoctorStates{}
class DoctorErrorGetPatientDataState extends DoctorStates{}

class UserLoadingGetIdState extends DoctorStates{}
class UserSuccessGetIdState extends DoctorStates{}
class UserErrorGetIdState extends DoctorStates{}

class PatientSuccessGetDoctorDataState extends DoctorStates{}
class PatientLoadingGetDoctorDataState extends DoctorStates{}
class PatientErrorGetDoctorDataState extends DoctorStates{}

class LoadingDoctorAddPatient extends DoctorStates{}
class SuccessDoctorAddPatient extends DoctorStates{}
class ErrorDoctorAddPatient extends DoctorStates{}

class LoadingDoctorSearch extends DoctorStates{}
class SuccessDoctorSearch extends DoctorStates{}
class ErrorDoctorSearch extends DoctorStates{}