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

class PageHospital extends StatefulWidget {
  const PageHospital({
    Key? key,
  }) : super(key: key);

  @override
  _StateHospital createState() => _StateHospital();
}

class _StateHospital extends State<PageHospital> {
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
        'name': "Hospital",
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
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.zero,
                  child: Image.network(
                    'https://images.unsplash.com/photo-1650646002407-f8b4537c1cce?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80',
                    width: double.maxFinite,
                    height: getValueForScreenType<double?>(
                      context: context,
                      mobile: double.maxFinite,
                      tablet: 150,
                      desktop: 150,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                NotificationListener<ScrollEndNotification>(
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
                      SizedBox(
                        width: double.maxFinite,
                        height: getValueForScreenType<double?>(
                          context: context,
                          mobile: 120,
                          tablet: 150,
                          desktop: 150,
                        ),
                        child: SafeArea(
                          left: false,
                          top: true,
                          right: false,
                          bottom: false,
                          child: Padding(
                            padding: getValueForScreenType<EdgeInsets>(
                              context: context,
                              mobile: const EdgeInsets.only(
                                left: 24,
                                top: 18,
                              ),
                              tablet: EdgeInsets.zero,
                              desktop: EdgeInsets.zero,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                    child: Icon(
                                      MdiIcons.fromString('arrow-left'),
                                      size: getValueForScreenType<double?>(
                                        context: context,
                                        mobile: 32,
                                        tablet: 24,
                                        desktop: 24,
                                      ),
                                      color: Color(0xFFFFFFFF).withOpacity(1),
                                    )),
                                Padding(
                                    padding: const EdgeInsets.only(
                                      left: 18,
                                    ),
                                    child: Text('अस्पताल',
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            color: Color(0xFFFFFFFF)
                                                .withOpacity(1),
                                            fontWeight: FontWeight.w400,
                                            fontSize:
                                                getValueForScreenType<double>(
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
                      Padding(
                          padding: getValueForScreenType<EdgeInsets>(
                            context: context,
                            mobile: EdgeInsets.zero,
                            tablet: const EdgeInsets.only(
                              top: 10,
                            ),
                            desktop: const EdgeInsets.only(
                              top: 10,
                            ),
                          ),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius:
                                    getValueForScreenType<BorderRadius>(
                                  context: context,
                                  mobile: BorderRadius.only(
                                    topLeft: Radius.circular(24),
                                    topRight: Radius.circular(24),
                                    bottomRight: Radius.circular(0),
                                    bottomLeft: Radius.circular(0),
                                  ),
                                  tablet: BorderRadius.zero,
                                  desktop: BorderRadius.zero,
                                ),
                                child: Image.network(
                                  'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEg000PcK1509NotvQ0XRYwvBISj8i145dRcP8PsL5FLSlBJD3CEMT3rGOdlYeGJibk_fXfHZ88SuyFyeMdDjoAT9ELBiacYcGce0CMTatTeE_7KB2BhCxzPBTjC4VCEytHKLI9lbKeUPiV9BQ40EsmpNLMypBsyedAQyZ_gDna5DwpkRM5MlJmfEjePOw/w640-h360/Dil%20Shree%20Medical%20Hal.png',
                                  width: double.maxFinite,
                                  height: getValueForScreenType<double?>(
                                    context: context,
                                    mobile: 250,
                                    tablet: 150,
                                    desktop: 150,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              AnimationConfiguration.staggeredList(
                                position: index,
                                child: SlideAnimation(
                                    child: Container(
                                  margin: getValueForScreenType<EdgeInsets>(
                                    context: context,
                                    mobile: const EdgeInsets.only(
                                      top: 220,
                                    ),
                                    tablet: EdgeInsets.zero,
                                    desktop: EdgeInsets.zero,
                                  ),
                                  width: double.maxFinite,
                                  height: getValueForScreenType<double?>(
                                    context: context,
                                    mobile: 180,
                                    tablet: null,
                                    desktop: null,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFFFFFF).withOpacity(1),
                                    borderRadius:
                                        getValueForScreenType<BorderRadius>(
                                      context: context,
                                      mobile: BorderRadius.only(
                                        topLeft: Radius.circular(24),
                                        topRight: Radius.circular(24),
                                        bottomRight: Radius.circular(24),
                                        bottomLeft: Radius.circular(24),
                                      ),
                                      tablet: BorderRadius.zero,
                                      desktop: BorderRadius.zero,
                                    ),
                                  ),
                                  child: SizedBox(
                                    width: double.maxFinite,
                                    height: 150,
                                    child: Column(
                                      children: [
                                        Padding(
                                            padding: const EdgeInsets.only(
                                              top: 15,
                                            ),
                                            child: Text('दिलश्री मेडिकल हल',
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    color: BlocProvider.of<
                                                            ThemeCubit>(context)
                                                        .getColor(
                                                            'Text / Primary'),
                                                    fontWeight: FontWeight.w400,
                                                    fontSize:
                                                        getValueForScreenType<
                                                            double>(
                                                      context: context,
                                                      mobile: 22,
                                                      tablet: 16,
                                                      desktop: 16,
                                                    ),
                                                    fontStyle: FontStyle.normal,
                                                    decoration:
                                                        TextDecoration.none,
                                                  ),
                                                ),
                                                textAlign: TextAlign.left,
                                                textDirection:
                                                    TextDirection.ltr,
                                                maxLines: 1)),
                                        Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: const EdgeInsets.only(
                                                left: 24,
                                                right: 24,
                                              ),
                                              tablet: const EdgeInsets.only(
                                                left: 18,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                left: 18,
                                              ),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile:
                                                          const EdgeInsets.only(
                                                        top: 6,
                                                        bottom: 6,
                                                      ),
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        bottom: 10,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        bottom: 10,
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                            'प्रो. मोहन श्रेष्ठ',
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
                                                            maxLines: 1),
                                                        Text('''''',
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
                                                            maxLines: 1),
                                                      ],
                                                    )),
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile: EdgeInsets.zero,
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        left: 24,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        left: 24,
                                                      ),
                                                    ),
                                                    child: SizedBox(
                                                      width:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: null,
                                                        tablet:
                                                            double.maxFinite,
                                                        desktop:
                                                            double.maxFinite,
                                                      ),
                                                      height:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: 1,
                                                        tablet: 150,
                                                        desktop: 150,
                                                      ),
                                                      child: Divider(
                                                        height: 1,
                                                        color: Color(0xFF000000)
                                                            .withOpacity(1),
                                                      ),
                                                    )),
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile:
                                                          const EdgeInsets.only(
                                                        top: 6,
                                                        bottom: 6,
                                                      ),
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        bottom: 10,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        bottom: 10,
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text('स्थान:',
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
                                                            maxLines: 1),
                                                        Text(
                                                            'देवकोटा चोक, मन्थली',
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
                                                            maxLines: 1),
                                                      ],
                                                    )),
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile: EdgeInsets.zero,
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        left: 24,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        left: 24,
                                                      ),
                                                    ),
                                                    child: SizedBox(
                                                      width:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: null,
                                                        tablet:
                                                            double.maxFinite,
                                                        desktop:
                                                            double.maxFinite,
                                                      ),
                                                      height:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: 1,
                                                        tablet: 150,
                                                        desktop: 150,
                                                      ),
                                                      child: Divider(
                                                        height: 1,
                                                        color: Color(0xFF000000)
                                                            .withOpacity(1),
                                                      ),
                                                    )),
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile:
                                                          const EdgeInsets.only(
                                                        top: 6,
                                                        bottom: 6,
                                                      ),
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        bottom: 10,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        bottom: 10,
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text('सम्पर्क:',
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
                                                            maxLines: 1),
                                                        Text('048-540305',
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
                                                            maxLines: 1),
                                                      ],
                                                    )),
                                              ],
                                            )),
                                        const SizedBox(),
                                      ],
                                    ),
                                  ),
                                )),
                              ),
                            ],
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                            top: 15,
                          ),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius:
                                    getValueForScreenType<BorderRadius>(
                                  context: context,
                                  mobile: BorderRadius.only(
                                    topLeft: Radius.circular(24),
                                    topRight: Radius.circular(24),
                                    bottomRight: Radius.circular(0),
                                    bottomLeft: Radius.circular(0),
                                  ),
                                  tablet: BorderRadius.zero,
                                  desktop: BorderRadius.zero,
                                ),
                                child: Image.network(
                                  'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhefzZlEcHaZYfjFqGLy4RAHZDHoaNfyxbg8vp6pwSzKWDwyxy6CMMDYYewSpsZIt5DzdZSWBKYctfWFjdqSqsE8idRjou2r5dOgVgf-Uch7Ir7Mk92rM2rRviEYM87Cex-zSzq5pKo8xzBDjyt1Xs54rdMy9XGj-W9QkmBEaZzivaDkr2anOIHZpOH4Q/w640-h360/ramechhap%20Hospotlsd.png',
                                  width: double.maxFinite,
                                  height: getValueForScreenType<double?>(
                                    context: context,
                                    mobile: 250,
                                    tablet: 150,
                                    desktop: 150,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              AnimationConfiguration.staggeredList(
                                position: index,
                                child: SlideAnimation(
                                    child: Container(
                                  margin: getValueForScreenType<EdgeInsets>(
                                    context: context,
                                    mobile: const EdgeInsets.only(
                                      top: 220,
                                    ),
                                    tablet: EdgeInsets.zero,
                                    desktop: EdgeInsets.zero,
                                  ),
                                  width: double.maxFinite,
                                  height: getValueForScreenType<double?>(
                                    context: context,
                                    mobile: 180,
                                    tablet: null,
                                    desktop: null,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFFFFFF).withOpacity(1),
                                    borderRadius:
                                        getValueForScreenType<BorderRadius>(
                                      context: context,
                                      mobile: BorderRadius.only(
                                        topLeft: Radius.circular(24),
                                        topRight: Radius.circular(24),
                                        bottomRight: Radius.circular(24),
                                        bottomLeft: Radius.circular(24),
                                      ),
                                      tablet: BorderRadius.zero,
                                      desktop: BorderRadius.zero,
                                    ),
                                  ),
                                  child: SizedBox(
                                    width: double.maxFinite,
                                    height: 150,
                                    child: Column(
                                      children: [
                                        Padding(
                                            padding: const EdgeInsets.only(
                                              top: 15,
                                            ),
                                            child: Text(
                                                'रामेछाप सामुदायिक अस्पताल प्रा.लि.',
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    color: BlocProvider.of<
                                                            ThemeCubit>(context)
                                                        .getColor(
                                                            'Text / Primary'),
                                                    fontWeight: FontWeight.w400,
                                                    fontSize:
                                                        getValueForScreenType<
                                                            double>(
                                                      context: context,
                                                      mobile: 22,
                                                      tablet: 16,
                                                      desktop: 16,
                                                    ),
                                                    fontStyle: FontStyle.normal,
                                                    decoration:
                                                        TextDecoration.none,
                                                  ),
                                                ),
                                                textAlign: TextAlign.left,
                                                textDirection:
                                                    TextDirection.ltr,
                                                maxLines: 1)),
                                        Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: const EdgeInsets.only(
                                                left: 24,
                                                right: 24,
                                              ),
                                              tablet: const EdgeInsets.only(
                                                left: 18,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                left: 18,
                                              ),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile:
                                                          const EdgeInsets.only(
                                                        top: 6,
                                                        bottom: 6,
                                                      ),
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        bottom: 10,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        bottom: 10,
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                            'प्रो. नारायण दास श्रेष्ठ',
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
                                                            maxLines: 1),
                                                        Text('''''',
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
                                                            maxLines: 1),
                                                      ],
                                                    )),
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile: EdgeInsets.zero,
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        left: 24,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        left: 24,
                                                      ),
                                                    ),
                                                    child: SizedBox(
                                                      width:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: null,
                                                        tablet:
                                                            double.maxFinite,
                                                        desktop:
                                                            double.maxFinite,
                                                      ),
                                                      height:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: 1,
                                                        tablet: 150,
                                                        desktop: 150,
                                                      ),
                                                      child: Divider(
                                                        height: 1,
                                                        color: Color(0xFF000000)
                                                            .withOpacity(1),
                                                      ),
                                                    )),
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile:
                                                          const EdgeInsets.only(
                                                        top: 6,
                                                        bottom: 6,
                                                      ),
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        bottom: 10,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        bottom: 10,
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text('स्थान:',
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
                                                            maxLines: 1),
                                                        Text(
                                                            'देवकोटा चोक, मन्थली',
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
                                                            maxLines: 1),
                                                      ],
                                                    )),
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile: EdgeInsets.zero,
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        left: 24,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        left: 24,
                                                      ),
                                                    ),
                                                    child: SizedBox(
                                                      width:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: null,
                                                        tablet:
                                                            double.maxFinite,
                                                        desktop:
                                                            double.maxFinite,
                                                      ),
                                                      height:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: 1,
                                                        tablet: 150,
                                                        desktop: 150,
                                                      ),
                                                      child: Divider(
                                                        height: 1,
                                                        color: Color(0xFF000000)
                                                            .withOpacity(1),
                                                      ),
                                                    )),
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile:
                                                          const EdgeInsets.only(
                                                        top: 6,
                                                        bottom: 6,
                                                      ),
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        bottom: 10,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        bottom: 10,
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text('सम्पर्क:',
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
                                                            maxLines: 1),
                                                        Text('048-540476',
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
                                                            maxLines: 1),
                                                      ],
                                                    )),
                                              ],
                                            )),
                                        const SizedBox(),
                                      ],
                                    ),
                                  ),
                                )),
                              ),
                            ],
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                            top: 15,
                          ),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius:
                                    getValueForScreenType<BorderRadius>(
                                  context: context,
                                  mobile: BorderRadius.only(
                                    topLeft: Radius.circular(24),
                                    topRight: Radius.circular(24),
                                    bottomRight: Radius.circular(0),
                                    bottomLeft: Radius.circular(0),
                                  ),
                                  tablet: BorderRadius.zero,
                                  desktop: BorderRadius.zero,
                                ),
                                child: Image.network(
                                  'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEg000PcK1509NotvQ0XRYwvBISj8i145dRcP8PsL5FLSlBJD3CEMT3rGOdlYeGJibk_fXfHZ88SuyFyeMdDjoAT9ELBiacYcGce0CMTatTeE_7KB2BhCxzPBTjC4VCEytHKLI9lbKeUPiV9BQ40EsmpNLMypBsyedAQyZ_gDna5DwpkRM5MlJmfEjePOw/w640-h360/Dil%20Shree%20Medical%20Hal.png',
                                  width: double.maxFinite,
                                  height: getValueForScreenType<double?>(
                                    context: context,
                                    mobile: 250,
                                    tablet: 150,
                                    desktop: 150,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              AnimationConfiguration.staggeredList(
                                position: index,
                                child: SlideAnimation(
                                    child: Container(
                                  margin: getValueForScreenType<EdgeInsets>(
                                    context: context,
                                    mobile: const EdgeInsets.only(
                                      top: 220,
                                    ),
                                    tablet: EdgeInsets.zero,
                                    desktop: EdgeInsets.zero,
                                  ),
                                  width: double.maxFinite,
                                  height: getValueForScreenType<double?>(
                                    context: context,
                                    mobile: 180,
                                    tablet: null,
                                    desktop: null,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFFFFFF).withOpacity(1),
                                    borderRadius:
                                        getValueForScreenType<BorderRadius>(
                                      context: context,
                                      mobile: BorderRadius.only(
                                        topLeft: Radius.circular(24),
                                        topRight: Radius.circular(24),
                                        bottomRight: Radius.circular(24),
                                        bottomLeft: Radius.circular(24),
                                      ),
                                      tablet: BorderRadius.zero,
                                      desktop: BorderRadius.zero,
                                    ),
                                  ),
                                  child: SizedBox(
                                    width: double.maxFinite,
                                    height: 150,
                                    child: Column(
                                      children: [
                                        Padding(
                                            padding: const EdgeInsets.only(
                                              top: 15,
                                            ),
                                            child: Text('साकुरा मेडिकल हल',
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    color: BlocProvider.of<
                                                            ThemeCubit>(context)
                                                        .getColor(
                                                            'Text / Primary'),
                                                    fontWeight: FontWeight.w400,
                                                    fontSize:
                                                        getValueForScreenType<
                                                            double>(
                                                      context: context,
                                                      mobile: 22,
                                                      tablet: 16,
                                                      desktop: 16,
                                                    ),
                                                    fontStyle: FontStyle.normal,
                                                    decoration:
                                                        TextDecoration.none,
                                                  ),
                                                ),
                                                textAlign: TextAlign.left,
                                                textDirection:
                                                    TextDirection.ltr,
                                                maxLines: 1)),
                                        Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: const EdgeInsets.only(
                                                left: 24,
                                                right: 24,
                                              ),
                                              tablet: const EdgeInsets.only(
                                                left: 18,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                left: 18,
                                              ),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile:
                                                          const EdgeInsets.only(
                                                        top: 6,
                                                        bottom: 6,
                                                      ),
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        bottom: 10,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        bottom: 10,
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text('प्रो. मन्थली ',
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
                                                            maxLines: 1),
                                                        Text('''''',
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
                                                            maxLines: 1),
                                                      ],
                                                    )),
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile: EdgeInsets.zero,
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        left: 24,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        left: 24,
                                                      ),
                                                    ),
                                                    child: SizedBox(
                                                      width:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: null,
                                                        tablet:
                                                            double.maxFinite,
                                                        desktop:
                                                            double.maxFinite,
                                                      ),
                                                      height:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: 1,
                                                        tablet: 150,
                                                        desktop: 150,
                                                      ),
                                                      child: Divider(
                                                        height: 1,
                                                        color: Color(0xFF000000)
                                                            .withOpacity(1),
                                                      ),
                                                    )),
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile:
                                                          const EdgeInsets.only(
                                                        top: 6,
                                                        bottom: 6,
                                                      ),
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        bottom: 10,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        bottom: 10,
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text('स्थान:',
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
                                                            maxLines: 1),
                                                        Text('बीच बजार, मन्थली',
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
                                                            maxLines: 1),
                                                      ],
                                                    )),
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile: EdgeInsets.zero,
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        left: 24,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        left: 24,
                                                      ),
                                                    ),
                                                    child: SizedBox(
                                                      width:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: null,
                                                        tablet:
                                                            double.maxFinite,
                                                        desktop:
                                                            double.maxFinite,
                                                      ),
                                                      height:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: 1,
                                                        tablet: 150,
                                                        desktop: 150,
                                                      ),
                                                      child: Divider(
                                                        height: 1,
                                                        color: Color(0xFF000000)
                                                            .withOpacity(1),
                                                      ),
                                                    )),
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile:
                                                          const EdgeInsets.only(
                                                        top: 6,
                                                        bottom: 6,
                                                      ),
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        bottom: 10,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        bottom: 10,
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text('सम्पर्क:',
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
                                                            maxLines: 1),
                                                        Text('''048-540313
9851058583''',
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
                                                            maxLines: 2),
                                                      ],
                                                    )),
                                              ],
                                            )),
                                        const SizedBox(),
                                      ],
                                    ),
                                  ),
                                )),
                              ),
                            ],
                          )),
                      Container(
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: Color(0xFF000000).withOpacity(1),
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
                                      : 'ca-app-pub-9033730368965591/9876436500',
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
