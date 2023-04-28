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

class PageEntryPoint extends StatefulWidget {
  const PageEntryPoint({
    Key? key,
  }) : super(key: key);

  @override
  _StateEntryPoint createState() => _StateEntryPoint();
}

class _StateEntryPoint extends State<PageEntryPoint> {
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
        'name': "EntryPoint",
      },
      isUserIdPreferableIfExists: true,
    );

    unawaited(
      Future.delayed(
        Duration.zero,
        () async {
          await Future<void>.delayed(Duration(milliseconds: 800));
          await Navigator.push<void>(
            context,
            MaterialPageRoute(
              builder: (context) => PageHomePage(),
            ),
          );
        },
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
      backgroundColor: const Color(0xFF000000),
      body: IntrinsicHeight(
        child: Stack(
          children: [
            Container(
              width: getValueForScreenType<double?>(
                context: context,
                mobile: double.maxFinite,
                tablet: MediaQuery.of(context).size.width * 100 / 100,
                desktop: MediaQuery.of(context).size.width * 100 / 100,
              ),
              height: getValueForScreenType<double?>(
                context: context,
                mobile: double.maxFinite,
                tablet: MediaQuery.of(context).size.height * 100 / 100,
                desktop: MediaQuery.of(context).size.height * 100 / 100,
              ),
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.center,
                  radius: 1,
                  colors: <Color>[
                    Color(0xFFFFFFFF).withOpacity(1),
                    Color(0xFF1C83F6).withOpacity(1)
                  ],
                  stops: [0, 1],
                ),
                borderRadius: BorderRadius.zero,
              ),
              child: Padding(
                  padding: getValueForScreenType<EdgeInsets>(
                    context: context,
                    mobile: const EdgeInsets.only(
                      top: 300,
                    ),
                    tablet: const EdgeInsets.only(
                      top: 50,
                    ),
                    desktop: const EdgeInsets.only(
                      top: 50,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.zero,
                        child: Image.network(
                          'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgEU5d5Blvv5MtKyXTkSb8K_KSHrQJCvCLBEkXi7ZLslVkSeZRy7LFnQzleWv3QOUbJAS9AQk8PIaEK3b5kXSAebiJhsSBDwy-5ZmWx6Lb0q7UIAMV_6cMhM7RzcJ22-ZOax2F4B7jIBOFaxCol763t9_7kNGV4FHKuLOG5h1gAaPfxW-hg1nq-QRicZA/s320/New%20Manthali%20ICON.png',
                          width: getValueForScreenType<double?>(
                            context: context,
                            mobile: 100,
                            tablet: double.maxFinite,
                            desktop: double.maxFinite,
                          ),
                          height: getValueForScreenType<double?>(
                            context: context,
                            mobile: 100,
                            tablet: 150,
                            desktop: 150,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                                padding: getValueForScreenType<EdgeInsets>(
                                  context: context,
                                  mobile: const EdgeInsets.only(
                                    top: 35,
                                  ),
                                  tablet: const EdgeInsets.only(
                                    top: 15,
                                  ),
                                  desktop: const EdgeInsets.only(
                                    top: 15,
                                  ),
                                ),
                                child: Text('''मन्थली बजारमा
स्वागत छ
''',
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: Color(0xFF000000).withOpacity(1),
                                        fontWeight: FontWeight.w400,
                                        fontSize: getValueForScreenType<double>(
                                          context: context,
                                          mobile: 25,
                                          tablet: 30,
                                          desktop: 30,
                                        ),
                                        fontStyle: FontStyle.normal,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                    textAlign: TextAlign.center,
                                    textDirection: TextDirection.ltr,
                                    maxLines: 2)),
                          ],
                        ),
                      ),
                      Padding(
                          padding: getValueForScreenType<EdgeInsets>(
                            context: context,
                            mobile: const EdgeInsets.only(
                              top: 220,
                            ),
                            tablet: const EdgeInsets.only(
                              top: 200,
                            ),
                            desktop: const EdgeInsets.only(
                              top: 200,
                            ),
                          ),
                          child: Column(
                            children: [
                              Text('Connect Your Internet...',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color:
                                          BlocProvider.of<ThemeCubit>(context)
                                              .getColor('Text / Primary'),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      fontStyle: FontStyle.normal,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                  textAlign: TextAlign.left,
                                  textDirection: TextDirection.ltr,
                                  maxLines: 1),
                              Text('Version 1.0',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color:
                                          BlocProvider.of<ThemeCubit>(context)
                                              .getColor('Text / Primary'),
                                      fontWeight: FontWeight.w300,
                                      fontSize: 16,
                                      fontStyle: FontStyle.normal,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                  textAlign: TextAlign.left,
                                  textDirection: TextDirection.ltr,
                                  maxLines: 1),
                            ],
                          )),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
