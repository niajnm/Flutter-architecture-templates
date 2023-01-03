import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackBtnManual extends StatefulWidget {
  final Function onTap;
  final Color color;
  const BackBtnManual(this.onTap, this.color, {Key? key}) : super(key: key);

  @override
  _BackBtnManualState createState() => _BackBtnManualState();
}

class _BackBtnManualState extends State<BackBtnManual> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTap(),
      child: Icon(Icons.arrow_back, color: widget.color, size: 24.w),
    );
  }
}


// Provider.of<OnBoardingViewModel>(context,
//                               listen: false).handleStep2BackBtnClick(context),