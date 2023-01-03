import 'package:flutter/material.dart';
import 'package:onefish/utils/ServiceLocator.dart';
import 'package:onefish/utils/logger/Log.dart';
import 'package:onefish/widgets/homeItems/HomeTile.dart';
import 'package:onefish/widgets/homeItems/HomeTileGroupHeader.dart';
import 'package:onefish/widgets/themeItems/BottomNav.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onefish/utils/AppContextExtension.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final _scrollController = ScrollController();
  List<Map> adItems = [
    {"id": 1, 'title': 'Item 1', 'image': 'assets/images/dummy/Item1.png'},
    {"id": 2, 'title': 'Item 2', 'image': 'assets/images/dummy/Item2.png'},
    {"id": 3, 'title': 'Item 3', 'image': 'assets/images/dummy/Item3.png'},
  ];
  void moduleNavigator(int id) {
    serviceLocator.get<Log>().info('Navigate to $id');
  }

  void adNavigator(int id) {
    serviceLocator.get<Log>().info('Navigate to Ad  $id');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNav(),
        body: SafeArea(
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Expanded(
              child: Column(
                children: [
                  Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        color: context.resources.colors.primary,
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.w, vertical: 16.w),
                              child: CircleAvatar(
                                radius: 20,
                                backgroundImage: AssetImage(
                                    'assets/images/dummy/Profile.png'),
                              ),
                            ),
                          ],
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        context.resources.variables.sidePaddingAmount,
                        28.0,
                        0,
                        28),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: ListView.separated(
                        itemCount: adItems.length,
                        separatorBuilder: (_, __) => SizedBox(width: 16.h),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          if (index + 1 == adItems.length) {
                            return Padding(
                                padding: EdgeInsets.only(
                                    right: context
                                        .resources.variables.sidePaddingAmount),
                                child: HomeSliderItem(
                                    this.adItems[index]['id'],
                                    this.adItems[index]['image'],
                                    (val) => adNavigator(val)));
                          }
                          return HomeSliderItem(
                              this.adItems[index]['id'],
                              this.adItems[index]['image'],
                              (val) => adNavigator(val));
                        },
                      ),
                    ),
                  ),
                  Container(
                      // color: context.resources.colors.neutral200,
                      // height: 240.h,
                      width:
                          context.resources.variables.containerFrame(context),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HomeTileGroupHeader(context.resources.lang.helpInfo,
                              context.resources.colors.primary700),
                          Wrap(
                              direction: Axis.horizontal,
                              spacing: 12.w,
                              children: [
                                HomeTile(
                                    context.resources.lang.helpInfo,
                                    'assets/icon/home/information.svg',
                                    context.resources.colors.primary700,
                                    context.resources.colors.primary50,
                                    context.resources.colors.primary100,
                                    1,
                                    (val) => moduleNavigator(val)),
                                HomeTile(
                                    context.resources.lang.advice,
                                    'assets/icon/home/advice.svg',
                                    context.resources.colors.primary700,
                                    context.resources.colors.primary50,
                                    context.resources.colors.primary100,
                                    2,
                                    (val) => moduleNavigator(val)),
                                // Padding(padding: EdgeInsets.only(top: 8.w)),
                                HomeTile(
                                    context.resources.lang.feedRelated,
                                    'assets/icon/home/feedInfo.svg',
                                    context.resources.colors.primary700,
                                    context.resources.colors.primary50,
                                    context.resources.colors.primary100,
                                    3,
                                    (val) => moduleNavigator(val)),
                                HomeTile(
                                    context.resources.lang.weather,
                                    'assets/icon/home/weather.svg',
                                    context.resources.colors.primary700,
                                    context.resources.colors.primary50,
                                    context.resources.colors.primary100,
                                    4,
                                    (val) => moduleNavigator(val)),
                              ]),
                          SizedBox(
                            height: 28.w,
                          ),
                          HomeTileGroupHeader(context.resources.lang.trade,
                              context.resources.colors.secondary700),
                          Wrap(
                              direction: Axis.horizontal,
                              spacing: 12.w,
                              children: [
                                HomeTile(
                                    context.resources.lang.buyProduct,
                                    'assets/icon/home/package.svg',
                                    context.resources.colors.secondary700,
                                    context.resources.colors.secondary50,
                                    context.resources.colors.secondary100,
                                    5,
                                    (val) => moduleNavigator(val)),
                                HomeTile(
                                    context.resources.lang.sellFish,
                                    'assets/icon/home/fishSale.svg',
                                    context.resources.colors.secondary700,
                                    context.resources.colors.secondary50,
                                    context.resources.colors.secondary100,
                                    6,
                                    (val) => moduleNavigator(val)),
                                // Padding(padding: EdgeInsets.only(top: 8.w)),
                              ]),
                          SizedBox(
                            height: 28.w,
                          ),
                          HomeTileGroupHeader(
                              context.resources.lang.otherInfoAndServices,
                              context.resources.colors.tertiary700),
                          Wrap(
                              direction: Axis.horizontal,
                              spacing: 12.w,
                              children: [
                                HomeTile(
                                    context.resources.lang.marketActor,
                                    'assets/icon/home/marketActor.svg',
                                    context.resources.colors.tertiary700,
                                    context.resources.colors.tertiary50,
                                    context.resources.colors.tertiary100,
                                    7,
                                    (val) => moduleNavigator(val)),
                                HomeTile(
                                    context.resources.lang.financialHelp,
                                    'assets/icon/home/finance.svg',
                                    context.resources.colors.tertiary700,
                                    context.resources.colors.tertiary50,
                                    context.resources.colors.tertiary100,
                                    8,
                                    (val) => moduleNavigator(val)),
                                HomeTile(
                                    context.resources.lang.fishRelatedNews,
                                    'assets/icon/home/fishNews.svg',
                                    context.resources.colors.tertiary700,
                                    context.resources.colors.tertiary50,
                                    context.resources.colors.tertiary100,
                                    9,
                                    (val) => moduleNavigator(val)),
                                // Padding(padding: EdgeInsets.only(top: 8.w)),
                              ]),
                          SizedBox(
                            height: 28.w,
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ));
  }
}

class HomeSliderItem extends StatefulWidget {
  final int itemIndex;
  final String imagePath;
  final Function adOnTap;
  HomeSliderItem(this.itemIndex, this.imagePath, this.adOnTap, {Key? key})
      : super(key: key);

  @override
  _HomeSliderItemState createState() => _HomeSliderItemState();
}

class _HomeSliderItemState extends State<HomeSliderItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.adOnTap(widget.itemIndex),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.85,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: Image.asset(widget.imagePath).image,
              fit: BoxFit.cover,
            ),
            color: Colors.red,
            borderRadius: const BorderRadius.all(Radius.circular(8))),
      ),
    );
  }
}
