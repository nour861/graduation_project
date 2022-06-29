abstract class PatientStates {}

class PatientInitialState extends PatientStates {}

// class SuccessGetProfileData extends DoctorStates {
//   final AppData appData;
//
//   SuccessGetProfileData(this.appData);
// }
class LoadingPatientGetData extends PatientStates {}

class SuccessPatientGetData extends PatientStates {}

class ErrorPatientData extends PatientStates {
  final String error;

  ErrorPatientData(this.error);
}

class LoadingPatientUpdate extends PatientStates {}

class SuccessPatientUpdate extends PatientStates {
  // final AppData appData;
  //
  // SuccessUpdate(this.appData);
}

class ErrorPatientUpdate extends PatientStates {
  final String error;

  ErrorPatientUpdate(this.error);
}

class LoadingDatePatientUpdate extends PatientStates {}

class SuccessDatePatientUpdate extends PatientStates {
  // final AppData appData;
  //
  // SuccessUpdate(this.appData);
}

class ErrorDatePatientUpdate extends PatientStates {
  final String error;

  ErrorDatePatientUpdate(this.error);
}
