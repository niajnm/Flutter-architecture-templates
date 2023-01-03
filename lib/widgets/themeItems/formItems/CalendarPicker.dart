import 'package:flutter/material.dart';
import 'package:onefish/utils/AppContextExtension.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onefish/widgets/themeItems/formItems/FieldContainer.dart';
import 'package:onefish/widgets/themeItems/formItems/FormLabel.dart';
import 'package:jiffy/jiffy.dart';

class CalendarPicker extends StatefulWidget {
  final bool isRequired;
  final String labelText;
  final String hintText;
  final Function dateSelected;
  const CalendarPicker(
      this.labelText, this.hintText, this.isRequired, this.dateSelected,
      {Key? key})
      : super(key: key);

  @override
  _CalendarPickerState createState() => _CalendarPickerState();
}

class _CalendarPickerState extends State<CalendarPicker> {
  DateTime? _selectedDate;
  String? _selectedDateString;
  isClicked() async {
    context.resources.logger.info('Calendar Picker is clicked');
    await showCalendarDatePicker2Dialog(
      config: CalendarDatePicker2WithActionButtonsConfig(
        controlsTextStyle: context.resources.styles.headline5(),
        dayTextStyle: context.resources.styles.calendarBody(),
        selectedDayTextStyle: context.resources.styles.calendarBody(),
        calendarType: CalendarDatePicker2Type.single,
        selectedDayHighlightColor: context.resources.colors.primary200,
        shouldCloseDialogAfterCancelTapped: true,
        controlsHeight: 100,
      ),
      context: context,
      // config: CalendarDatePicker2Config(calendarType: 1, initialDate: DateTime.now()),
      dialogSize: Size(MediaQuery.of(context).size.width * 3,
          MediaQuery.of(context).size.height / 2),
      initialValue: _selectedDate != null ? [_selectedDate] : [],
      borderRadius: 20.h,
    ).then((value) {
      context.resources.logger.info('Calendar Picker ok clicked');
      setState(() {
        if (value?[0] != null) {
          context.resources.logger.info('$value');
          _selectedDate = value?[0];
          _selectedDateString = Jiffy(_selectedDate as DateTime).yMMMMd;
          context.resources.logger.info('$_selectedDateString');
        } else {
          _selectedDateString = null;
        }
        widget.dateSelected(_selectedDate);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.only(top: 24.h)),
        FormLabel(widget.labelText, widget.isRequired),
        GestureDetector(
          onTap: () => isClicked(),
          child: FieldContainer(_selectedDateString ?? widget.hintText,
              'assets/icon/calander.svg'),
        ),
      ],
    );
  }
}
