import 'package:flutter/material.dart';
import 'package:onefish/utils/AppContextExtension.dart';
import 'package:onefish/widgets/themeItems/formItems/FormLabel.dart';

class RadioItemWithLabel extends StatefulWidget {
  final bool isRequired;
  final String labelText;
  final List<Map> selectionOptions;
  final Function onChanged;
  const RadioItemWithLabel(
      this.isRequired, this.labelText, this.onChanged, this.selectionOptions,
      {Key? key})
      : super(key: key);

  @override
  _RadioItemWithLabelState createState() => _RadioItemWithLabelState();
}

class _RadioItemWithLabelState extends State<RadioItemWithLabel> {
  int groupVal = 0;

  List<Widget> getItems() {
    List<Widget> items = [];
    List<Widget> rowItems = [];
    Widget newRow;
    rowItems.add(FormLabel(widget.labelText, widget.isRequired));
    for (int i = 0; i < widget.selectionOptions.length; i++) {
      Widget radioItem = SizedBox(
        width: MediaQuery.of(context).size.width * 0.3,
        child: InkWell(
          onTap: () => setState(() {
            groupVal = i + 1;
            widget.onChanged(groupVal);
          }),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Radio(
                  activeColor: context.resources.colors.primary800,
                  value: widget.selectionOptions[i]['id'],
                  groupValue: groupVal,
                  onChanged: (dynamic index) {
                    setState(() {
                      groupVal = index;
                      widget.onChanged(groupVal);
                    });
                  },
                  splashRadius: 10),
              Expanded(
                child: Text(widget.selectionOptions[i]['title'],
                    style: context.resources.styles
                        .bodyText1(context.resources.colors.neutral600)),
              )
            ],
          ),
        ),
      );
      items.add(radioItem);
      if ((i + 1) % 3 == 0) {
        newRow = Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: items,
        );
        rowItems.add(newRow);
        items = [];
      }
      i = i++;
    }
    // rowItems.insert(0, FormLabel(widget.labelText, widget.isRequired));
    return rowItems;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: getItems(),
    );
  }
}
