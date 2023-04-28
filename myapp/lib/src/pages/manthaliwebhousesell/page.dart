import 'dart:async';
import 'package:myapp/src/teta_files/imports.dart';
import 'package:myapp/constants.dart' as constantz;
import 'package:hive_flutter/hive_flutter.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import 'package:flutter_stripe/flutter_stripe.dart';
import 'dart:convert' as convert;

import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:io';
import 'package:font_awesome_flutter_named/font_awesome_flutter_named.dart';
import 'package:webviewx/webviewx.dart';

class PageManthaliwebHouseSell extends StatefulWidget {
  const PageManthaliwebHouseSell({
    Key? key,
  }) : super(key: key);

  @override
  _StateManthaliwebHouseSell createState() => _StateManthaliwebHouseSell();
}

class _StateManthaliwebHouseSell extends State<PageManthaliwebHouseSell> {
  WebViewXController? state1 = null;
  WebViewXController? state2 = null;

  var datasets = <String, dynamic>{};
  int index = 0;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    getDatasetsObject();
    super.initState();
    TetaCMS.instance.analytics.insertEvent(
      TetaAnalyticsType.usage,
      'App usage: view page',
      <String, dynamic>{
        'name': "ManthaliwebHouseSell",
      },
      isUserIdPreferableIfExists: true,
    );

    unawaited(
      Future.delayed(
        Duration.zero,
        () async {},
      ),
    );
  }

  void getDatasetsObject() {
    if (Hive.isBoxOpen('datasets')) {
      final box = Hive.box('datasets');
      var boxMap = box.toMap();
      for (dynamic key in boxMap.keys) {
        datasets[key.toString()] = boxMap[key];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: Container(
          width: double.maxFinite,
          height: getValueForScreenType<double?>(
            context: context,
            mobile: 70,
            tablet: null,
            desktop: null,
          ),
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.center,
              radius: 4,
              colors: <Color>[
                Color(0xFFFFFFFF).withOpacity(1),
                Color(0xFF44B9FF).withOpacity(1)
              ],
              stops: [0, 1],
            ),
            borderRadius: BorderRadius.zero,
          ),
          child: SafeArea(
            left: false,
            top: false,
            right: false,
            bottom: false,
            child: Padding(
              padding: getValueForScreenType<EdgeInsets>(
                context: context,
                mobile: const EdgeInsets.only(
                  left: 12,
                  right: 12,
                ),
                tablet: EdgeInsets.zero,
                desktop: EdgeInsets.zero,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () async {
                        if (_scaffoldKey.currentState != null) {
                          _scaffoldKey.currentState!.openDrawer();
                        }
                      },
                      child: Icon(
                        MdiIcons.fromString('menu'),
                        size: getValueForScreenType<double?>(
                          context: context,
                          mobile: 30,
                          tablet: 24,
                          desktop: 24,
                        ),
                        color: Color(0xFF000000).withOpacity(1),
                      )),
                  Text('मन्थली बजार',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: BlocProvider.of<ThemeCubit>(context)
                              .getColor('Text / Primary'),
                          fontWeight: FontWeight.w400,
                          fontSize: getValueForScreenType<double>(
                            context: context,
                            mobile: 20,
                            tablet: 16,
                            desktop: 16,
                          ),
                          fontStyle: FontStyle.normal,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      textAlign: TextAlign.left,
                      textDirection: TextDirection.ltr,
                      maxLines: 1),
                  GestureDetector(
                      onTap: () async {
                        await Navigator.push<void>(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PageHomePage(),
                          ),
                        );
                      },
                      child: Icon(
                        MdiIcons.fromString('share'),
                        size: getValueForScreenType<double?>(
                          context: context,
                          mobile: 30,
                          tablet: 24,
                          desktop: 24,
                        ),
                        color: Color(0xFF000000).withOpacity(1),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
      backgroundColor: const Color(0xFF000000),
      body: IntrinsicHeight(
        child: Stack(
          children: [
            Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                color: Color(0xFF000000).withOpacity(1),
                borderRadius: BorderRadius.zero,
              ),
              child: LayoutBuilder(builder: (context, constraints) {
                return WebViewX(
                  initialContent:
                      'https://manthalibazaar.blogspot.com/2020/01/blog-post.html',
                  initialSourceType: SourceType.url,
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,
                );
              }),
            ),
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  width: double.maxFinite,
                  height: getValueForScreenType<double?>(
                    context: context,
                    mobile: 80,
                    tablet: null,
                    desktop: null,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF).withOpacity(1),
                    borderRadius: getValueForScreenType<BorderRadius>(
                      context: context,
                      mobile: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                        bottomRight: Radius.circular(32),
                        bottomLeft: Radius.circular(32),
                      ),
                      tablet: BorderRadius.zero,
                      desktop: BorderRadius.zero,
                    ),
                  ),
                  child: Padding(
                    padding: getValueForScreenType<EdgeInsets>(
                      context: context,
                      mobile: const EdgeInsets.only(
                        left: 24,
                        right: 24,
                      ),
                      tablet: EdgeInsets.zero,
                      desktop: EdgeInsets.zero,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          MdiIcons.fromString('image'),
                          size: getValueForScreenType<double?>(
                            context: context,
                            mobile: 26,
                            tablet: 24,
                            desktop: 24,
                          ),
                          color: Color(0xFF000000).withOpacity(1),
                        ),
                        Icon(
                          MdiIcons.fromString('home'),
                          size: getValueForScreenType<double?>(
                            context: context,
                            mobile: 35,
                            tablet: 24,
                            desktop: 24,
                          ),
                          color: Color(0xFF000000).withOpacity(1),
                        ),
                        Icon(
                          MdiIcons.fromString('account'),
                          size: getValueForScreenType<double?>(
                            context: context,
                            mobile: 26,
                            tablet: 24,
                            desktop: 24,
                          ),
                          color: Color(0xFF000000).withOpacity(1),
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
