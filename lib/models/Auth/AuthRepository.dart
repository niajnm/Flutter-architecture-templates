import 'package:onefish/models/Auth/SignupModel.dart';
import 'package:onefish/models/Auth/UserModel.dart';
import 'package:onefish/models/Auth/AuthService.dart';

class AuthRepository {
  AuthService _authService = new AuthService();

  Future<dynamic> postLoginData(SignUpModel loginData) async {
    dynamic response = await _authService.postLoginInfo("myURL", loginData);
  
    if(response.statusCode == 200) {
      // response.unset('syay');
    response.remove('status_code');
    final UserModel jsonData = response;
      return jsonData;
    }
    else{
      return null;
    }
  }
}
