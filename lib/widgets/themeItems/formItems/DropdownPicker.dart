import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onefish/utils/AppContextExtension.dart';
import 'package:onefish/widgets/themeItems/formItems/FieldContainer.dart';
import 'package:onefish/widgets/themeItems/formItems/FormLabel.dart';

class DropdownPicker extends StatefulWidget {
  final String labelText;
  final String placeholderText;
  final bool isRequired;
  final List<Map> dropdownItems;
  final Function dropdownSelected;
  DropdownPicker(this.labelText, this.placeholderText, this.dropdownItems,
      this.dropdownSelected,
      {this.isRequired: false, Key? key})
      : super(key: key);

  @override
  _DropdownPickerState createState() => _DropdownPickerState();
}

class _DropdownPickerState extends State<DropdownPicker> {
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];

  Object? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormLabel(widget.labelText, widget.isRequired),
        Stack(
          children: [
            FieldContainer(selectedValue != null ? '' : widget.placeholderText,
                'assets/icon/downArrow.svg'),
            DropdownButton2(
              buttonHeight: 52.h,
              buttonWidth: MediaQuery.of(context).size.width -
                  context.resources.variables.sidePaddingAmount * 2,
              dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: context.resources.colors.neutral50,
              ),
              icon: context.resources.variables.sizedBoxShrink,
              dropdownElevation: 1,
              focusColor: context.resources.colors.primary200,
              barrierColor:
                  context.resources.colors.neutral100.withOpacity(0.5),
              buttonPadding: const EdgeInsets.only(left: 8.0),
              underline: context.resources.variables.sizedBoxShrink,
              items: widget.dropdownItems
                  .map((item) => DropdownMenuItem<String>(
                        value: item['id'].toString(),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            item['title'],
                            style: context.resources.styles
                                .bodyText2(context.resources.colors.neutral800),
                          ),
                        ),
                      ))
                  .toList(),
              value: selectedValue,
              onChanged: (value) {
                setState(() {
                  context.resources.logger.info('Dropdown value: $value');
                  selectedValue = value;
                  widget.dropdownSelected(selectedValue);
                });
              },
              itemHeight: 40,
            )
          ],
        ),
      ],
    );
  }
}
