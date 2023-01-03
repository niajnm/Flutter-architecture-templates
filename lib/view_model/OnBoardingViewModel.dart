import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:onefish/models/Auth/RegistrationModel.dart';
import 'package:onefish/utils/ServiceLocator.dart';
import 'package:onefish/utils/logger/Log.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:onefish/view_model/LoaderModelView.dart';
import 'package:provider/provider.dart';
import 'package:onefish/models/Auth/SignupModel.dart';
import 'package:onefish/models/Auth/UserModel.dart';
import 'package:onefish/utils/AppContextExtension.dart';

class OnBoardingViewModel extends ChangeNotifier {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool _isLoggedIn = false;
  int _showWhichStep = 1;
  String _userPhone = "";
  bool _isNewUser = false;
  String _verificationCode = "";
  SignUpModel? _authModel;
  UserModel? _userModel;
  int? _userType;
  RegistrationModel? _registrationInfo;
  // bool _stepHasError = false;
  // String _stepHasErrorMsg = '';
  // bool _isVerfied = false;
  // bool _didInsertPersonalInfo = false;
  // Duration _verificationCountDownTimer = Duration(seconds: 60);
  //Get User Phone Number
  String get getUserPhoneNo => _userPhone;

  setUserPhone(String phoneNo, {bool rebuild = true}) {
    _userPhone = phoneNo;
    if (rebuild) {
      notifyListeners();
    }
  }

  //Is this a new user signup?
  bool get getIsNewUser => _isNewUser;

  setIsNewUser(bool isNew, {bool rebuild = true}) {
    _isNewUser = isNew;
    if (rebuild) {
      notifyListeners();
    }
  }

  /// Current Logged in Status
  bool get getLoggedInStatus => _isLoggedIn;

  setLoggedInStatus(
      {bool loginStatus = false,
      bool rebuild = true,
      bool saveToDB = false}) async {
    _isLoggedIn = loginStatus;
    // SharedPreferences prefs = await _prefs;
    // await prefs.setBool('isLoggedIn', false);
    if (saveToDB) {
      await setLoggedInStatusToDB(_isLoggedIn);
    }
    if (rebuild) {
      notifyListeners();
    }
  }
  // bool get getLoggedInStatus => false;

  // void setLoggedInStatus(
  //     {bool loginStatus = false,
  //     bool rebuild = true,
  //     bool saveToDB = false}) async {
  //   _isLoggedIn = false;
  //   SharedPreferences prefs = await _prefs;
  //   await prefs.setBool('isLoggedIn', false);
  //   if (saveToDB) {
  //     await setLoggedInStatusToDB(_isLoggedIn);
  //   }
  //   if (rebuild) {
  //     notifyListeners();
  //   }
  // }

  setLoggedInStatusToDB(bool isLoggedIn) async {
    SharedPreferences prefs = await _prefs;
    await prefs.setBool('isLoggedIn', isLoggedIn);
  }

  /// Get Verfication Code
  String get getVerificationCode => _verificationCode;
  dynamic setVerificationCode(String code, {bool rebuild = true}) {
    _verificationCode = code;
    if (rebuild) {
      notifyListeners();
    }
  }

  ///  Step to display on On Boarding Page
  int get getShowWhichStep => _showWhichStep;

  setShowWhichStep(int stepNo, {bool rebuild = true}) {
    _showWhichStep = stepNo;
    if (rebuild) {
      notifyListeners();
    }
  }

  //Object Sent to API TO SignUp
  SignUpModel? get getAuthModel => _authModel;
  //Prepare Object to be sent for Sign Up
  setAuthModel(SignUpModel data) {
    _authModel = data;
    notifyListeners();
  }

  //Object Sent to API TO SignUp
  UserModel? get getUserModel => _userModel;
  //Prepare Object to be sent for Sign Up
  setUserModel(UserModel data) {
    _userModel = data;
    notifyListeners();
  }

  /// Initialize Boarding Page && Execute Timed Animaions
  initializeOnBoardingPage(
      BuildContext context,
      AnimationController logoanimationCtl,
      AnimationController loginanimationCtl) {
    /// Show Loader while initializing ap
    // TODO:  Check if User is connected to the internet
    // TODO: Show POPUP if no internet connection
    Future<bool?>.delayed(const Duration(seconds: 2)).then((value) {
      context.resources.logger.info("Delayed 2 seconds");

      /// Hide Loader after initializing app
      // Provider.of<LoaderModelView>(context, listen: false)
      //     .setShowLoader(false, rebuild: false);

      /// Perform Logo Animation
      logoanimationCtl.forward();

      /// Chain Login Form Opacity Animation
      loginanimationCtl.forward();
    });
    // notifyListeners();
  }

  /// Onboarding Step1 Handling
  void handleOnBoardingStep1(BuildContext context,
      {String phoneNo = "", bool rebuild: true}) async {
    serviceLocator.get<Log>().info('Handle Step 1 $phoneNo');
    //If Step is 1, then post the phone no to the server and get the verification code
    Provider.of<LoaderModelView>(context, listen: false).setShowLoader(true);

    setVerificationCode('', rebuild: false);
    setIsNewUser(false, rebuild: false);
    if (phoneNo.isNotEmpty) {
      setUserPhone(phoneNo);
      await postPhoneNoToAPI(phoneNo, context);
    }
    Provider.of<LoaderModelView>(context, listen: false).setShowLoader(false);
    notifyListeners();
  }

  // TODO:  Send Phone Number to API and get Verification Code
  Future<dynamic> postPhoneNoToAPI(String phoneNo, BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2)).then((value) {
      _authModel = SignUpModel(phoneNumber: phoneNo);

      /// Make POST Request
      /// TODO: From API Check if this is a signup or login and update status of isNewUser
      setIsNewUser(true, rebuild: false);
      setShowWhichStep(2, rebuild: false);
    });
    // notifyListeners();
  }

  void handleStep2BackBtnClick(BuildContext context) async {
    context.resources.logger.info('Handling Step 2 Back Button');
    setUserPhone('');
    setVerificationCode('');
    setShowWhichStep(1);
    notifyListeners();
  }

  void handleOnBoardingStep2(BuildContext context, {String pin = ""}) async {
    Provider.of<LoaderModelView>(context, listen: false).setShowLoader(true);
    context.resources.logger.info('Handle Step 2 $pin');
    if (pin.isNotEmpty) {
      setVerificationCode(pin);
      await postVerifyPhoneCode(pin, context).then((data) {
        setUserPhone('');
        setVerificationCode('');
        Provider.of<LoaderModelView>(context, listen: false)
            .setShowLoader(false);
      });

      if (_userModel != null) {
        context.resources.logger.info('User Model is not null');
        context.resources.logger.info('Show which step is ${getShowWhichStep}');
        if (_showWhichStep == 3) {
          // setLoggedInStatus(loginStatus: true, rebuild: true, saveToDB: false);
          Navigator.pushNamedAndRemoveUntil(
              context, '/collectuserinfo', (route) => false);
        } else {
          setLoggedInStatus(loginStatus: true, rebuild: true, saveToDB: true);
          Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
        }
        // setShowWhichStep(3);
      }
    }
    notifyListeners();
  }

  // TODO:  Send Phone Number to API and get Verification Code
  Future<dynamic> postVerifyPhoneCode(String pin, BuildContext context) async {
    context.resources.logger.info('Verifying Pin via API $pin');

    _authModel = setAuthModel(
        SignUpModel(phoneNumber: getUserPhoneNo, validationCode: pin));
    await Future.delayed(const Duration(seconds: 2)).then((value) {
      /// Make POST Request
      // TODO: Send Phone Number to API and get Verification Code && Get User Data

      //if Successful, then go to next step
      setUserModel(UserModel(
          phoneNumber: getUserPhoneNo,
          username: 'UserName',
          token: 'djkhajkdf',
          userType: null,
          gender: null,
          birthday: null,
          district: null,
          image: null,
          sub_district: null));
      context.resources.logger.info('The user model is $_userModel');
      context.resources.logger.info('Data is $_userModel?.userType');
      if (_userModel?.userType == null) {
        setShowWhichStep(3);
        setIsNewUser(true);
      } else {
        setIsNewUser(false);
      }
    });
    notifyListeners();
  }

  int get getUserType => _userType ?? 0;

  setUserType(int userType, {bool rebuild = true}) {
    _userType = userType;
    if (rebuild) {
      notifyListeners();
    }
  }

  Future<RegistrationModel> get getRegistrationModel async {
    if (_registrationInfo != null) {
      return Future.value(_registrationInfo);
    } else {
      SharedPreferences prefs = await _prefs;
      String? _stringRegistrationModel = prefs.getString('registrationData');
      if (_stringRegistrationModel != null) {
        _registrationInfo =
            RegistrationModel.fromJson(json.decode(_stringRegistrationModel));
        return Future.value(_registrationInfo);
      } else {
        return Future.value(null);
      }
    }
  }

  Future<void> setAndSaveRegistrationModel(RegistrationModel data) async {
    _registrationInfo = data;
    SharedPreferences prefs = await _prefs;
    await prefs.setString('registrationData', data.toString());
  }

  Future<void> registerAndLogInUser(context, RegistrationModel data) async {
    serviceLocator.get<Log>().info('Registering User $data');
    inspect(data);
    //Send data to server using phone number and verification code
    Provider.of<LoaderModelView>(context, listen: false).setShowLoader(true);
    await postRegistrationDataAndLogIn(
        data, _userPhone, _verificationCode, context);
    Provider.of<LoaderModelView>(context, listen: false).setShowLoader(false);
    notifyListeners();
  }

  Future<dynamic> postRegistrationDataAndLogIn(RegistrationModel data,
      String phone, String pin, BuildContext context) async {
    Future<bool?>.delayed(const Duration(seconds: 2)).then((value) {
      data.token = "abc";
      setAndSaveRegistrationModel(data);

      /// Make POST Request
      setLoggedInStatus(loginStatus: true, rebuild: true, saveToDB: true);
      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
    });
  }
}
