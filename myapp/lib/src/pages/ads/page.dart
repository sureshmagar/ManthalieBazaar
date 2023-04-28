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

class PageAds extends StatefulWidget {
  const PageAds({
    Key? key,
  }) : super(key: key);

  @override
  _StateAds createState() => _StateAds();
}

class _StateAds extends State<PageAds> {
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
        'name': "Ads",
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
      backgroundColor: const Color(0xFFFFFFFF),
      body: IntrinsicHeight(
        child: Stack(
          children: [
            Container(
              width: double.maxFinite,
              height: getValueForScreenType<double?>(
                context: context,
                mobile: double.maxFinite,
                tablet: null,
                desktop: null,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Color(0xFFFFFFFF).withOpacity(1),
                    Color(0xFFA7E2FF).withOpacity(1)
                  ],
                  stops: [0, 1],
                ),
                borderRadius: BorderRadius.zero,
              ),
              child: Center(
                child: Container(
                  width: double.maxFinite,
                  height: getValueForScreenType<double?>(
                    context: context,
                    mobile: 150,
                    tablet: null,
                    desktop: null,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFF000000).withOpacity(1),
                    borderRadius: BorderRadius.zero,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FutureBuilder<BannerAd>(
                        future:
                            Future.delayed(Duration(milliseconds: 0), () async {
                          final ad = BannerAd(
                            request: const AdRequest(),
                            adUnitId: UniversalPlatform.isIOS
                                ? 'iOS Ad unit Key'
                                : 'ca-app-pub-9033730368965591/7526988222',
                            listener: const BannerAdListener(),
                            size: AdSize.fluid,
                          );
                          await ad.load();
                          return ad;
                        }),
                        builder: (context, ad) {
                          if (ad.data == null) {
                            return Container();
                          }
                          return AdWidget(
                            ad: ad.data!,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
