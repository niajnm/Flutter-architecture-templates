class RegistrationModel {
  RegistrationModel(
      {required this.userType,
      required this.name,
      required this.gender,
      required String this.phone,
      String? this.token,
      DateTime? this.birthday,
      String? this.district,
      String? this.sub_district});
  int userType;
  String name;
  String gender;
  String? phone;
  String? token;
  DateTime? birthday;
  String? district;
  String? sub_district;

  /// TODO: Implment Freezed
  factory RegistrationModel.fromJson(Map<String?, dynamic> json) {
    dynamic jsonData = json;
    return RegistrationModel(
      userType: jsonData['userType'],
      name: jsonData['name'],
      gender: jsonData['gender'],
      phone: jsonData['phone'],
      token: jsonData['token'],
      birthday: jsonData['birthday'],
      district: jsonData['district'],
      sub_district: jsonData['sub_district'],
    );
  }
}
