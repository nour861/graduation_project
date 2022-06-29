class AppData {
  int? result;
  UserModel? data;
  String? message;

  // AppData({required this.result, required this.data, required this.message});
  AppData.fromJson(Map<String, dynamic> json) {
    result = json['Result'];
    data = UserModel.fromJson(json['Data']);
    // data = (json['Data'] != null ? UserModel.fromJson(json['Data']) : null);
    message = json['Message'];
  }
}

class UserModel {
  int? id;
  String? userName;
  String? email;
  // late String password;
  String? birthDate;
  String? mobileNumber;
  String? rescuerMobileNumber;
  String? address;
  // late String gender;
  // late int userTypeId;
  int? doctorSpecializationId;

  UserModel(
      {this.userName,
      this.email,
      // this.password,
      this.birthDate,
      this.mobileNumber,
      this.rescuerMobileNumber,
      this.address,
      // this.gender,
      // this.userTypeId,
      this.doctorSpecializationId});

  UserModel.fromJson(
    Map<String, dynamic> json,
  ) {
    id = json['Id'];
    userName = json['UserName'];
    email = json['Email'];
    // password = json['Password'];
    birthDate = json['BirthDate'];
    mobileNumber = json['MobileNumber'];
    rescuerMobileNumber = json['RescuerMobileNumber'];
    address = json['Address'];
    // gender = json['Gender'];
    // userTypeId = json['UserTypeId'];
    doctorSpecializationId = json['DoctorSpecializationId'];
  }
}
