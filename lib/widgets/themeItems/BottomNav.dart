import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onefish/utils/AppContextExtension.dart';
import 'package:onefish/view_model/BottomNavViewModel.dart';
import 'package:onefish/view_model/LoaderModelView.dart';
import 'package:provider/provider.dart';

class BottomNav extends StatefulWidget {
  BottomNav({Key? key}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  late int itemSelected;

  @override
  Widget build(BuildContext context) {
    itemSelected = Provider.of<BottomNavViewModel>(context).getTabIndex;
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 10,
              blurRadius: 10,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        width: MediaQuery.of(context).size.width,
        height: 80,
        child: Expanded(
          flex: 1,
          child: Row(children: [
            BottomNavItem(
              0,
              'assets/icon/bottomNav/home.svg',
              context.resources.lang.home,
              (int val) =>
                  Provider.of<BottomNavViewModel>(context, listen: false)
                      .setTabIndex(val),
              isSelected:
                  Provider.of<BottomNavViewModel>(context).getTabIndex == 0
                      ? true
                      : false,
            ),
            BottomNavItem(
              1,
              'assets/icon/bottomNav/bookmark.svg',
              context.resources.lang.bookmarks,
              (int val) =>
                  Provider.of<BottomNavViewModel>(context, listen: false)
                      .setTabIndex(val),
              isSelected:
                  Provider.of<BottomNavViewModel>(context).getTabIndex == 1
                      ? true
                      : false,
            ),
            BottomNavItem(
              2,
              'assets/icon/bottomNav/shopping.svg',
              context.resources.lang.shoppingCart,
              (int val) =>
                  Provider.of<BottomNavViewModel>(context, listen: false)
                      .setTabIndex(val),
              isSelected:
                  Provider.of<BottomNavViewModel>(context).getTabIndex == 2
                      ? true
                      : false,
            ),
            BottomNavItem(
              3,
              'assets/icon/bottomNav/message.svg',
              context.resources.lang.messages,
              (int val) =>
                  Provider.of<BottomNavViewModel>(context, listen: false)
                      .setTabIndex(val),
              isSelected:
                  Provider.of<BottomNavViewModel>(context).getTabIndex == 3
                      ? true
                      : false,
            ),
            BottomNavItem(
              4,
              'assets/icon/bottomNav/settings.svg',
              context.resources.lang.settings,
              (int val) =>
                  Provider.of<BottomNavViewModel>(context, listen: false)
                      .setTabIndex(val),
              isSelected:
                  Provider.of<BottomNavViewModel>(context).getTabIndex == 4
                      ? true
                      : false,
            ),
          ]),
        ));
  }
}

class BottomNavItem extends StatefulWidget {
  final int itemIndex;
  final String iconPath;
  final String btnText;
  final bool isSelected;
  final Function isTapped;
  BottomNavItem(this.itemIndex, this.iconPath, this.btnText, this.isTapped,
      {this.isSelected: false, Key? key})
      : super(key: key);

  @override
  _BottomNavItemState createState() => _BottomNavItemState();
}

class _BottomNavItemState extends State<BottomNavItem> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => widget.isTapped(widget.itemIndex),
        child: Container(
            alignment: Alignment.center,
            // color: Colors.amber,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  color: widget.isSelected
                      ? context.resources.colors.primary800
                      : context.resources.colors.neutral400,
                  widget.iconPath,
                  width: 24,
                  height: 24,
                ),
                Padding(padding: EdgeInsets.only(top: 4)),
                Text(widget.btnText,
                    style: context.resources.styles.bottomNavTextStyle(
                        widget.isSelected
                            ? context.resources.colors.primary800
                            : context.resources.colors.neutral400)),
              ],
            )),
      ),
    );
  }
}
