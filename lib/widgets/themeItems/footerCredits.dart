import 'package:flutter/material.dart';
import 'package:onefish/utils/AppContextExtension.dart';

class FooterCredits extends StatelessWidget {
  const FooterCredits({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(context.resources.lang.madeWithLove1,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              maxLines: 1,
              style: context.resources.styles.subtitle1(
                  null, context.resources.variables.secondaryFontFamily)),
          Text(context.resources.lang.heart,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              maxLines: 1,
              style: context.resources.styles.subtitle1()),
          Text(context.resources.lang.madeWithLove2,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              maxLines: 1,
              style: context.resources.styles.subtitle1(
                  null, context.resources.variables.secondaryFontFamily)),
        ],
      ),
    );
  }
}
