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

class PagePhoneNumberNeed extends StatefulWidget {
  const PagePhoneNumberNeed({
    Key? key,
  }) : super(key: key);

  @override
  _StatePhoneNumberNeed createState() => _StatePhoneNumberNeed();
}

class _StatePhoneNumberNeed extends State<PagePhoneNumberNeed> {
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
        'name': "PhoneNumberNeed",
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
                    child: Text('आवश्यक  फोन नम्बर',
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
                  stops: [0, 1],
                ),
                borderRadius: BorderRadius.zero,
              ),
              child: SizedBox(
                width: double.maxFinite,
                height: 150,
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
                          mobile: 900,
                          tablet: null,
                          desktop: null,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF).withOpacity(1),
                          borderRadius: getValueForScreenType<BorderRadius>(
                            context: context,
                            mobile: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                              bottomRight: Radius.circular(16),
                              bottomLeft: Radius.circular(16),
                            ),
                            tablet: BorderRadius.zero,
                            desktop: BorderRadius.zero,
                          ),
                        ),
                        child: SizedBox(
                          width: double.maxFinite,
                          height: getValueForScreenType<double?>(
                            context: context,
                            mobile: 900,
                            tablet: 150,
                            desktop: 150,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: getValueForScreenType<EdgeInsets>(
                                    context: context,
                                    mobile: const EdgeInsets.only(
                                      left: 12,
                                      top: 10,
                                      bottom: 10,
                                    ),
                                    tablet: const EdgeInsets.only(
                                      left: 12,
                                    ),
                                    desktop: const EdgeInsets.only(
                                      left: 12,
                                    ),
                                  ),
                                  child: Text('आवश्यक  फोन न.',
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          color:
                                              Color(0xFF000000).withOpacity(1),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          fontStyle: FontStyle.normal,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                      textAlign: TextAlign.left,
                                      textDirection: TextDirection.ltr,
                                      maxLines: 1)),
                              Container(
                                width: double.maxFinite,
                                height: getValueForScreenType<double?>(
                                  context: context,
                                  mobile: 60,
                                  tablet: null,
                                  desktop: null,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xFFDEF9FF).withOpacity(1),
                                  borderRadius: BorderRadius.zero,
                                ),
                                child: Padding(
                                    padding: getValueForScreenType<EdgeInsets>(
                                      context: context,
                                      mobile: const EdgeInsets.only(
                                        left: 12,
                                        right: 12,
                                      ),
                                      tablet: const EdgeInsets.only(
                                        left: 12,
                                      ),
                                      desktop: const EdgeInsets.only(
                                        left: 12,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: EdgeInsets.zero,
                                              tablet: const EdgeInsets.only(
                                                left: 12,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                left: 12,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile: EdgeInsets.zero,
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          getValueForScreenType<
                                                              BorderRadius>(
                                                        context: context,
                                                        mobile:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  8),
                                                          topRight:
                                                              Radius.circular(
                                                                  8),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  8),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  8),
                                                        ),
                                                        tablet:
                                                            BorderRadius.zero,
                                                        desktop:
                                                            BorderRadius.zero,
                                                      ),
                                                      child: Image.network(
                                                        'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEg72D4JGsxsMcjNgmiEUIBAiGAzxmH1N4MmUFgCtiMmYplkBoztdNys1JR-tgywzHr-QstZ0SmaKH84q0f5cVNsOpt4OHl49kSDSImFQNK86d-YFFEhZJMmcXpXRB3Q7CSU-_bwGDdkp0a9Crma4ItYSGzq8Jz7lq3rl6QZMVAwqMZrKC7QSpUH5RW0iQ/w200-h200/NEA_Logo.png',
                                                        width:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 40,
                                                          tablet:
                                                              double.maxFinite,
                                                          desktop:
                                                              double.maxFinite,
                                                        ),
                                                        height:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 40,
                                                          tablet: 150,
                                                          desktop: 150,
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    )),
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        left: 16,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        left: 16,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text('बिधुत कार्यालय',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              textStyle:
                                                                  TextStyle(
                                                                color: BlocProvider.of<
                                                                            ThemeCubit>(
                                                                        context)
                                                                    .getColor(
                                                                        'Text / Primary'),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 16,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                              ),
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                            maxLines: 1),
                                                        Text('स्थान: बीच बजार',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              textStyle:
                                                                  TextStyle(
                                                                color: Color(
                                                                        0xFF000000)
                                                                    .withOpacity(
                                                                        1),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize:
                                                                    getValueForScreenType<
                                                                        double>(
                                                                  context:
                                                                      context,
                                                                  mobile: 12,
                                                                  tablet: 16,
                                                                  desktop: 16,
                                                                ),
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                              ),
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                            maxLines: 1),
                                                      ],
                                                    )),
                                              ],
                                            )),
                                        Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: EdgeInsets.zero,
                                              tablet: const EdgeInsets.only(
                                                left: 40,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                left: 40,
                                              ),
                                            ),
                                            child: Text('048-540051',
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    color: BlocProvider.of<
                                                            ThemeCubit>(context)
                                                        .getColor(
                                                            'Text / Primary'),
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                    fontStyle: FontStyle.normal,
                                                    decoration:
                                                        TextDecoration.none,
                                                  ),
                                                ),
                                                textAlign: TextAlign.left,
                                                textDirection:
                                                    TextDirection.ltr,
                                                maxLines: 1)),
                                      ],
                                    )),
                              ),
                              Container(
                                width: double.maxFinite,
                                height: getValueForScreenType<double?>(
                                  context: context,
                                  mobile: 60,
                                  tablet: null,
                                  desktop: null,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xFFFFFFFF).withOpacity(1),
                                  borderRadius: BorderRadius.zero,
                                ),
                                child: Padding(
                                    padding: getValueForScreenType<EdgeInsets>(
                                      context: context,
                                      mobile: const EdgeInsets.only(
                                        left: 12,
                                        right: 12,
                                      ),
                                      tablet: const EdgeInsets.only(
                                        left: 12,
                                      ),
                                      desktop: const EdgeInsets.only(
                                        left: 12,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: EdgeInsets.zero,
                                              tablet: const EdgeInsets.only(
                                                left: 8,
                                                right: 8,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                left: 8,
                                                right: 8,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile: EdgeInsets.zero,
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          getValueForScreenType<
                                                              BorderRadius>(
                                                        context: context,
                                                        mobile:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  8),
                                                          topRight:
                                                              Radius.circular(
                                                                  8),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  8),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  8),
                                                        ),
                                                        tablet:
                                                            BorderRadius.zero,
                                                        desktop:
                                                            BorderRadius.zero,
                                                      ),
                                                      child: Image.network(
                                                        'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgrpOl1FT0mYnBI3uRLILTpBaQBWwn2vQpxc8BC1W8hYBzV7dEv2CvWUnn0gZAYli8sWfcw-0Duddp23NxLwCxEBZYr91UR72DtOxABgtM5R58re2r8rrUOUDFmSZKheF35uZaeDuO_8wAMoPBYbQmbmbYonvtEnsZqcutOO-tfC2aQg0EhjWGLKCUnRg/w200-h200/Nepali%20Police.png',
                                                        width:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 40,
                                                          tablet:
                                                              double.maxFinite,
                                                          desktop:
                                                              double.maxFinite,
                                                        ),
                                                        height:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 40,
                                                          tablet: 150,
                                                          desktop: 150,
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    )),
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        left: 16,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        left: 16,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text('प्रहरी कार्यालय',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              textStyle:
                                                                  TextStyle(
                                                                color: BlocProvider.of<
                                                                            ThemeCubit>(
                                                                        context)
                                                                    .getColor(
                                                                        'Text / Primary'),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 16,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                              ),
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                            maxLines: 1),
                                                        Text('स्थान: बीच बजार',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              textStyle:
                                                                  TextStyle(
                                                                color: Color(
                                                                        0xFF000000)
                                                                    .withOpacity(
                                                                        1),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize:
                                                                    getValueForScreenType<
                                                                        double>(
                                                                  context:
                                                                      context,
                                                                  mobile: 12,
                                                                  tablet: 16,
                                                                  desktop: 16,
                                                                ),
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                              ),
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                            maxLines: 1),
                                                      ],
                                                    )),
                                              ],
                                            )),
                                        Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: EdgeInsets.zero,
                                              tablet: const EdgeInsets.only(
                                                left: 40,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                left: 40,
                                              ),
                                            ),
                                            child: Text('''048-540099
048-540100''',
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    color: BlocProvider.of<
                                                            ThemeCubit>(context)
                                                        .getColor(
                                                            'Text / Primary'),
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                    fontStyle: FontStyle.normal,
                                                    decoration:
                                                        TextDecoration.none,
                                                  ),
                                                ),
                                                textAlign: TextAlign.left,
                                                textDirection:
                                                    TextDirection.ltr,
                                                maxLines: 2)),
                                      ],
                                    )),
                              ),
                              Container(
                                width: double.maxFinite,
                                height: getValueForScreenType<double?>(
                                  context: context,
                                  mobile: 60,
                                  tablet: null,
                                  desktop: null,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xFFDEF9FF).withOpacity(1),
                                  borderRadius: BorderRadius.zero,
                                ),
                                child: Padding(
                                    padding: getValueForScreenType<EdgeInsets>(
                                      context: context,
                                      mobile: const EdgeInsets.only(
                                        left: 12,
                                        right: 12,
                                      ),
                                      tablet: const EdgeInsets.only(
                                        left: 12,
                                      ),
                                      desktop: const EdgeInsets.only(
                                        left: 12,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: EdgeInsets.zero,
                                              tablet: const EdgeInsets.only(
                                                left: 12,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                left: 12,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile: EdgeInsets.zero,
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          getValueForScreenType<
                                                              BorderRadius>(
                                                        context: context,
                                                        mobile:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  8),
                                                          topRight:
                                                              Radius.circular(
                                                                  8),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  8),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  8),
                                                        ),
                                                        tablet:
                                                            BorderRadius.zero,
                                                        desktop:
                                                            BorderRadius.zero,
                                                      ),
                                                      child: Image.network(
                                                        'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiPDIsOMyuK7qSdlieMn-xVSDZvZtEzo_ZtqkN_7O6O0aNaAF98Zh3IMZx-etR6LqtpzfUdxHwnYi32KWNtjRDsM3fXSjn1vg0V8sAG1p0wugHmA6I1nBta4QGrmVBzL4nSkAvZZ75olRk0UTPOMvsFmOUOmYjaL7yd0Qx8APknsSksLaMQbpv9rKMlkA/w200-h200/Jilla%20Prasaans%20Office.jpg',
                                                        width:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 40,
                                                          tablet:
                                                              double.maxFinite,
                                                          desktop:
                                                              double.maxFinite,
                                                        ),
                                                        height:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 40,
                                                          tablet: 150,
                                                          desktop: 150,
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    )),
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        left: 16,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        left: 16,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            'जिल्ला प्रसासन कार्यालय',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              textStyle:
                                                                  TextStyle(
                                                                color: BlocProvider.of<
                                                                            ThemeCubit>(
                                                                        context)
                                                                    .getColor(
                                                                        'Text / Primary'),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 16,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                              ),
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                            maxLines: 1),
                                                        Text('स्थान: बीच बजार',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              textStyle:
                                                                  TextStyle(
                                                                color: Color(
                                                                        0xFF000000)
                                                                    .withOpacity(
                                                                        1),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize:
                                                                    getValueForScreenType<
                                                                        double>(
                                                                  context:
                                                                      context,
                                                                  mobile: 12,
                                                                  tablet: 16,
                                                                  desktop: 16,
                                                                ),
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                              ),
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                            maxLines: 1),
                                                      ],
                                                    )),
                                              ],
                                            )),
                                        Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: EdgeInsets.zero,
                                              tablet: const EdgeInsets.only(
                                                left: 40,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                left: 40,
                                              ),
                                            ),
                                            child: Text('048-540133',
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    color: BlocProvider.of<
                                                            ThemeCubit>(context)
                                                        .getColor(
                                                            'Text / Primary'),
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                    fontStyle: FontStyle.normal,
                                                    decoration:
                                                        TextDecoration.none,
                                                  ),
                                                ),
                                                textAlign: TextAlign.left,
                                                textDirection:
                                                    TextDirection.ltr,
                                                maxLines: 1)),
                                      ],
                                    )),
                              ),
                              Container(
                                width: double.maxFinite,
                                height: getValueForScreenType<double?>(
                                  context: context,
                                  mobile: 60,
                                  tablet: null,
                                  desktop: null,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xFFFFFFFF).withOpacity(1),
                                  borderRadius: BorderRadius.zero,
                                ),
                                child: Padding(
                                    padding: getValueForScreenType<EdgeInsets>(
                                      context: context,
                                      mobile: const EdgeInsets.only(
                                        left: 12,
                                        right: 12,
                                      ),
                                      tablet: const EdgeInsets.only(
                                        left: 12,
                                      ),
                                      desktop: const EdgeInsets.only(
                                        left: 12,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: EdgeInsets.zero,
                                              tablet: const EdgeInsets.only(
                                                left: 8,
                                                right: 8,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                left: 8,
                                                right: 8,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile: EdgeInsets.zero,
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          getValueForScreenType<
                                                              BorderRadius>(
                                                        context: context,
                                                        mobile:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  8),
                                                          topRight:
                                                              Radius.circular(
                                                                  8),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  8),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  8),
                                                        ),
                                                        tablet:
                                                            BorderRadius.zero,
                                                        desktop:
                                                            BorderRadius.zero,
                                                      ),
                                                      child: Image.network(
                                                        'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhPIH8aDPJv7098YIv69oQYpawGRmdmO5GGHMnBj46E0xgwF76bXo5b588NSgHoMPt55bTiut9TyoY2DxIS24m_Rt1S_jWTvahdFljixhtdyGH_JISX1ze1MImVcWiMkUCKT8i1WRTsjWqIftFSP11QdPLdR6zaVTvppiXIDScec2feYBQkLbOEBc5Qfg/w200-h200/Napi%20Office%20icon.jpg',
                                                        width:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 40,
                                                          tablet:
                                                              double.maxFinite,
                                                          desktop:
                                                              double.maxFinite,
                                                        ),
                                                        height:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 40,
                                                          tablet: 150,
                                                          desktop: 150,
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    )),
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        left: 16,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        left: 16,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text('नापी कार्यालय',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              textStyle:
                                                                  TextStyle(
                                                                color: BlocProvider.of<
                                                                            ThemeCubit>(
                                                                        context)
                                                                    .getColor(
                                                                        'Text / Primary'),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 16,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                              ),
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                            maxLines: 1),
                                                        Text('स्थान: बीच बजार',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              textStyle:
                                                                  TextStyle(
                                                                color: Color(
                                                                        0xFF000000)
                                                                    .withOpacity(
                                                                        1),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize:
                                                                    getValueForScreenType<
                                                                        double>(
                                                                  context:
                                                                      context,
                                                                  mobile: 12,
                                                                  tablet: 16,
                                                                  desktop: 16,
                                                                ),
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                              ),
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                            maxLines: 1),
                                                      ],
                                                    )),
                                              ],
                                            )),
                                        Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: EdgeInsets.zero,
                                              tablet: const EdgeInsets.only(
                                                left: 40,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                left: 40,
                                              ),
                                            ),
                                            child: Text('048-540074',
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    color: BlocProvider.of<
                                                            ThemeCubit>(context)
                                                        .getColor(
                                                            'Text / Primary'),
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                    fontStyle: FontStyle.normal,
                                                    decoration:
                                                        TextDecoration.none,
                                                  ),
                                                ),
                                                textAlign: TextAlign.left,
                                                textDirection:
                                                    TextDirection.ltr,
                                                maxLines: 1)),
                                      ],
                                    )),
                              ),
                              Container(
                                width: double.maxFinite,
                                height: getValueForScreenType<double?>(
                                  context: context,
                                  mobile: 60,
                                  tablet: null,
                                  desktop: null,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xFFDEF9FF).withOpacity(1),
                                  borderRadius: BorderRadius.zero,
                                ),
                                child: Padding(
                                    padding: getValueForScreenType<EdgeInsets>(
                                      context: context,
                                      mobile: const EdgeInsets.only(
                                        left: 12,
                                        right: 12,
                                      ),
                                      tablet: const EdgeInsets.only(
                                        left: 12,
                                      ),
                                      desktop: const EdgeInsets.only(
                                        left: 12,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: EdgeInsets.zero,
                                              tablet: const EdgeInsets.only(
                                                left: 12,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                left: 12,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile: EdgeInsets.zero,
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          getValueForScreenType<
                                                              BorderRadius>(
                                                        context: context,
                                                        mobile:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  8),
                                                          topRight:
                                                              Radius.circular(
                                                                  8),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  8),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  8),
                                                        ),
                                                        tablet:
                                                            BorderRadius.zero,
                                                        desktop:
                                                            BorderRadius.zero,
                                                      ),
                                                      child: Image.network(
                                                        'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEifuHxSmWMg15F0SuGaQFlI2IUWGZaiT5uDSgDKP33uhSMCr7X16i1OkDlkQ1mdkQvBz_4JvBRgYR3hthz7SijYJ1QuArqor6Rv3s_LoURHnRh3c0rY9Z_SWiVcWg7gTeQ_OPxR4urCS9hPZ75QguJ45SASLEPF7osweNhkPawKbt5IiSQ-T5_bTDbnkQ/w200-h168/Nepali%20Logo.png',
                                                        width:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 40,
                                                          tablet:
                                                              double.maxFinite,
                                                          desktop:
                                                              double.maxFinite,
                                                        ),
                                                        height:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 40,
                                                          tablet: 150,
                                                          desktop: 150,
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    )),
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        left: 16,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        left: 16,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text('हुलाक कार्यालय',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              textStyle:
                                                                  TextStyle(
                                                                color: BlocProvider.of<
                                                                            ThemeCubit>(
                                                                        context)
                                                                    .getColor(
                                                                        'Text / Primary'),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 16,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                              ),
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                            maxLines: 1),
                                                        Text('स्थान: बीच बजार',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              textStyle:
                                                                  TextStyle(
                                                                color: Color(
                                                                        0xFF000000)
                                                                    .withOpacity(
                                                                        1),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize:
                                                                    getValueForScreenType<
                                                                        double>(
                                                                  context:
                                                                      context,
                                                                  mobile: 12,
                                                                  tablet: 16,
                                                                  desktop: 16,
                                                                ),
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                              ),
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                            maxLines: 1),
                                                      ],
                                                    )),
                                              ],
                                            )),
                                        Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: EdgeInsets.zero,
                                              tablet: const EdgeInsets.only(
                                                left: 40,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                left: 40,
                                              ),
                                            ),
                                            child: Text('048-540035',
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    color: BlocProvider.of<
                                                            ThemeCubit>(context)
                                                        .getColor(
                                                            'Text / Primary'),
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                    fontStyle: FontStyle.normal,
                                                    decoration:
                                                        TextDecoration.none,
                                                  ),
                                                ),
                                                textAlign: TextAlign.left,
                                                textDirection:
                                                    TextDirection.ltr,
                                                maxLines: 1)),
                                      ],
                                    )),
                              ),
                              Container(
                                width: double.maxFinite,
                                height: getValueForScreenType<double?>(
                                  context: context,
                                  mobile: 60,
                                  tablet: null,
                                  desktop: null,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xFFFFFFFF).withOpacity(1),
                                  borderRadius: BorderRadius.zero,
                                ),
                                child: Padding(
                                    padding: getValueForScreenType<EdgeInsets>(
                                      context: context,
                                      mobile: const EdgeInsets.only(
                                        left: 12,
                                        right: 12,
                                      ),
                                      tablet: const EdgeInsets.only(
                                        left: 12,
                                      ),
                                      desktop: const EdgeInsets.only(
                                        left: 12,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: EdgeInsets.zero,
                                              tablet: const EdgeInsets.only(
                                                left: 8,
                                                right: 8,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                left: 8,
                                                right: 8,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile: EdgeInsets.zero,
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          getValueForScreenType<
                                                              BorderRadius>(
                                                        context: context,
                                                        mobile:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  8),
                                                          topRight:
                                                              Radius.circular(
                                                                  8),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  8),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  8),
                                                        ),
                                                        tablet:
                                                            BorderRadius.zero,
                                                        desktop:
                                                            BorderRadius.zero,
                                                      ),
                                                      child: Image.network(
                                                        'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEi-9C6YZ_pL69A2TbPM7szzwoIPP87NDokGwsElOeujOM77v-c_C5zwtAi_TjcHUucBB7ag38Lysd69gLyWnyyORrsSFq037VqqQw9SvoM3el1ajupg4jG6JSr_98z2MIduV-3dRW0UNdJvnldttFTpQ738OiPCigQgTpqkN1e-1xkGLgUaIUK12mLedQ/w200-h189/Nepal%20Election%20Commencino%20.jpg',
                                                        width:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 40,
                                                          tablet:
                                                              double.maxFinite,
                                                          desktop:
                                                              double.maxFinite,
                                                        ),
                                                        height:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 40,
                                                          tablet: 150,
                                                          desktop: 150,
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    )),
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        left: 16,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        left: 16,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            'निर्वाचन कार्यालय',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              textStyle:
                                                                  TextStyle(
                                                                color: BlocProvider.of<
                                                                            ThemeCubit>(
                                                                        context)
                                                                    .getColor(
                                                                        'Text / Primary'),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 16,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                              ),
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                            maxLines: 1),
                                                        Text('स्थान: बसपार्क',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              textStyle:
                                                                  TextStyle(
                                                                color: Color(
                                                                        0xFF000000)
                                                                    .withOpacity(
                                                                        1),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize:
                                                                    getValueForScreenType<
                                                                        double>(
                                                                  context:
                                                                      context,
                                                                  mobile: 12,
                                                                  tablet: 16,
                                                                  desktop: 16,
                                                                ),
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                              ),
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                            maxLines: 1),
                                                      ],
                                                    )),
                                              ],
                                            )),
                                        Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: EdgeInsets.zero,
                                              tablet: const EdgeInsets.only(
                                                left: 40,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                left: 40,
                                              ),
                                            ),
                                            child: Text('048-540146',
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    color: BlocProvider.of<
                                                            ThemeCubit>(context)
                                                        .getColor(
                                                            'Text / Primary'),
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                    fontStyle: FontStyle.normal,
                                                    decoration:
                                                        TextDecoration.none,
                                                  ),
                                                ),
                                                textAlign: TextAlign.left,
                                                textDirection:
                                                    TextDirection.ltr,
                                                maxLines: 1)),
                                      ],
                                    )),
                              ),
                              Container(
                                width: double.maxFinite,
                                height: getValueForScreenType<double?>(
                                  context: context,
                                  mobile: 60,
                                  tablet: null,
                                  desktop: null,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xFFDEF9FF).withOpacity(1),
                                  borderRadius: BorderRadius.zero,
                                ),
                                child: Padding(
                                    padding: getValueForScreenType<EdgeInsets>(
                                      context: context,
                                      mobile: const EdgeInsets.only(
                                        left: 12,
                                        right: 12,
                                      ),
                                      tablet: const EdgeInsets.only(
                                        left: 12,
                                      ),
                                      desktop: const EdgeInsets.only(
                                        left: 12,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: EdgeInsets.zero,
                                              tablet: const EdgeInsets.only(
                                                left: 12,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                left: 12,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile: EdgeInsets.zero,
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          getValueForScreenType<
                                                              BorderRadius>(
                                                        context: context,
                                                        mobile:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  8),
                                                          topRight:
                                                              Radius.circular(
                                                                  8),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  8),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  8),
                                                        ),
                                                        tablet:
                                                            BorderRadius.zero,
                                                        desktop:
                                                            BorderRadius.zero,
                                                      ),
                                                      child: Image.network(
                                                        'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjTZhw0ckTFcuqdBpCR2NnqGBQCwE8I-YMdXAlG_CtTK_6OnZQo4pks7vB_9NkOtdpV3ND2wb6m0o-hFhx_wppix_gVRdCqdqsWFjrKwsFlVEpiEZ_GFWHhlKNweiCkS_qm4a4ksKTem-q8T8nUif8TovY2mS44vQQncC5ANrvvKDX7Vga5eZED58ygnQ/w200-h200/Nepal%20Telecom.png',
                                                        width:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 40,
                                                          tablet:
                                                              double.maxFinite,
                                                          desktop:
                                                              double.maxFinite,
                                                        ),
                                                        height:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 40,
                                                          tablet: 150,
                                                          desktop: 150,
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    )),
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        left: 16,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        left: 16,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text('नेपाल टेलिकम',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              textStyle:
                                                                  TextStyle(
                                                                color: BlocProvider.of<
                                                                            ThemeCubit>(
                                                                        context)
                                                                    .getColor(
                                                                        'Text / Primary'),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 16,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                              ),
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                            maxLines: 1),
                                                        Text('स्थान: बीच बजार',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              textStyle:
                                                                  TextStyle(
                                                                color: Color(
                                                                        0xFF000000)
                                                                    .withOpacity(
                                                                        1),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize:
                                                                    getValueForScreenType<
                                                                        double>(
                                                                  context:
                                                                      context,
                                                                  mobile: 12,
                                                                  tablet: 16,
                                                                  desktop: 16,
                                                                ),
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                              ),
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                            maxLines: 1),
                                                      ],
                                                    )),
                                              ],
                                            )),
                                        Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: EdgeInsets.zero,
                                              tablet: const EdgeInsets.only(
                                                left: 40,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                left: 40,
                                              ),
                                            ),
                                            child: Text('''048-540002
048-540122''',
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    color: BlocProvider.of<
                                                            ThemeCubit>(context)
                                                        .getColor(
                                                            'Text / Primary'),
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                    fontStyle: FontStyle.normal,
                                                    decoration:
                                                        TextDecoration.none,
                                                  ),
                                                ),
                                                textAlign: TextAlign.left,
                                                textDirection:
                                                    TextDirection.ltr,
                                                maxLines: 2)),
                                      ],
                                    )),
                              ),
                              Container(
                                width: double.maxFinite,
                                height: getValueForScreenType<double?>(
                                  context: context,
                                  mobile: 60,
                                  tablet: null,
                                  desktop: null,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xFFFFFFFF).withOpacity(1),
                                  borderRadius: BorderRadius.zero,
                                ),
                                child: Padding(
                                    padding: getValueForScreenType<EdgeInsets>(
                                      context: context,
                                      mobile: const EdgeInsets.only(
                                        left: 12,
                                        right: 12,
                                      ),
                                      tablet: const EdgeInsets.only(
                                        left: 12,
                                      ),
                                      desktop: const EdgeInsets.only(
                                        left: 12,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: EdgeInsets.zero,
                                              tablet: const EdgeInsets.only(
                                                left: 8,
                                                right: 8,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                left: 8,
                                                right: 8,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile: EdgeInsets.zero,
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          getValueForScreenType<
                                                              BorderRadius>(
                                                        context: context,
                                                        mobile:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  8),
                                                          topRight:
                                                              Radius.circular(
                                                                  8),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  8),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  8),
                                                        ),
                                                        tablet:
                                                            BorderRadius.zero,
                                                        desktop:
                                                            BorderRadius.zero,
                                                      ),
                                                      child: Image.network(
                                                        'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgl_9wzx_dDRRVEXy04Cmfi-NHqI8eBBrj8gl9DoDxOs2MvTarEOJAY3tEj3mUb4tMY5e3l4NzTuqPBQmDKVdHOXF-w5-LpYZlbtpmKHQrYGIeltlR4um-N5tRYfBXroMPzTgTTqE5c5yV2bVuElVLmOCbNmTz-zAQpRBU8xpreuW-Riyh1HDJSQOd7fQ/s1600/Nepal%20Water%20Supply.png',
                                                        width:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 40,
                                                          tablet:
                                                              double.maxFinite,
                                                          desktop:
                                                              double.maxFinite,
                                                        ),
                                                        height:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 40,
                                                          tablet: 150,
                                                          desktop: 150,
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    )),
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        left: 16,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        left: 16,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            'खानेपानी कार्यालय',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              textStyle:
                                                                  TextStyle(
                                                                color: BlocProvider.of<
                                                                            ThemeCubit>(
                                                                        context)
                                                                    .getColor(
                                                                        'Text / Primary'),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 16,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                              ),
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                            maxLines: 1),
                                                        Text('स्थान: बीच बजार',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              textStyle:
                                                                  TextStyle(
                                                                color: Color(
                                                                        0xFF000000)
                                                                    .withOpacity(
                                                                        1),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize:
                                                                    getValueForScreenType<
                                                                        double>(
                                                                  context:
                                                                      context,
                                                                  mobile: 12,
                                                                  tablet: 16,
                                                                  desktop: 16,
                                                                ),
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                              ),
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                            maxLines: 1),
                                                      ],
                                                    )),
                                              ],
                                            )),
                                        Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: EdgeInsets.zero,
                                              tablet: const EdgeInsets.only(
                                                left: 40,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                left: 40,
                                              ),
                                            ),
                                            child: Text('048-540052',
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    color: BlocProvider.of<
                                                            ThemeCubit>(context)
                                                        .getColor(
                                                            'Text / Primary'),
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                    fontStyle: FontStyle.normal,
                                                    decoration:
                                                        TextDecoration.none,
                                                  ),
                                                ),
                                                textAlign: TextAlign.left,
                                                textDirection:
                                                    TextDirection.ltr,
                                                maxLines: 1)),
                                      ],
                                    )),
                              ),
                              Container(
                                width: double.maxFinite,
                                height: getValueForScreenType<double?>(
                                  context: context,
                                  mobile: 60,
                                  tablet: null,
                                  desktop: null,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xFFDEF9FF).withOpacity(1),
                                  borderRadius: BorderRadius.zero,
                                ),
                                child: Padding(
                                    padding: getValueForScreenType<EdgeInsets>(
                                      context: context,
                                      mobile: const EdgeInsets.only(
                                        left: 12,
                                        right: 12,
                                      ),
                                      tablet: const EdgeInsets.only(
                                        left: 12,
                                      ),
                                      desktop: const EdgeInsets.only(
                                        left: 12,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: EdgeInsets.zero,
                                              tablet: const EdgeInsets.only(
                                                left: 12,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                left: 12,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile: EdgeInsets.zero,
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          getValueForScreenType<
                                                              BorderRadius>(
                                                        context: context,
                                                        mobile:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  8),
                                                          topRight:
                                                              Radius.circular(
                                                                  8),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  8),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  8),
                                                        ),
                                                        tablet:
                                                            BorderRadius.zero,
                                                        desktop:
                                                            BorderRadius.zero,
                                                      ),
                                                      child: Image.network(
                                                        'https://blogger.googleusercontent.com/img/a/AVvXsEis_KoDaHsgZ_rxFaUwwI5Zx0M88fVbQJYL1rrFHD60DNBWrMuD5emKzRYvvzK9G0dUKovFbLrohEK8az65J7S0lzigtA0xmxZ3frzGuHlOr0jozgZ2UvDIunGh-OUG8cZzZh26QJ6N6MNEO-_vD-jOjymMvKskL0y2BPeJDyoElZsZyl9WogQwfYjHxQ=w200-h200',
                                                        width:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 40,
                                                          tablet:
                                                              double.maxFinite,
                                                          desktop:
                                                              double.maxFinite,
                                                        ),
                                                        height:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 40,
                                                          tablet: 150,
                                                          desktop: 150,
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    )),
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        left: 16,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        left: 16,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text('तामाकोशी अस्पताल',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              textStyle:
                                                                  TextStyle(
                                                                color: BlocProvider.of<
                                                                            ThemeCubit>(
                                                                        context)
                                                                    .getColor(
                                                                        'Text / Primary'),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 16,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                              ),
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                            maxLines: 1),
                                                        Text('स्थान: बिपी चोक',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              textStyle:
                                                                  TextStyle(
                                                                color: Color(
                                                                        0xFF000000)
                                                                    .withOpacity(
                                                                        1),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize:
                                                                    getValueForScreenType<
                                                                        double>(
                                                                  context:
                                                                      context,
                                                                  mobile: 12,
                                                                  tablet: 16,
                                                                  desktop: 16,
                                                                ),
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                              ),
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                            maxLines: 1),
                                                      ],
                                                    )),
                                              ],
                                            )),
                                        Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: EdgeInsets.zero,
                                              tablet: const EdgeInsets.only(
                                                left: 40,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                left: 40,
                                              ),
                                            ),
                                            child: Text('048-540210',
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    color: BlocProvider.of<
                                                            ThemeCubit>(context)
                                                        .getColor(
                                                            'Text / Primary'),
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                    fontStyle: FontStyle.normal,
                                                    decoration:
                                                        TextDecoration.none,
                                                  ),
                                                ),
                                                textAlign: TextAlign.left,
                                                textDirection:
                                                    TextDirection.ltr,
                                                maxLines: 2)),
                                      ],
                                    )),
                              ),
                              Container(
                                width: double.maxFinite,
                                height: getValueForScreenType<double?>(
                                  context: context,
                                  mobile: 60,
                                  tablet: null,
                                  desktop: null,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xFFFFFFFF).withOpacity(1),
                                  borderRadius: BorderRadius.zero,
                                ),
                                child: Padding(
                                    padding: getValueForScreenType<EdgeInsets>(
                                      context: context,
                                      mobile: const EdgeInsets.only(
                                        left: 12,
                                        right: 12,
                                      ),
                                      tablet: const EdgeInsets.only(
                                        left: 12,
                                      ),
                                      desktop: const EdgeInsets.only(
                                        left: 12,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: EdgeInsets.zero,
                                              tablet: const EdgeInsets.only(
                                                left: 8,
                                                right: 8,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                left: 8,
                                                right: 8,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile: EdgeInsets.zero,
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          getValueForScreenType<
                                                              BorderRadius>(
                                                        context: context,
                                                        mobile:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  8),
                                                          topRight:
                                                              Radius.circular(
                                                                  8),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  8),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  8),
                                                        ),
                                                        tablet:
                                                            BorderRadius.zero,
                                                        desktop:
                                                            BorderRadius.zero,
                                                      ),
                                                      child: Image.network(
                                                        'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjpxHirn-EKk7ef24bmTG-SUYju1uq0b547yG-FkPIqBw88O-70FOA4vYO87huDCwxX26cXoCR7xqpS7k8immrIBe0b5X_VSXKI9MEvPg4WWvmLikensPDl_Dl6QHwP_0boX-ttehFOC5FNGpUgSbMVGTcXOrbrRrX45o6-u5d8gTuFhooG3bBgkV4Lfg/w200-h200/5%20manthali.jpg',
                                                        width:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 40,
                                                          tablet:
                                                              double.maxFinite,
                                                          desktop:
                                                              double.maxFinite,
                                                        ),
                                                        height:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 40,
                                                          tablet: 150,
                                                          desktop: 150,
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    )),
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        left: 16,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        left: 16,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text('करदाता कार्यालय',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              textStyle:
                                                                  TextStyle(
                                                                color: BlocProvider.of<
                                                                            ThemeCubit>(
                                                                        context)
                                                                    .getColor(
                                                                        'Text / Primary'),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 16,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                              ),
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                            maxLines: 1),
                                                        Text('स्थान: खादबारी',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              textStyle:
                                                                  TextStyle(
                                                                color: Color(
                                                                        0xFF000000)
                                                                    .withOpacity(
                                                                        1),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize:
                                                                    getValueForScreenType<
                                                                        double>(
                                                                  context:
                                                                      context,
                                                                  mobile: 12,
                                                                  tablet: 16,
                                                                  desktop: 16,
                                                                ),
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                              ),
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                            maxLines: 1),
                                                      ],
                                                    )),
                                              ],
                                            )),
                                        Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: EdgeInsets.zero,
                                              tablet: const EdgeInsets.only(
                                                left: 40,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                left: 40,
                                              ),
                                            ),
                                            child: Text('048-540095',
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    color: BlocProvider.of<
                                                            ThemeCubit>(context)
                                                        .getColor(
                                                            'Text / Primary'),
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                    fontStyle: FontStyle.normal,
                                                    decoration:
                                                        TextDecoration.none,
                                                  ),
                                                ),
                                                textAlign: TextAlign.left,
                                                textDirection:
                                                    TextDirection.ltr,
                                                maxLines: 2)),
                                      ],
                                    )),
                              ),
                              Container(
                                width: double.maxFinite,
                                height: getValueForScreenType<double?>(
                                  context: context,
                                  mobile: 60,
                                  tablet: null,
                                  desktop: null,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xFFDEF9FF).withOpacity(1),
                                  borderRadius: BorderRadius.zero,
                                ),
                                child: Padding(
                                    padding: getValueForScreenType<EdgeInsets>(
                                      context: context,
                                      mobile: const EdgeInsets.only(
                                        left: 12,
                                        right: 12,
                                      ),
                                      tablet: const EdgeInsets.only(
                                        left: 12,
                                      ),
                                      desktop: const EdgeInsets.only(
                                        left: 12,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: EdgeInsets.zero,
                                              tablet: const EdgeInsets.only(
                                                left: 12,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                left: 12,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile: EdgeInsets.zero,
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          getValueForScreenType<
                                                              BorderRadius>(
                                                        context: context,
                                                        mobile:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  8),
                                                          topRight:
                                                              Radius.circular(
                                                                  8),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  8),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  8),
                                                        ),
                                                        tablet:
                                                            BorderRadius.zero,
                                                        desktop:
                                                            BorderRadius.zero,
                                                      ),
                                                      child: Image.network(
                                                        'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiZrZqClexEtjg_6id4I4vCyv7ZsgyTVre8HN6QASSD_dilv22qH_E0XZ112umaxosYnx_mpFKLyM7YY0V8eltnlVGom_yOl9au2k89vIAnnxNIZHWTIh3CQddboGy91qowjCHL1H2ptpd4gE-ZVwM3u4brFBl4lax2uzz2dgsWy9U6gBaC0nMCu09TIA/w200-h200/1%201%20manthali.jpg',
                                                        width:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 40,
                                                          tablet:
                                                              double.maxFinite,
                                                          desktop:
                                                              double.maxFinite,
                                                        ),
                                                        height:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 40,
                                                          tablet: 150,
                                                          desktop: 150,
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    )),
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        left: 16,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        left: 16,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            'कोष तथा नियन्त्रण कार्यालय',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              textStyle:
                                                                  TextStyle(
                                                                color: BlocProvider.of<
                                                                            ThemeCubit>(
                                                                        context)
                                                                    .getColor(
                                                                        'Text / Primary'),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 16,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                              ),
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                            maxLines: 1),
                                                        Text('स्थान: बीच बजार',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              textStyle:
                                                                  TextStyle(
                                                                color: Color(
                                                                        0xFF000000)
                                                                    .withOpacity(
                                                                        1),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize:
                                                                    getValueForScreenType<
                                                                        double>(
                                                                  context:
                                                                      context,
                                                                  mobile: 12,
                                                                  tablet: 16,
                                                                  desktop: 16,
                                                                ),
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                              ),
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                            maxLines: 1),
                                                      ],
                                                    )),
                                              ],
                                            )),
                                        Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: EdgeInsets.zero,
                                              tablet: const EdgeInsets.only(
                                                left: 40,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                left: 40,
                                              ),
                                            ),
                                            child: Text('048-540115',
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    color: BlocProvider.of<
                                                            ThemeCubit>(context)
                                                        .getColor(
                                                            'Text / Primary'),
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                    fontStyle: FontStyle.normal,
                                                    decoration:
                                                        TextDecoration.none,
                                                  ),
                                                ),
                                                textAlign: TextAlign.left,
                                                textDirection:
                                                    TextDirection.ltr,
                                                maxLines: 2)),
                                      ],
                                    )),
                              ),
                              Container(
                                width: double.maxFinite,
                                height: getValueForScreenType<double?>(
                                  context: context,
                                  mobile: 60,
                                  tablet: null,
                                  desktop: null,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xFFFFFFFF).withOpacity(1),
                                  borderRadius: BorderRadius.zero,
                                ),
                                child: Padding(
                                    padding: getValueForScreenType<EdgeInsets>(
                                      context: context,
                                      mobile: const EdgeInsets.only(
                                        left: 12,
                                        right: 12,
                                      ),
                                      tablet: const EdgeInsets.only(
                                        left: 12,
                                      ),
                                      desktop: const EdgeInsets.only(
                                        left: 12,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: EdgeInsets.zero,
                                              tablet: const EdgeInsets.only(
                                                left: 8,
                                                right: 8,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                left: 8,
                                                right: 8,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile: EdgeInsets.zero,
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          getValueForScreenType<
                                                              BorderRadius>(
                                                        context: context,
                                                        mobile:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  8),
                                                          topRight:
                                                              Radius.circular(
                                                                  8),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  8),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  8),
                                                        ),
                                                        tablet:
                                                            BorderRadius.zero,
                                                        desktop:
                                                            BorderRadius.zero,
                                                      ),
                                                      child: Image.network(
                                                        'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgKvEYHPS8Po0hkAnQXK_4wob6F-vsj3J2oHc3ek6dJxSzoqzwhm-3L6nvQLJr5d8XrFxkd0Qld0WgFCCkQHpwN336CS59IVFLm0CqGRfIi3hl6tWRPsNxpryYcwqkhFJi_hZO63SlZ7fPVS4KxLlahEpAw8JbNosouJ0VxPPK_Y7CLQtPExsZQAsPzRg/w200-h200/2%20manthali.jpg',
                                                        width:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 40,
                                                          tablet:
                                                              double.maxFinite,
                                                          desktop:
                                                              double.maxFinite,
                                                        ),
                                                        height:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 40,
                                                          tablet: 150,
                                                          desktop: 150,
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    )),
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        left: 16,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        left: 16,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            'मन्थली उधोग वाणीज्य संघ',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              textStyle:
                                                                  TextStyle(
                                                                color: BlocProvider.of<
                                                                            ThemeCubit>(
                                                                        context)
                                                                    .getColor(
                                                                        'Text / Primary'),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 16,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                              ),
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                            maxLines: 1),
                                                        Text('स्थान: बीच बजार',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              textStyle:
                                                                  TextStyle(
                                                                color: Color(
                                                                        0xFF000000)
                                                                    .withOpacity(
                                                                        1),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize:
                                                                    getValueForScreenType<
                                                                        double>(
                                                                  context:
                                                                      context,
                                                                  mobile: 12,
                                                                  tablet: 16,
                                                                  desktop: 16,
                                                                ),
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                              ),
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                            maxLines: 1),
                                                      ],
                                                    )),
                                              ],
                                            )),
                                        Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: EdgeInsets.zero,
                                              tablet: const EdgeInsets.only(
                                                left: 40,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                left: 40,
                                              ),
                                            ),
                                            child: Text('048-540028',
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    color: BlocProvider.of<
                                                            ThemeCubit>(context)
                                                        .getColor(
                                                            'Text / Primary'),
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                    fontStyle: FontStyle.normal,
                                                    decoration:
                                                        TextDecoration.none,
                                                  ),
                                                ),
                                                textAlign: TextAlign.left,
                                                textDirection:
                                                    TextDirection.ltr,
                                                maxLines: 2)),
                                      ],
                                    )),
                              ),
                              Container(
                                width: double.maxFinite,
                                height: getValueForScreenType<double?>(
                                  context: context,
                                  mobile: 60,
                                  tablet: null,
                                  desktop: null,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xFFDEF9FF).withOpacity(1),
                                  borderRadius: BorderRadius.zero,
                                ),
                                child: Padding(
                                    padding: getValueForScreenType<EdgeInsets>(
                                      context: context,
                                      mobile: const EdgeInsets.only(
                                        left: 12,
                                        right: 12,
                                      ),
                                      tablet: const EdgeInsets.only(
                                        left: 12,
                                      ),
                                      desktop: const EdgeInsets.only(
                                        left: 12,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: EdgeInsets.zero,
                                              tablet: const EdgeInsets.only(
                                                left: 12,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                left: 12,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile: EdgeInsets.zero,
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          getValueForScreenType<
                                                              BorderRadius>(
                                                        context: context,
                                                        mobile:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  8),
                                                          topRight:
                                                              Radius.circular(
                                                                  8),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  8),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  8),
                                                        ),
                                                        tablet:
                                                            BorderRadius.zero,
                                                        desktop:
                                                            BorderRadius.zero,
                                                      ),
                                                      child: Image.network(
                                                        'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgAyF3ZTCS9b0AaUtL9MzpuoK9DqkHdLOIGb5vnlJEZ-uRe8LpcNdmBC8KEOI09X2T8N4SJW26mPhsmmZnBxlpO1SIuIRVgyvr8b0q00-CLyfUUisMc134JQDLHkjrIFbvEpgiu8vNfblC24GbR7yM9jZrDyv5v-Yu-BJvs1Ap48t1LRIRMJfDZ4eVWbQ/w200-h200/3%20manthali.jpg',
                                                        width:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 40,
                                                          tablet:
                                                              double.maxFinite,
                                                          desktop:
                                                              double.maxFinite,
                                                        ),
                                                        height:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 40,
                                                          tablet: 150,
                                                          desktop: 150,
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    )),
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        left: 16,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        left: 16,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            'रामेछाप जिल्ला अदालत',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              textStyle:
                                                                  TextStyle(
                                                                color: BlocProvider.of<
                                                                            ThemeCubit>(
                                                                        context)
                                                                    .getColor(
                                                                        'Text / Primary'),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 16,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                              ),
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                            maxLines: 1),
                                                        Text('स्थान: बीच बजार',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              textStyle:
                                                                  TextStyle(
                                                                color: Color(
                                                                        0xFF000000)
                                                                    .withOpacity(
                                                                        1),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize:
                                                                    getValueForScreenType<
                                                                        double>(
                                                                  context:
                                                                      context,
                                                                  mobile: 12,
                                                                  tablet: 16,
                                                                  desktop: 16,
                                                                ),
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                              ),
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                            maxLines: 1),
                                                      ],
                                                    )),
                                              ],
                                            )),
                                        Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: EdgeInsets.zero,
                                              tablet: const EdgeInsets.only(
                                                left: 40,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                left: 40,
                                              ),
                                            ),
                                            child: Text('048-540037',
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    color: BlocProvider.of<
                                                            ThemeCubit>(context)
                                                        .getColor(
                                                            'Text / Primary'),
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                    fontStyle: FontStyle.normal,
                                                    decoration:
                                                        TextDecoration.none,
                                                  ),
                                                ),
                                                textAlign: TextAlign.left,
                                                textDirection:
                                                    TextDirection.ltr,
                                                maxLines: 2)),
                                      ],
                                    )),
                              ),
                              Container(
                                width: double.maxFinite,
                                height: getValueForScreenType<double?>(
                                  context: context,
                                  mobile: 60,
                                  tablet: null,
                                  desktop: null,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xFFFFFFFF).withOpacity(1),
                                  borderRadius: BorderRadius.zero,
                                ),
                                child: Padding(
                                    padding: getValueForScreenType<EdgeInsets>(
                                      context: context,
                                      mobile: const EdgeInsets.only(
                                        left: 12,
                                        right: 12,
                                      ),
                                      tablet: const EdgeInsets.only(
                                        left: 12,
                                      ),
                                      desktop: const EdgeInsets.only(
                                        left: 12,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: EdgeInsets.zero,
                                              tablet: const EdgeInsets.only(
                                                left: 8,
                                                right: 8,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                left: 8,
                                                right: 8,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile: EdgeInsets.zero,
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          getValueForScreenType<
                                                              BorderRadius>(
                                                        context: context,
                                                        mobile:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  8),
                                                          topRight:
                                                              Radius.circular(
                                                                  8),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  8),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  8),
                                                        ),
                                                        tablet:
                                                            BorderRadius.zero,
                                                        desktop:
                                                            BorderRadius.zero,
                                                      ),
                                                      child: Image.network(
                                                        'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEg6MOWgCFPWJV3TlAaJ3MBsrpUNoXBAgNM_jW9Ab5roTII7Jr5_WYF8hvZnWHc4gZejzO2sSn4ZFEF_xHJ7vSyjtvTFoJwAKg5g4Fftnx-b05zHtLxtUjQqOCVdxNxGTZOVBxF-0Tue5s1QKIxTJcAUbxTsYY8Qu85iZhWzvNmnyVbPbfYvlnZgaDGUmw/w200-h200/4%20manthali.jpg',
                                                        width:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 40,
                                                          tablet:
                                                              double.maxFinite,
                                                          desktop:
                                                              double.maxFinite,
                                                        ),
                                                        height:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 40,
                                                          tablet: 150,
                                                          desktop: 150,
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    )),
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        left: 16,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        left: 16,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            '''जलस्रोत तथा सिचाई विकास 
डिभिजन''',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              textStyle:
                                                                  TextStyle(
                                                                color: BlocProvider.of<
                                                                            ThemeCubit>(
                                                                        context)
                                                                    .getColor(
                                                                        'Text / Primary'),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 16,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                              ),
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                            maxLines: 2),
                                                        Text('स्थान: बीच बजार',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              textStyle:
                                                                  TextStyle(
                                                                color: Color(
                                                                        0xFF000000)
                                                                    .withOpacity(
                                                                        1),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize:
                                                                    getValueForScreenType<
                                                                        double>(
                                                                  context:
                                                                      context,
                                                                  mobile: 12,
                                                                  tablet: 16,
                                                                  desktop: 16,
                                                                ),
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                              ),
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                            maxLines: 1),
                                                      ],
                                                    )),
                                              ],
                                            )),
                                        Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: EdgeInsets.zero,
                                              tablet: const EdgeInsets.only(
                                                left: 40,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                left: 40,
                                              ),
                                            ),
                                            child: Text('048-540118',
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    color: BlocProvider.of<
                                                            ThemeCubit>(context)
                                                        .getColor(
                                                            'Text / Primary'),
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                    fontStyle: FontStyle.normal,
                                                    decoration:
                                                        TextDecoration.none,
                                                  ),
                                                ),
                                                textAlign: TextAlign.left,
                                                textDirection:
                                                    TextDirection.ltr,
                                                maxLines: 2)),
                                      ],
                                    )),
                              ),
                            ],
                          ),
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
                                      ? 'iOS Ad unit Key'
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
                      AnimationConfiguration.staggeredList(
                        position: 12,
                        duration: Duration(
                          milliseconds: 800,
                        ),
                        child: FadeInAnimation(
                          child: SlideAnimation(
                            child: Padding(
                                padding: getValueForScreenType<EdgeInsets>(
                                  context: context,
                                  mobile: const EdgeInsets.only(
                                    top: 10,
                                  ),
                                  tablet: const EdgeInsets.only(
                                    left: 8,
                                    top: 8,
                                    right: 8,
                                    bottom: 8,
                                  ),
                                  desktop: const EdgeInsets.only(
                                    left: 8,
                                    top: 8,
                                    right: 8,
                                    bottom: 8,
                                  ),
                                ),
                                child: Card(
                                  elevation: 8,
                                  color: Color(0xFFFFFFFF).withOpacity(1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(8),
                                      bottomRight: Radius.circular(8),
                                      bottomLeft: Radius.circular(8),
                                    ),
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                      left: 8,
                                      top: 8,
                                      right: 8,
                                      bottom: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: <Color>[
                                          Color(0xFF1C83F6).withOpacity(1),
                                          Color(0xFFFFFFFF).withOpacity(1)
                                        ],
                                        stops: [0, 1],
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        topRight: Radius.circular(8),
                                        bottomRight: Radius.circular(8),
                                        bottomLeft: Radius.circular(8),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          padding:
                                              getValueForScreenType<EdgeInsets>(
                                            context: context,
                                            mobile: EdgeInsets.zero,
                                            tablet: const EdgeInsets.only(
                                              left: 32,
                                              top: 32,
                                              right: 32,
                                              bottom: 32,
                                            ),
                                            desktop: const EdgeInsets.only(
                                              left: 32,
                                              top: 32,
                                              right: 32,
                                              bottom: 32,
                                            ),
                                          ),
                                          width: getValueForScreenType<double?>(
                                            context: context,
                                            mobile: 110,
                                            tablet: null,
                                            desktop: null,
                                          ),
                                          height:
                                              getValueForScreenType<double?>(
                                            context: context,
                                            mobile: 110,
                                            tablet: null,
                                            desktop: null,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFFFFFF)
                                                .withOpacity(1),
                                            borderRadius: getValueForScreenType<
                                                BorderRadius>(
                                              context: context,
                                              mobile: BorderRadius.only(
                                                topLeft: Radius.circular(16),
                                                topRight: Radius.circular(16),
                                                bottomRight:
                                                    Radius.circular(16),
                                                bottomLeft: Radius.circular(16),
                                              ),
                                              tablet: BorderRadius.only(
                                                topLeft: Radius.circular(8),
                                                topRight: Radius.circular(8),
                                                bottomRight: Radius.circular(8),
                                                bottomLeft: Radius.circular(8),
                                              ),
                                              desktop: BorderRadius.only(
                                                topLeft: Radius.circular(8),
                                                topRight: Radius.circular(8),
                                                bottomRight: Radius.circular(8),
                                                bottomLeft: Radius.circular(8),
                                              ),
                                            ),
                                          ),
                                          child: ClipRRect(
                                            borderRadius: getValueForScreenType<
                                                BorderRadius>(
                                              context: context,
                                              mobile: BorderRadius.only(
                                                topLeft: Radius.circular(16),
                                                topRight: Radius.circular(16),
                                                bottomRight:
                                                    Radius.circular(16),
                                                bottomLeft: Radius.circular(16),
                                              ),
                                              tablet: BorderRadius.zero,
                                              desktop: BorderRadius.zero,
                                            ),
                                            child: Image.network(
                                              'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgAyF3ZTCS9b0AaUtL9MzpuoK9DqkHdLOIGb5vnlJEZ-uRe8LpcNdmBC8KEOI09X2T8N4SJW26mPhsmmZnBxlpO1SIuIRVgyvr8b0q00-CLyfUUisMc134JQDLHkjrIFbvEpgiu8vNfblC24GbR7yM9jZrDyv5v-Yu-BJvs1Ap48t1LRIRMJfDZ4eVWbQ/w200-h200/3%20manthali.jpg',
                                              width: getValueForScreenType<
                                                  double?>(
                                                context: context,
                                                mobile: 110,
                                                tablet: double.maxFinite,
                                                desktop: double.maxFinite,
                                              ),
                                              height: getValueForScreenType<
                                                  double?>(
                                                context: context,
                                                mobile: 110,
                                                tablet: 150,
                                                desktop: 150,
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.only(
                                              left: 16,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('रामेछाप जिल्ला अदालत',
                                                    style: GoogleFonts.poppins(
                                                      textStyle: TextStyle(
                                                        color: Color(0xFF000000)
                                                            .withOpacity(1),
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 18,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        decoration:
                                                            TextDecoration.none,
                                                      ),
                                                    ),
                                                    textAlign: TextAlign.left,
                                                    textDirection:
                                                        TextDirection.ltr,
                                                    maxLines: 1),
                                                Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      top: 8,
                                                      bottom: 4,
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          MdiIcons.fromString(
                                                              'crosshairs-gps'),
                                                          size: 20,
                                                          color: Color(
                                                                  0xFF000000)
                                                              .withOpacity(1),
                                                        ),
                                                        Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                              left: 4,
                                                            ),
                                                            child: Text(
                                                                'बीच बजार, मन्थली',
                                                                style:
                                                                    GoogleFonts
                                                                        .poppins(
                                                                  textStyle:
                                                                      TextStyle(
                                                                    color: Color(
                                                                            0xFF000000)
                                                                        .withOpacity(
                                                                            1),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        16,
                                                                    fontStyle:
                                                                        FontStyle
                                                                            .normal,
                                                                    decoration:
                                                                        TextDecoration
                                                                            .none,
                                                                  ),
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                textDirection:
                                                                    TextDirection
                                                                        .ltr,
                                                                maxLines: 1)),
                                                      ],
                                                    )),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      MdiIcons.fromString(
                                                          'phone-outline'),
                                                      size: 20,
                                                      color: Color(0xFF000000)
                                                          .withOpacity(1),
                                                    ),
                                                    Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          left: 4,
                                                        ),
                                                        child: Text(
                                                            '048-540037',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              textStyle:
                                                                  TextStyle(
                                                                color: Color(
                                                                        0xFF000000)
                                                                    .withOpacity(
                                                                        1),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 16,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                              ),
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                            maxLines: 1)),
                                                  ],
                                                ),
                                              ],
                                            )),
                                      ],
                                    ),
                                  ),
                                )),
                          ),
                        ),
                      ),
                      Container(
                        width: double.maxFinite,
                        height: getValueForScreenType<double?>(
                          context: context,
                          mobile: 650,
                          tablet: null,
                          desktop: null,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF).withOpacity(1),
                          borderRadius: getValueForScreenType<BorderRadius>(
                            context: context,
                            mobile: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                              bottomRight: Radius.circular(16),
                              bottomLeft: Radius.circular(16),
                            ),
                            tablet: BorderRadius.zero,
                            desktop: BorderRadius.zero,
                          ),
                        ),
                        child: SizedBox(
                          width: double.maxFinite,
                          height: getValueForScreenType<double?>(
                            context: context,
                            mobile: 650,
                            tablet: 150,
                            desktop: 150,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: getValueForScreenType<EdgeInsets>(
                                    context: context,
                                    mobile: const EdgeInsets.only(
                                      left: 12,
                                      top: 10,
                                      bottom: 10,
                                    ),
                                    tablet: const EdgeInsets.only(
                                      left: 12,
                                    ),
                                    desktop: const EdgeInsets.only(
                                      left: 12,
                                    ),
                                  ),
                                  child: Text('आवश्यक  बैक  फोन न.',
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          color:
                                              Color(0xFF000000).withOpacity(1),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          fontStyle: FontStyle.normal,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                      textAlign: TextAlign.left,
                                      textDirection: TextDirection.ltr,
                                      maxLines: 1)),
                              Container(
                                width: double.maxFinite,
                                height: getValueForScreenType<double?>(
                                  context: context,
                                  mobile: 60,
                                  tablet: null,
                                  desktop: null,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xFFDEF9FF).withOpacity(1),
                                  borderRadius: BorderRadius.zero,
                                ),
                                child: Padding(
                                    padding: getValueForScreenType<EdgeInsets>(
                                      context: context,
                                      mobile: const EdgeInsets.only(
                                        left: 12,
                                        right: 12,
                                      ),
                                      tablet: const EdgeInsets.only(
                                        left: 12,
                                      ),
                                      desktop: const EdgeInsets.only(
                                        left: 12,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: EdgeInsets.zero,
                                              tablet: const EdgeInsets.only(
                                                left: 12,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                left: 12,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile: EdgeInsets.zero,
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          getValueForScreenType<
                                                              BorderRadius>(
                                                        context: context,
                                                        mobile:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  8),
                                                          topRight:
                                                              Radius.circular(
                                                                  8),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  8),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  8),
                                                        ),
                                                        tablet:
                                                            BorderRadius.zero,
                                                        desktop:
                                                            BorderRadius.zero,
                                                      ),
                                                      child: Image.network(
                                                        'https://kaha6.com/wp-content/uploads/Rastriya-Banijya-Bank-logo.jpg',
                                                        width:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 40,
                                                          tablet:
                                                              double.maxFinite,
                                                          desktop:
                                                              double.maxFinite,
                                                        ),
                                                        height:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 40,
                                                          tablet: 150,
                                                          desktop: 150,
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    )),
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        left: 16,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        left: 16,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            'रास्ट्रीय वाणीज्य बैक',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              textStyle:
                                                                  TextStyle(
                                                                color: BlocProvider.of<
                                                                            ThemeCubit>(
                                                                        context)
                                                                    .getColor(
                                                                        'Text / Primary'),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 16,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                              ),
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                            maxLines: 1),
                                                        Text('स्थान: बीच बजार',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              textStyle:
                                                                  TextStyle(
                                                                color: Color(
                                                                        0xFF000000)
                                                                    .withOpacity(
                                                                        1),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize:
                                                                    getValueForScreenType<
                                                                        double>(
                                                                  context:
                                                                      context,
                                                                  mobile: 12,
                                                                  tablet: 16,
                                                                  desktop: 16,
                                                                ),
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                              ),
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                            maxLines: 1),
                                                      ],
                                                    )),
                                              ],
                                            )),
                                        Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: EdgeInsets.zero,
                                              tablet: const EdgeInsets.only(
                                                left: 40,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                left: 40,
                                              ),
                                            ),
                                            child: Text('048-540055',
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    color: BlocProvider.of<
                                                            ThemeCubit>(context)
                                                        .getColor(
                                                            'Text / Primary'),
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                    fontStyle: FontStyle.normal,
                                                    decoration:
                                                        TextDecoration.none,
                                                  ),
                                                ),
                                                textAlign: TextAlign.left,
                                                textDirection:
                                                    TextDirection.ltr,
                                                maxLines: 1)),
                                      ],
                                    )),
                              ),
                              Container(
                                width: double.maxFinite,
                                height: getValueForScreenType<double?>(
                                  context: context,
                                  mobile: 60,
                                  tablet: null,
                                  desktop: null,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xFFFFFFFF).withOpacity(1),
                                  borderRadius: BorderRadius.zero,
                                ),
                                child: Padding(
                                    padding: getValueForScreenType<EdgeInsets>(
                                      context: context,
                                      mobile: const EdgeInsets.only(
                                        left: 12,
                                        right: 12,
                                      ),
                                      tablet: const EdgeInsets.only(
                                        left: 12,
                                      ),
                                      desktop: const EdgeInsets.only(
                                        left: 12,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: EdgeInsets.zero,
                                              tablet: const EdgeInsets.only(
                                                left: 8,
                                                right: 8,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                left: 8,
                                                right: 8,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile: EdgeInsets.zero,
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          getValueForScreenType<
                                                              BorderRadius>(
                                                        context: context,
                                                        mobile:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  8),
                                                          topRight:
                                                              Radius.circular(
                                                                  8),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  8),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  8),
                                                        ),
                                                        tablet:
                                                            BorderRadius.zero,
                                                        desktop:
                                                            BorderRadius.zero,
                                                      ),
                                                      child: Image.network(
                                                        'https://www.collegenp.com/uploads/2018/11/Agricultural-Development-Bank.jpg',
                                                        width:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 40,
                                                          tablet:
                                                              double.maxFinite,
                                                          desktop:
                                                              double.maxFinite,
                                                        ),
                                                        height:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 40,
                                                          tablet: 150,
                                                          desktop: 150,
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    )),
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        left: 16,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        left: 16,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text('कृषि बिकास बैक',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              textStyle:
                                                                  TextStyle(
                                                                color: BlocProvider.of<
                                                                            ThemeCubit>(
                                                                        context)
                                                                    .getColor(
                                                                        'Text / Primary'),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 16,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                              ),
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                            maxLines: 1),
                                                        Text('स्थान: बीच बजार',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              textStyle:
                                                                  TextStyle(
                                                                color: Color(
                                                                        0xFF000000)
                                                                    .withOpacity(
                                                                        1),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize:
                                                                    getValueForScreenType<
                                                                        double>(
                                                                  context:
                                                                      context,
                                                                  mobile: 12,
                                                                  tablet: 16,
                                                                  desktop: 16,
                                                                ),
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                              ),
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                            maxLines: 1),
                                                      ],
                                                    )),
                                              ],
                                            )),
                                        Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: EdgeInsets.zero,
                                              tablet: const EdgeInsets.only(
                                                left: 40,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                left: 40,
                                              ),
                                            ),
                                            child: Text('048-540030',
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    color: BlocProvider.of<
                                                            ThemeCubit>(context)
                                                        .getColor(
                                                            'Text / Primary'),
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                    fontStyle: FontStyle.normal,
                                                    decoration:
                                                        TextDecoration.none,
                                                  ),
                                                ),
                                                textAlign: TextAlign.left,
                                                textDirection:
                                                    TextDirection.ltr,
                                                maxLines: 1)),
                                      ],
                                    )),
                              ),
                              Container(
                                width: double.maxFinite,
                                height: getValueForScreenType<double?>(
                                  context: context,
                                  mobile: 60,
                                  tablet: null,
                                  desktop: null,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xFFDEF9FF).withOpacity(1),
                                  borderRadius: BorderRadius.zero,
                                ),
                                child: Padding(
                                    padding: getValueForScreenType<EdgeInsets>(
                                      context: context,
                                      mobile: const EdgeInsets.only(
                                        left: 12,
                                        right: 12,
                                      ),
                                      tablet: const EdgeInsets.only(
                                        left: 12,
                                      ),
                                      desktop: const EdgeInsets.only(
                                        left: 12,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: EdgeInsets.zero,
                                              tablet: const EdgeInsets.only(
                                                left: 12,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                left: 12,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile: EdgeInsets.zero,
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          getValueForScreenType<
                                                              BorderRadius>(
                                                        context: context,
                                                        mobile:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  8),
                                                          topRight:
                                                              Radius.circular(
                                                                  8),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  8),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  8),
                                                        ),
                                                        tablet:
                                                            BorderRadius.zero,
                                                        desktop:
                                                            BorderRadius.zero,
                                                      ),
                                                      child: Image.network(
                                                        'https://corporatekhabar.com/wp-content/uploads/2021/11/NMB.png',
                                                        width:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 40,
                                                          tablet:
                                                              double.maxFinite,
                                                          desktop:
                                                              double.maxFinite,
                                                        ),
                                                        height:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 40,
                                                          tablet: 150,
                                                          desktop: 150,
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    )),
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        left: 16,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        left: 16,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text('NMB बैक',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              textStyle:
                                                                  TextStyle(
                                                                color: BlocProvider.of<
                                                                            ThemeCubit>(
                                                                        context)
                                                                    .getColor(
                                                                        'Text / Primary'),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 16,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                              ),
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                            maxLines: 1),
                                                        Text('स्थान: बीच बजार',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              textStyle:
                                                                  TextStyle(
                                                                color: Color(
                                                                        0xFF000000)
                                                                    .withOpacity(
                                                                        1),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize:
                                                                    getValueForScreenType<
                                                                        double>(
                                                                  context:
                                                                      context,
                                                                  mobile: 12,
                                                                  tablet: 16,
                                                                  desktop: 16,
                                                                ),
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                              ),
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                            maxLines: 1),
                                                      ],
                                                    )),
                                              ],
                                            )),
                                        Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: EdgeInsets.zero,
                                              tablet: const EdgeInsets.only(
                                                left: 40,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                left: 40,
                                              ),
                                            ),
                                            child: Text('048-540484',
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    color: BlocProvider.of<
                                                            ThemeCubit>(context)
                                                        .getColor(
                                                            'Text / Primary'),
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                    fontStyle: FontStyle.normal,
                                                    decoration:
                                                        TextDecoration.none,
                                                  ),
                                                ),
                                                textAlign: TextAlign.left,
                                                textDirection:
                                                    TextDirection.ltr,
                                                maxLines: 1)),
                                      ],
                                    )),
                              ),
                              Container(
                                width: double.maxFinite,
                                height: getValueForScreenType<double?>(
                                  context: context,
                                  mobile: 60,
                                  tablet: null,
                                  desktop: null,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xFFFFFFFF).withOpacity(1),
                                  borderRadius: BorderRadius.zero,
                                ),
                                child: Padding(
                                    padding: getValueForScreenType<EdgeInsets>(
                                      context: context,
                                      mobile: const EdgeInsets.only(
                                        left: 12,
                                        right: 12,
                                      ),
                                      tablet: const EdgeInsets.only(
                                        left: 12,
                                      ),
                                      desktop: const EdgeInsets.only(
                                        left: 12,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: EdgeInsets.zero,
                                              tablet: const EdgeInsets.only(
                                                left: 8,
                                                right: 8,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                left: 8,
                                                right: 8,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile: EdgeInsets.zero,
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          getValueForScreenType<
                                                              BorderRadius>(
                                                        context: context,
                                                        mobile:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  8),
                                                          topRight:
                                                              Radius.circular(
                                                                  8),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  8),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  8),
                                                        ),
                                                        tablet:
                                                            BorderRadius.zero,
                                                        desktop:
                                                            BorderRadius.zero,
                                                      ),
                                                      child: Image.network(
                                                        'https://www.collegenp.com/uploads/2018/11/Agricultural-Development-Bank.jpg',
                                                        width:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 40,
                                                          tablet:
                                                              double.maxFinite,
                                                          desktop:
                                                              double.maxFinite,
                                                        ),
                                                        height:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 40,
                                                          tablet: 150,
                                                          desktop: 150,
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    )),
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        left: 16,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        left: 16,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            'मुक्तिनाथ बिकास बैक',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              textStyle:
                                                                  TextStyle(
                                                                color: BlocProvider.of<
                                                                            ThemeCubit>(
                                                                        context)
                                                                    .getColor(
                                                                        'Text / Primary'),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 16,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                              ),
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                            maxLines: 1),
                                                        Text('स्थान: बीच बजार',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              textStyle:
                                                                  TextStyle(
                                                                color: Color(
                                                                        0xFF000000)
                                                                    .withOpacity(
                                                                        1),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize:
                                                                    getValueForScreenType<
                                                                        double>(
                                                                  context:
                                                                      context,
                                                                  mobile: 12,
                                                                  tablet: 16,
                                                                  desktop: 16,
                                                                ),
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                              ),
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                            maxLines: 1),
                                                      ],
                                                    )),
                                              ],
                                            )),
                                        Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: EdgeInsets.zero,
                                              tablet: const EdgeInsets.only(
                                                left: 40,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                left: 40,
                                              ),
                                            ),
                                            child: Text('048-540080',
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    color: BlocProvider.of<
                                                            ThemeCubit>(context)
                                                        .getColor(
                                                            'Text / Primary'),
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                    fontStyle: FontStyle.normal,
                                                    decoration:
                                                        TextDecoration.none,
                                                  ),
                                                ),
                                                textAlign: TextAlign.left,
                                                textDirection:
                                                    TextDirection.ltr,
                                                maxLines: 1)),
                                      ],
                                    )),
                              ),
                              Container(
                                width: double.maxFinite,
                                height: getValueForScreenType<double?>(
                                  context: context,
                                  mobile: 60,
                                  tablet: null,
                                  desktop: null,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xFFDEF9FF).withOpacity(1),
                                  borderRadius: BorderRadius.zero,
                                ),
                                child: Padding(
                                    padding: getValueForScreenType<EdgeInsets>(
                                      context: context,
                                      mobile: const EdgeInsets.only(
                                        left: 12,
                                        right: 12,
                                      ),
                                      tablet: const EdgeInsets.only(
                                        left: 12,
                                      ),
                                      desktop: const EdgeInsets.only(
                                        left: 12,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: EdgeInsets.zero,
                                              tablet: const EdgeInsets.only(
                                                left: 12,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                left: 12,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile: EdgeInsets.zero,
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          getValueForScreenType<
                                                              BorderRadius>(
                                                        context: context,
                                                        mobile:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  8),
                                                          topRight:
                                                              Radius.circular(
                                                                  8),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  8),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  8),
                                                        ),
                                                        tablet:
                                                            BorderRadius.zero,
                                                        desktop:
                                                            BorderRadius.zero,
                                                      ),
                                                      child: Image.network(
                                                        'https://scontent.fktm19-1.fna.fbcdn.net/v/t39.30808-6/326268493_1320692371830079_6321474251612402144_n.png?_nc_cat=104&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=JwGPvGC_KS8AX9XBMBu&_nc_ht=scontent.fktm19-1.fna&oh=00_AfBzS-R-bidKss2H-YvPwbNgah_z2dAbwbr0DljlY9BorQ&oe=6411CB0F',
                                                        width:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 40,
                                                          tablet:
                                                              double.maxFinite,
                                                          desktop:
                                                              double.maxFinite,
                                                        ),
                                                        height:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 40,
                                                          tablet: 150,
                                                          desktop: 150,
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    )),
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        left: 16,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        left: 16,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text('प्रभु बैक',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              textStyle:
                                                                  TextStyle(
                                                                color: BlocProvider.of<
                                                                            ThemeCubit>(
                                                                        context)
                                                                    .getColor(
                                                                        'Text / Primary'),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 16,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                              ),
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                            maxLines: 1),
                                                        Text('स्थान: बीच बजार',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              textStyle:
                                                                  TextStyle(
                                                                color: Color(
                                                                        0xFF000000)
                                                                    .withOpacity(
                                                                        1),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize:
                                                                    getValueForScreenType<
                                                                        double>(
                                                                  context:
                                                                      context,
                                                                  mobile: 12,
                                                                  tablet: 16,
                                                                  desktop: 16,
                                                                ),
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                              ),
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                            maxLines: 1),
                                                      ],
                                                    )),
                                              ],
                                            )),
                                        Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: EdgeInsets.zero,
                                              tablet: const EdgeInsets.only(
                                                left: 40,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                left: 40,
                                              ),
                                            ),
                                            child: Text('048-540235',
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    color: BlocProvider.of<
                                                            ThemeCubit>(context)
                                                        .getColor(
                                                            'Text / Primary'),
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                    fontStyle: FontStyle.normal,
                                                    decoration:
                                                        TextDecoration.none,
                                                  ),
                                                ),
                                                textAlign: TextAlign.left,
                                                textDirection:
                                                    TextDirection.ltr,
                                                maxLines: 1)),
                                      ],
                                    )),
                              ),
                              Container(
                                width: double.maxFinite,
                                height: getValueForScreenType<double?>(
                                  context: context,
                                  mobile: 60,
                                  tablet: null,
                                  desktop: null,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xFFFFFFFF).withOpacity(1),
                                  borderRadius: BorderRadius.zero,
                                ),
                                child: Padding(
                                    padding: getValueForScreenType<EdgeInsets>(
                                      context: context,
                                      mobile: const EdgeInsets.only(
                                        left: 12,
                                        right: 12,
                                      ),
                                      tablet: const EdgeInsets.only(
                                        left: 12,
                                      ),
                                      desktop: const EdgeInsets.only(
                                        left: 12,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: EdgeInsets.zero,
                                              tablet: const EdgeInsets.only(
                                                left: 8,
                                                right: 8,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                left: 8,
                                                right: 8,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile: EdgeInsets.zero,
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          getValueForScreenType<
                                                              BorderRadius>(
                                                        context: context,
                                                        mobile:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  8),
                                                          topRight:
                                                              Radius.circular(
                                                                  8),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  8),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  8),
                                                        ),
                                                        tablet:
                                                            BorderRadius.zero,
                                                        desktop:
                                                            BorderRadius.zero,
                                                      ),
                                                      child: Image.network(
                                                        'https://www.collegenp.com/uploads/2018/11/Laxmi-Bank-Limited.jpg',
                                                        width:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 40,
                                                          tablet:
                                                              double.maxFinite,
                                                          desktop:
                                                              double.maxFinite,
                                                        ),
                                                        height:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 40,
                                                          tablet: 150,
                                                          desktop: 150,
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    )),
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        left: 16,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        left: 16,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text('लक्ष्मी बैक',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              textStyle:
                                                                  TextStyle(
                                                                color: BlocProvider.of<
                                                                            ThemeCubit>(
                                                                        context)
                                                                    .getColor(
                                                                        'Text / Primary'),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 16,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                              ),
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                            maxLines: 1),
                                                        Text('स्थान: बीच बजार',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              textStyle:
                                                                  TextStyle(
                                                                color: Color(
                                                                        0xFF000000)
                                                                    .withOpacity(
                                                                        1),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize:
                                                                    getValueForScreenType<
                                                                        double>(
                                                                  context:
                                                                      context,
                                                                  mobile: 12,
                                                                  tablet: 16,
                                                                  desktop: 16,
                                                                ),
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                              ),
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                            maxLines: 1),
                                                      ],
                                                    )),
                                              ],
                                            )),
                                        Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: EdgeInsets.zero,
                                              tablet: const EdgeInsets.only(
                                                left: 40,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                left: 40,
                                              ),
                                            ),
                                            child: Text('048-540604',
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    color: BlocProvider.of<
                                                            ThemeCubit>(context)
                                                        .getColor(
                                                            'Text / Primary'),
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                    fontStyle: FontStyle.normal,
                                                    decoration:
                                                        TextDecoration.none,
                                                  ),
                                                ),
                                                textAlign: TextAlign.left,
                                                textDirection:
                                                    TextDirection.ltr,
                                                maxLines: 1)),
                                      ],
                                    )),
                              ),
                              Container(
                                width: double.maxFinite,
                                height: getValueForScreenType<double?>(
                                  context: context,
                                  mobile: 60,
                                  tablet: null,
                                  desktop: null,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xFFDEF9FF).withOpacity(1),
                                  borderRadius: BorderRadius.zero,
                                ),
                                child: Padding(
                                    padding: getValueForScreenType<EdgeInsets>(
                                      context: context,
                                      mobile: const EdgeInsets.only(
                                        left: 12,
                                        right: 12,
                                      ),
                                      tablet: const EdgeInsets.only(
                                        left: 12,
                                      ),
                                      desktop: const EdgeInsets.only(
                                        left: 12,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: EdgeInsets.zero,
                                              tablet: const EdgeInsets.only(
                                                left: 12,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                left: 12,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile: EdgeInsets.zero,
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          getValueForScreenType<
                                                              BorderRadius>(
                                                        context: context,
                                                        mobile:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  8),
                                                          topRight:
                                                              Radius.circular(
                                                                  8),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  8),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  8),
                                                        ),
                                                        tablet:
                                                            BorderRadius.zero,
                                                        desktop:
                                                            BorderRadius.zero,
                                                      ),
                                                      child: Image.network(
                                                        'https://play-lh.googleusercontent.com/HPVH8G_b9MLuZ9iTGte593NuURxYll8aepZBqEDndwbiprXft5ToPqOGmIEeehWUXiQ=w600-h300-pc0xffffff-pd',
                                                        width:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 40,
                                                          tablet:
                                                              double.maxFinite,
                                                          desktop:
                                                              double.maxFinite,
                                                        ),
                                                        height:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 40,
                                                          tablet: 150,
                                                          desktop: 150,
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    )),
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        left: 16,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        left: 16,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text('ग्लोबल IME बैक',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              textStyle:
                                                                  TextStyle(
                                                                color: BlocProvider.of<
                                                                            ThemeCubit>(
                                                                        context)
                                                                    .getColor(
                                                                        'Text / Primary'),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 16,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                              ),
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                            maxLines: 1),
                                                        Text('स्थान: बीच बजार',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              textStyle:
                                                                  TextStyle(
                                                                color: Color(
                                                                        0xFF000000)
                                                                    .withOpacity(
                                                                        1),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize:
                                                                    getValueForScreenType<
                                                                        double>(
                                                                  context:
                                                                      context,
                                                                  mobile: 12,
                                                                  tablet: 16,
                                                                  desktop: 16,
                                                                ),
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                              ),
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                            maxLines: 1),
                                                      ],
                                                    )),
                                              ],
                                            )),
                                        Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: EdgeInsets.zero,
                                              tablet: const EdgeInsets.only(
                                                left: 40,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                left: 40,
                                              ),
                                            ),
                                            child: Text('048-540456',
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    color: BlocProvider.of<
                                                            ThemeCubit>(context)
                                                        .getColor(
                                                            'Text / Primary'),
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                    fontStyle: FontStyle.normal,
                                                    decoration:
                                                        TextDecoration.none,
                                                  ),
                                                ),
                                                textAlign: TextAlign.left,
                                                textDirection:
                                                    TextDirection.ltr,
                                                maxLines: 1)),
                                      ],
                                    )),
                              ),
                              Container(
                                width: double.maxFinite,
                                height: getValueForScreenType<double?>(
                                  context: context,
                                  mobile: 60,
                                  tablet: null,
                                  desktop: null,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xFFDEF9FF).withOpacity(1),
                                  borderRadius: BorderRadius.zero,
                                ),
                                child: Padding(
                                    padding: getValueForScreenType<EdgeInsets>(
                                      context: context,
                                      mobile: const EdgeInsets.only(
                                        left: 12,
                                        right: 12,
                                      ),
                                      tablet: const EdgeInsets.only(
                                        left: 12,
                                      ),
                                      desktop: const EdgeInsets.only(
                                        left: 12,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: EdgeInsets.zero,
                                              tablet: const EdgeInsets.only(
                                                left: 12,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                left: 12,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile: EdgeInsets.zero,
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          getValueForScreenType<
                                                              BorderRadius>(
                                                        context: context,
                                                        mobile:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  8),
                                                          topRight:
                                                              Radius.circular(
                                                                  8),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  8),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  8),
                                                        ),
                                                        tablet:
                                                            BorderRadius.zero,
                                                        desktop:
                                                            BorderRadius.zero,
                                                      ),
                                                      child: Image.network(
                                                        'https://mvdadmin.mvdugar.com/uploads/images/brands/5341664512332.png',
                                                        width:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 40,
                                                          tablet:
                                                              double.maxFinite,
                                                          desktop:
                                                              double.maxFinite,
                                                        ),
                                                        height:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 40,
                                                          tablet: 150,
                                                          desktop: 150,
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    )),
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        left: 16,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        left: 16,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text('सनराइज बैक',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              textStyle:
                                                                  TextStyle(
                                                                color: BlocProvider.of<
                                                                            ThemeCubit>(
                                                                        context)
                                                                    .getColor(
                                                                        'Text / Primary'),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 16,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                              ),
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                            maxLines: 1),
                                                        Text('स्थान: बीच बजार',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              textStyle:
                                                                  TextStyle(
                                                                color: Color(
                                                                        0xFF000000)
                                                                    .withOpacity(
                                                                        1),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize:
                                                                    getValueForScreenType<
                                                                        double>(
                                                                  context:
                                                                      context,
                                                                  mobile: 12,
                                                                  tablet: 16,
                                                                  desktop: 16,
                                                                ),
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                              ),
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                            maxLines: 1),
                                                      ],
                                                    )),
                                              ],
                                            )),
                                        Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: EdgeInsets.zero,
                                              tablet: const EdgeInsets.only(
                                                left: 40,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                left: 40,
                                              ),
                                            ),
                                            child: Text('048-540563',
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    color: BlocProvider.of<
                                                            ThemeCubit>(context)
                                                        .getColor(
                                                            'Text / Primary'),
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                    fontStyle: FontStyle.normal,
                                                    decoration:
                                                        TextDecoration.none,
                                                  ),
                                                ),
                                                textAlign: TextAlign.left,
                                                textDirection:
                                                    TextDirection.ltr,
                                                maxLines: 2)),
                                      ],
                                    )),
                              ),
                              Container(
                                width: double.maxFinite,
                                height: getValueForScreenType<double?>(
                                  context: context,
                                  mobile: 60,
                                  tablet: null,
                                  desktop: null,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xFFFFFFFF).withOpacity(1),
                                  borderRadius: BorderRadius.zero,
                                ),
                                child: Padding(
                                    padding: getValueForScreenType<EdgeInsets>(
                                      context: context,
                                      mobile: const EdgeInsets.only(
                                        left: 12,
                                        right: 12,
                                      ),
                                      tablet: const EdgeInsets.only(
                                        left: 12,
                                      ),
                                      desktop: const EdgeInsets.only(
                                        left: 12,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: EdgeInsets.zero,
                                              tablet: const EdgeInsets.only(
                                                left: 8,
                                                right: 8,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                left: 8,
                                                right: 8,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile: EdgeInsets.zero,
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          getValueForScreenType<
                                                              BorderRadius>(
                                                        context: context,
                                                        mobile:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  8),
                                                          topRight:
                                                              Radius.circular(
                                                                  8),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  8),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  8),
                                                        ),
                                                        tablet:
                                                            BorderRadius.zero,
                                                        desktop:
                                                            BorderRadius.zero,
                                                      ),
                                                      child: Image.network(
                                                        'https://play-lh.googleusercontent.com/_usIkSLHJprR4t1Stk01lgtTu8VwWGnDk4OvBjWrfcO80aBZYs3Hl7o64tdzK6p-gA',
                                                        width:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 40,
                                                          tablet:
                                                              double.maxFinite,
                                                          desktop:
                                                              double.maxFinite,
                                                        ),
                                                        height:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 40,
                                                          tablet: 150,
                                                          desktop: 150,
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    )),
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile:
                                                          const EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        left: 16,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        left: 16,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            'कुमारी बैक लिमिटेड',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              textStyle:
                                                                  TextStyle(
                                                                color: BlocProvider.of<
                                                                            ThemeCubit>(
                                                                        context)
                                                                    .getColor(
                                                                        'Text / Primary'),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 16,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                              ),
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                            maxLines: 1),
                                                        Text('स्थान: बीच बजार',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              textStyle:
                                                                  TextStyle(
                                                                color: Color(
                                                                        0xFF000000)
                                                                    .withOpacity(
                                                                        1),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize:
                                                                    getValueForScreenType<
                                                                        double>(
                                                                  context:
                                                                      context,
                                                                  mobile: 12,
                                                                  tablet: 16,
                                                                  desktop: 16,
                                                                ),
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                              ),
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                            maxLines: 1),
                                                      ],
                                                    )),
                                              ],
                                            )),
                                        Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: EdgeInsets.zero,
                                              tablet: const EdgeInsets.only(
                                                left: 40,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                left: 40,
                                              ),
                                            ),
                                            child: Text('048-540511',
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    color: BlocProvider.of<
                                                            ThemeCubit>(context)
                                                        .getColor(
                                                            'Text / Primary'),
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                    fontStyle: FontStyle.normal,
                                                    decoration:
                                                        TextDecoration.none,
                                                  ),
                                                ),
                                                textAlign: TextAlign.left,
                                                textDirection:
                                                    TextDirection.ltr,
                                                maxLines: 2)),
                                      ],
                                    )),
                              ),
                            ],
                          ),
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
                                      ? 'iOS Ad unit Key'
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
