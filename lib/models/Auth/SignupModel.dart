class SignUpModel {
  SignUpModel({required this.phoneNumber, String? validationCode});
  String phoneNumber;
  String? validationCode;

  /// TODO: Implment Freezed
  factory SignUpModel.fromJson(Map<String?, dynamic> json) {
    dynamic jsonData = json;
    return SignUpModel(
      phoneNumber: jsonData['phoneNumber'],
      validationCode: jsonData['validationCode'],
    );
  }
}
