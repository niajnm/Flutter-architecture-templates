import 'package:flutter/material.dart';
import 'package:onefish/utils/AppContextExtension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingStep3 extends StatefulWidget {
  final ScrollController _scrollController;
  final int value;
  final List<Map> selectionOptions;
  final Function selectedItem;
  const OnBoardingStep3(
      this.selectionOptions, this._scrollController, this.selectedItem,
      {this.value: 0, Key? key})
      : super(key: key);

  @override
  _OnBoardingStep3State createState() => _OnBoardingStep3State();
}

class _OnBoardingStep3State extends State<OnBoardingStep3> {
  late int value;
  @override
  @override
  void initState() {
    value = widget.value;
    super.initState();
  }

  setSelectedItem(int selectedVal) {
    setState(() {
      value = selectedVal;
    });
    widget.selectedItem(selectedVal);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      controller: widget._scrollController,
      separatorBuilder: (_, __) => SizedBox(height: 12.h),
      itemCount: widget.selectionOptions.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      // shrinkWrap: true,
      // physics: ScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          key: Key('User-Type-${widget.selectionOptions[index]['id']}'),
          onDoubleTap: () {
            context.resources.logger
                .info('Radio button wrapped tapped -- updating value');
            setSelectedItem(widget.selectionOptions[index]['id']);
          },
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                  width: 2.sp,
                  color: widget.selectionOptions[index]['id'] == value
                      ? context.resources.colors.primary800
                      : context.resources.colors.neutral300,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(8))),
            child: RadioListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                activeColor: context.resources.colors.primary800,
                title: Align(
                  alignment: Alignment(-1.1, 0),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 8.h, 0, 0),
                    child: Text(widget.selectionOptions[index]['title'],
                        style: context.resources.styles
                            .bodyText1(context.resources.colors.neutral500)),
                  ),
                ),
                selected: widget.selectionOptions[index]['id'] == value,
                value: widget.selectionOptions[index]['id'],
                groupValue: value,
                selectedTileColor: context.resources.colors.neutral100,
                tileColor: context.resources.colors.neutral50,
                toggleable: true,
                onChanged: (dynamic val) {
                  if (val != null) {
                    context.resources.logger.info(
                        'Radio button value changed to ${val.toString()}');
                    setSelectedItem(val);
                  } else {
                    setSelectedItem(widget.value);
                  }
                }),
          ),
        );
      },
    );
  }
}
