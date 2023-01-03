import 'package:flutter/material.dart';
import 'package:onefish/models/Auth/RegistrationModel.dart';
import 'package:onefish/utils/AppContextExtension.dart';
import 'package:onefish/utils/ServiceLocator.dart';
import 'package:onefish/utils/logger/Log.dart';
import 'package:onefish/widgets/themeItems/ThemeButton.dart';
import 'package:onefish/widgets/themeItems/formItems/CalendarPicker.dart';
import 'package:onefish/widgets/themeItems/formItems/DropdownPicker.dart';
import 'package:onefish/widgets/themeItems/formItems/RadioItemWithLabel.dart';
import 'package:onefish/widgets/themeItems/formItems/TextFieldWithLabel.dart';

class OnBoardingStep4 extends StatefulWidget {
  final int userType;
  final String userPhone;
  final Function submitForm;
  OnBoardingStep4(int this.userType, this.userPhone, Function this.submitForm,
      {Key? key})
      : super(key: key);

  @override
  _OnBoardingStep4State createState() => _OnBoardingStep4State();
}

class _OnBoardingStep4State extends State<OnBoardingStep4> {
  bool isFormDisabled = true;
  String? _name;
  String? _gender;
  DateTime? _birthday;
  String? _district;
  String? _sub_district;
  RegistrationModel? _registrationInfo;

  List<Map> selectionOptions2 = [
    {'id': 1, 'title': 'পুরুষ'},
    {'id': 2, 'title': 'মহিলা'},
    {'id': 3, 'title': 'অন্যান্য'},
  ];

  final List<Map> districtItems = [
    {'id': 1, 'title': 'ঢাকা'},
    {'id': 2, 'title': 'সিলেট'},
    {'id': 3, 'title': 'চট্টগ্রাম'},
    {'id': 4, 'title': 'ম্যমনসিংহ'},
  ];
  final List<Map> subDistrictItems = [
    {'id': 1, 'title': 'গুলশান'},
    {'id': 2, 'title': 'গোলাপুর'},
    {'id': 3, 'title': 'বাগেরহাট'},
  ];

  void submitRegistration() {
    serviceLocator.get<Log>().info('submitRegistration');
    serviceLocator.get<Log>().info('birthday ${_birthday}');
    serviceLocator.get<Log>().info('district ${_district}');
    serviceLocator.get<Log>().info('sub_district ${_sub_district}');
    // RegistrationModel.fromJson(json.decode(json.encode(_registrationInfo)));

    _registrationInfo = RegistrationModel(
      userType: widget.userType,
      name: _name as String,
      gender: _gender as String,
      phone: widget.userPhone,
      birthday: _birthday,
      district: _district,
      sub_district: _sub_district,
    );
    widget.submitForm(_registrationInfo);
  }

  bool isButtonDisabled() {
    bool _isdisabled = true;
    if (_name == null || _gender == null) {
      _isdisabled = true;
    } else {
      _isdisabled = false;
    }
    serviceLocator
        .get<Log>()
        .info('Is Registration Form DisableD? $_isdisabled');
    return _isdisabled;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextFieldWithLabel(
          true,
          context.resources.lang.name,
          context.resources.lang.namePlaceHolder,
          (value) => setState(() => _name = value)),
      RadioItemWithLabel(
          true,
          context.resources.lang.gender,
          (dynamic value) => setState(() => _gender = value.toString()),
          selectionOptions2),
      CalendarPicker(
          context.resources.lang.birthDay,
          context.resources.lang.selectPlaceholder,
          false,
          (DateTime value) => setState(() => _birthday = value)),
      DropdownPicker(
          context.resources.lang.district,
          context.resources.lang.selectPlaceholder,
          districtItems,
          (String value) => setState(() => _district = value)),
      DropdownPicker(
          context.resources.lang.sub_district,
          context.resources.lang.selectPlaceholder,
          subDistrictItems,
          (value) => setState(() => _sub_district = value)),
      ThemeButton(
          context.resources.lang.completeRegistration,
          useFilledBtn: true,
          useSmallBtn: true,
          isDisabled: isButtonDisabled(),
          () => submitRegistration()),
    ]);
  }
}
