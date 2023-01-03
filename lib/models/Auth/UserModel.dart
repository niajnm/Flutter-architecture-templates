class UserModel {
  UserModel({
    required this.username,
    required this.token,
    required this.phoneNumber,
    this.userType = null,
    this.gender = null,
    this.birthday = null,
    this.district = null,
    this.sub_district = null,
    this.image = null,
  });
  String username;
  String token;
  String phoneNumber;
  String? image;
  int? userType;
  int? gender;
  DateTime? birthday;
  int? district;
  int? sub_district;

  factory UserModel.fromJson(Map<String?, dynamic> json) {
    dynamic jsonData = json;
    return UserModel(
      username: jsonData['username'],
      token: jsonData['token'],
      phoneNumber: jsonData['phoneNumber'],
      userType: jsonData['userType'],
      gender: jsonData['gender'],
      birthday: jsonData['birthday'],
      district: jsonData['district'],
      sub_district: jsonData['sub_district'],
    );
  }
}
