import 'package:onefish/models/base_service.dart';
import 'package:onefish/models/Auth/SignupModel.dart';

class AuthService extends BaseService {
  @override
  Future<dynamic> getResponse(String url) async {
    print(apiURL);
    return await Future.delayed(const Duration(seconds: 5), () => "5");
  }

  Future<dynamic> postLoginInfo(
      String url, SignUpModel jsondata) async {
    print(apiURL + url);
    dynamic userData = {
      "status_code": 200,
      "token":"auhdkjhask",
      "name": "Adolf Hitler",
    };
    return await Future.delayed(const Duration(seconds: 5), () => userData);
  }
}
