import 'package:flutter/material.dart';
import 'package:onefish/utils/AppContextExtension.dart';

// SvgPicture.asset(height: 25.h, 'assets/icon/bd_flag.svg')
class HomeTileGroupHeader extends StatelessWidget {
  final String title;
  final Color color;
  const HomeTileGroupHeader(this.title, this.color, {Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(this.title,
        style: context.resources.styles.homeTileGroupHeaderStyle(this.color));
  }
}
