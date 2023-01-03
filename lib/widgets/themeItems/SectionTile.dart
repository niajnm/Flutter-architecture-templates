import 'package:flutter/material.dart';
import 'package:onefish/utils/AppContextExtension.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle(this.title, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(title,
            style: context.resources.styles
                .headline5(context.resources.colors.primary800)),
      ),
    );
  }
}
