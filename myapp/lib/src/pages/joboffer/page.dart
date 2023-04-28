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

class PageJobOffer extends StatefulWidget {
  const PageJobOffer({
    Key? key,
  }) : super(key: key);

  @override
  _StateJobOffer createState() => _StateJobOffer();
}

class _StateJobOffer extends State<PageJobOffer> {
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
        'name': "JobOffer",
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
            mobile: MediaQuery.of(context).size.height * 100 / 60,
            tablet: null,
            desktop: null,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Color(0xFFFFFFFF).withOpacity(1),
                Color(0xFFFFFFFF).withOpacity(1)
              ],
              stops: [0, 0],
            ),
            borderRadius: BorderRadius.zero,
            border: getValueForScreenType<Border>(
              context: context,
              mobile: Border(
                left: BorderSide(
                    width: 0, color: Color(0xFFFFFFFF).withOpacity(1)),
                top: BorderSide(
                    width: 0, color: Color(0xFFFFFFFF).withOpacity(1)),
                right: BorderSide(
                    width: 0, color: Color(0xFFFFFFFF).withOpacity(1)),
                bottom: BorderSide(
                    width: 2, color: Color(0xFFFFFFFF).withOpacity(1)),
              ),
              tablet: null,
              desktop: null,
            ),
          ),
          child: SafeArea(
            left: false,
            top: false,
            right: false,
            bottom: false,
            child: Row(
              children: [
                GestureDetector(
                    onTap: () async {
                      await Navigator.push<void>(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PageHomePage(),
                        ),
                      );
                    },
                    child: Padding(
                        padding: const EdgeInsets.only(
                          left: 24,
                        ),
                        child: Icon(
                          MdiIcons.fromString('arrow-left'),
                          size: getValueForScreenType<double?>(
                            context: context,
                            mobile: 32,
                            tablet: 24,
                            desktop: 24,
                          ),
                          color: Color(0xFF000000).withOpacity(1),
                        ))),
                Padding(
                    padding: getValueForScreenType<EdgeInsets>(
                      context: context,
                      mobile: const EdgeInsets.only(
                        left: 24,
                        right: 24,
                      ),
                      tablet: const EdgeInsets.only(
                        left: 2,
                      ),
                      desktop: const EdgeInsets.only(
                        left: 2,
                      ),
                    ),
                    child: Text('कर्मचारी आवश्यक',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: Color(0xFF000000).withOpacity(1),
                            fontWeight: FontWeight.w500,
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
                        maxLines: 1)),
              ],
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
                    Color(0xFF1C83F6).withOpacity(1)
                  ],
                  stops: [0, 1.2],
                ),
                borderRadius: BorderRadius.zero,
              ),
              child: NotificationListener<ScrollEndNotification>(
                onNotification: (final scrollEnd) {
                  final metrics = scrollEnd.metrics;
                  if (metrics.atEdge) {
                    final isTop = metrics.pixels == 0;
                    if (isTop) {
                    } else {}
                  }
                  return true;
                },
                child: ListView(
                  reverse: false,
                  primary: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: [
                    Container(
                      width: double.maxFinite,
                      height: getValueForScreenType<double?>(
                        context: context,
                        mobile: 390,
                        tablet: null,
                        desktop: null,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFFBE5FF).withOpacity(1),
                        borderRadius: getValueForScreenType<BorderRadius>(
                          context: context,
                          mobile: BorderRadius.only(
                            topLeft: Radius.circular(18),
                            topRight: Radius.circular(18),
                            bottomRight: Radius.circular(18),
                            bottomLeft: Radius.circular(18),
                          ),
                          tablet: BorderRadius.zero,
                          desktop: BorderRadius.zero,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.maxFinite,
                            height: getValueForScreenType<double?>(
                              context: context,
                              mobile: 220,
                              tablet: null,
                              desktop: null,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xFF000000).withOpacity(1),
                              borderRadius: BorderRadius.zero,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.zero,
                              child: Image.network(
                                'https://blogger.googleusercontent.com/img/a/AVvXsEjY53CRurmUVG_1_Grly-kPVEf3pM01O-7jturUZefhqCbn6xHR5JaNBQy3UFUu9GX1bgjtLX2Thq5Bhh6vA9fuQ1L4Pf-yREp3QL1Hf5UxoJliR47cg44JrzjdseBgOmW51ezq0BMZagX0k_zrmb6dNbT5Uvl3ln2-549BpjCLgdqBgvskiYJaI_w0nA=w640-h360',
                                width: double.maxFinite,
                                height: getValueForScreenType<double?>(
                                  context: context,
                                  mobile: 220,
                                  tablet: 150,
                                  desktop: 150,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                              padding: getValueForScreenType<EdgeInsets>(
                                context: context,
                                mobile: const EdgeInsets.only(
                                  left: 18,
                                  top: 10,
                                ),
                                tablet: const EdgeInsets.only(
                                  left: 18,
                                ),
                                desktop: const EdgeInsets.only(
                                  left: 18,
                                ),
                              ),
                              child: Text(
                                  '''नेपाली सबै प्रकारको खाना बनाउने कुक को आवस्यकता

तलब: 30,000 - 35,000
स्थान: लोकन्थली ( काठमाडौं)
( खान बस्न को सुबिधा)

सम्पर्क: 9803128501''',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color:
                                          BlocProvider.of<ThemeCubit>(context)
                                              .getColor('Text / Primary'),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      fontStyle: FontStyle.normal,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                  textAlign: TextAlign.left,
                                  textDirection: TextDirection.ltr,
                                  maxLines: 7)),
                        ],
                      ),
                    ),
                    Container(
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.zero,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FutureBuilder<BannerAd>(
                            future: Future.delayed(Duration(milliseconds: 0),
                                () async {
                              final ad = BannerAd(
                                request: const AdRequest(),
                                adUnitId: UniversalPlatform.isIOS
                                    ? 'ca-app-pub-9033730368965591/7526988222'
                                    : 'Android Ad unit key',
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
                    Container(
                      margin: getValueForScreenType<EdgeInsets>(
                        context: context,
                        mobile: const EdgeInsets.only(
                          top: 15,
                        ),
                        tablet: EdgeInsets.zero,
                        desktop: EdgeInsets.zero,
                      ),
                      width: double.maxFinite,
                      height: getValueForScreenType<double?>(
                        context: context,
                        mobile: 490,
                        tablet: null,
                        desktop: null,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFE5FFEE).withOpacity(1),
                        borderRadius: getValueForScreenType<BorderRadius>(
                          context: context,
                          mobile: BorderRadius.only(
                            topLeft: Radius.circular(18),
                            topRight: Radius.circular(18),
                            bottomRight: Radius.circular(18),
                            bottomLeft: Radius.circular(18),
                          ),
                          tablet: BorderRadius.zero,
                          desktop: BorderRadius.zero,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.maxFinite,
                            height: getValueForScreenType<double?>(
                              context: context,
                              mobile: 220,
                              tablet: null,
                              desktop: null,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xFF000000).withOpacity(1),
                              borderRadius: getValueForScreenType<BorderRadius>(
                                context: context,
                                mobile: BorderRadius.only(
                                  topLeft: Radius.circular(18),
                                  topRight: Radius.circular(18),
                                  bottomRight: Radius.circular(18),
                                  bottomLeft: Radius.circular(18),
                                ),
                                tablet: BorderRadius.zero,
                                desktop: BorderRadius.zero,
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: getValueForScreenType<BorderRadius>(
                                context: context,
                                mobile: BorderRadius.only(
                                  topLeft: Radius.circular(18),
                                  topRight: Radius.circular(18),
                                  bottomRight: Radius.circular(18),
                                  bottomLeft: Radius.circular(18),
                                ),
                                tablet: BorderRadius.zero,
                                desktop: BorderRadius.zero,
                              ),
                              child: Image.network(
                                'https://1.bp.blogspot.com/-dgI4ff-xBvY/YFX77If2jFI/AAAAAAAA3og/hisxtTh9yq00botLhf4YEyPtV2W-gdPEgCLcBGAsYHQ/w640-h464/Staf.jpg',
                                width: double.maxFinite,
                                height: getValueForScreenType<double?>(
                                  context: context,
                                  mobile: 220,
                                  tablet: 150,
                                  desktop: 150,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                              padding: getValueForScreenType<EdgeInsets>(
                                context: context,
                                mobile: const EdgeInsets.only(
                                  left: 18,
                                  top: 15,
                                ),
                                tablet: const EdgeInsets.only(
                                  left: 18,
                                ),
                                desktop: const EdgeInsets.only(
                                  left: 18,
                                ),
                              ),
                              child: Text('सिलाइ सम्बन्धि कर्मचारी आवश्यक',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Color(0xFF000000).withOpacity(1),
                                      fontWeight: FontWeight.w400,
                                      fontSize: getValueForScreenType<double>(
                                        context: context,
                                        mobile: 24,
                                        tablet: 16,
                                        desktop: 16,
                                      ),
                                      fontStyle: FontStyle.normal,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                  textAlign: TextAlign.left,
                                  textDirection: TextDirection.ltr,
                                  maxLines: 1)),
                          Padding(
                              padding: getValueForScreenType<EdgeInsets>(
                                context: context,
                                mobile: const EdgeInsets.only(
                                  left: 18,
                                  top: 15,
                                ),
                                tablet: const EdgeInsets.only(
                                  left: 18,
                                ),
                                desktop: const EdgeInsets.only(
                                  left: 18,
                                ),
                              ),
                              child: Text('''( खाना, बस्नको सुबिधा ) 
तलब Rs.10,000  
( 3 देखि 6 महिना काम अनुसार ) अरु काम अनुसार तलब बढाउने, 

सिलाइ सम्बन्धित सबै काम जानेको हुनुपर्ने, 
 
सम्पर्क: 9863023274, मन्थली बजार''',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color:
                                          BlocProvider.of<ThemeCubit>(context)
                                              .getColor('Text / Primary'),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      fontStyle: FontStyle.normal,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                  textAlign: TextAlign.left,
                                  textDirection: TextDirection.ltr,
                                  maxLines: 8)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
