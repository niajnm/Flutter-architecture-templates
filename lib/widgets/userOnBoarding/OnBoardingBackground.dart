import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../themeItems/footerCredits.dart';


class OnBoardingBackground extends StatelessWidget {
  const OnBoardingBackground({Key? key}) : super(key: key);

  static List<String> _bgItems = <String>[
    // 'assets/notfound.svg', // uncomment to test an asset that doesn't exist.
    'assets/images/login/bgImage1.png',
    'assets/images/login/bgImage2.png',
  ];

  @override
  Widget build(BuildContext context) {
    // logger = context.resources.variables.logger.;
    // logger.info("Building");
    return Stack(
      children: [
        Column(
          children: [
            Stack(children: [
              Image.asset(_bgItems[1],
                  width: MediaQuery.of(context).size.width, fit: BoxFit.cover
                  // height: MediaQuery.of(context).size.height - 125.h,
                  ),
              Image.asset(_bgItems[0],
                  width: MediaQuery.of(context).size.width, fit: BoxFit.cover
                  // height: MediaQuery.of(context).size.height - 150.h,
                  ),
            ]),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Image.asset('assets/images/logos/worldfish_logo.png',
                    width: MediaQuery.of(context).size.width / 3),
              ),
            ),
          ],
        ),

        Positioned(
          bottom: 25.h,
          child: const FooterCredits(),
        ),
      ],
    );
  }
}
