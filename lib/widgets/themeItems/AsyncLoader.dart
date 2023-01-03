import 'package:flutter/material.dart';
import 'package:onefish/utils/AppContextExtension.dart';
import 'package:onefish/utils/ServiceLocator.dart';
import 'package:provider/provider.dart';
import 'package:onefish/view_model/LoaderModelView.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:onefish/utils/stream/InternetConnectivity.dart';
import 'dart:async';

class AsyncLoader extends StatefulWidget {
  final Widget child;
  const AsyncLoader({required this.child, Key? key}) : super(key: key);

  @override
  State<AsyncLoader> createState() => _AsyncLoaderState();
}

class _AsyncLoaderState extends State<AsyncLoader>
    with SingleTickerProviderStateMixin {
  bool _showLoader = true;
  late AnimationController _loaderAnimController;
  late Animation<double> _loaderAnimation;
  final Stream<ConnectivityResult> _connectivityStream =
      serviceLocator.get<InternetConnectivity>().isConnected();
  late final StreamSubscription<ConnectivityResult> _connectivitySubscription;

//Loading Animation Params
  Duration loaderAnimTime = const Duration(milliseconds: 1500);

  @override
  void initState() {
    _loaderAnimController = AnimationController(
      duration: loaderAnimTime,
      vsync: this,
    )..repeat(reverse: false);

    _loaderAnimation = CurvedAnimation(
        parent: _loaderAnimController, curve: Curves.decelerate);
    super.initState();
    checkNetConnectivity();
    Future<bool?>.delayed(const Duration(seconds: 2)).then((value) {
      setState(() {
        Provider.of<LoaderModelView>(context, listen: false)
            .setShowLoader(false);
        _showLoader =
            Provider.of<LoaderModelView>(context, listen: false).getShowLoader;
      });
    });
  }

  Future<void> checkNetConnectivity() async {
    context.resources.logger.info('Setting up Internet Connectivity Listener');

    _connectivitySubscription = _connectivityStream.listen(
        serviceLocator.get<InternetConnectivity>().updateConnectionStatus);
    _connectivitySubscription.onData(
        (dynamic data) => context.resources.logger.info('Change $data'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('AsyncLoader Scaffold'),
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        widget.child,
        Provider.of<LoaderModelView>(context).getShowLoader || _showLoader
            ? Container(
                color: context.resources.colors.neutral700.withOpacity(0.8),
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RotationTransition(
                      turns: _loaderAnimation,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Image.asset(
                              width: 40, height: 40, 'assets/icon/loader.png'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(context.resources.lang.loadingText,
                          style: context.resources.styles.headline6(
                              context.resources.colors.white,
                              context.resources.variables.primaryFontFamily)),
                    )
                  ],
                ),
              )
            : context.resources.variables.sizedBoxShrink,
      ]),
    );
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    _loaderAnimController.dispose();
    super.dispose();
  }
}
