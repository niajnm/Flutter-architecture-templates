import 'package:flutter/material.dart';
import 'package:onefish/utils/AppContextExtension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onefish/widgets/themeItems/formItems/FormLabel.dart';

class TextFieldWithLabel extends StatefulWidget {
  final bool isRequired;
  final String labelText;
  final String hintText;
  final Function onChanged;
  const TextFieldWithLabel(
      this.isRequired, this.labelText, this.hintText, this.onChanged,
      {Key? key})
      : super(key: key);

  @override
  _TextFieldWithLabelState createState() => _TextFieldWithLabelState();
}

class _TextFieldWithLabelState extends State<TextFieldWithLabel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormLabel(widget.labelText, widget.isRequired),
        Container(
            margin: EdgeInsets.only(bottom: 24.h),
            // height: 44.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              // color: Colors.red,
              boxShadow: [
                BoxShadow(
                    color: context.resources.colors.neutral50, spreadRadius: 3),
              ],
            ),
            padding: EdgeInsets.fromLTRB(12.w, 0, 12.w, 0),
            child: TextField(
                style: context.resources.styles.formInputStyle(),
                scrollPadding: EdgeInsets.zero,
                textAlignVertical: TextAlignVertical.center,
                onChanged: (value) => widget.onChanged(value),
                decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    border: InputBorder.none,
                    hintText: widget.hintText,
                    counterText: "",
                    hintStyle: context.resources.styles
                        .bodyText2(context.resources.colors.neutral300)))),
      ],
    );
  }
}
