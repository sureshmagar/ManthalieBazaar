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

class PageMakeNewpagecopypestA2 extends StatefulWidget {
  const PageMakeNewpagecopypestA2({
    Key? key,
  }) : super(key: key);

  @override
  _StateMakeNewpagecopypestA2 createState() => _StateMakeNewpagecopypestA2();
}

class _StateMakeNewpagecopypestA2 extends State<PageMakeNewpagecopypestA2> {
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
        'name': "MakeNewpagecopypestA2",
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
                    Color(0xFF000000).withOpacity(1)
                  ],
                  stops: [0, 1],
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
                    Stack(
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.zero,
                              child: Image.network(
                                'https://images.unsplash.com/photo-1452975536989-ec6b2d97d57c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
                                width: double.maxFinite,
                                height: getValueForScreenType<double?>(
                                  context: context,
                                  mobile: MediaQuery.of(context).size.height *
                                      100 /
                                      40,
                                  tablet: 150,
                                  desktop: 150,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: getValueForScreenType<EdgeInsets>(
                                context: context,
                                mobile: const EdgeInsets.only(
                                  left: 24,
                                ),
                                tablet: EdgeInsets.zero,
                                desktop: EdgeInsets.zero,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SafeArea(
                                    left: false,
                                    top: true,
                                    right: false,
                                    bottom: false,
                                    child: Padding(
                                      padding:
                                          getValueForScreenType<EdgeInsets>(
                                        context: context,
                                        mobile: const EdgeInsets.only(
                                          top: 24,
                                          right: 24,
                                        ),
                                        tablet: EdgeInsets.zero,
                                        desktop: EdgeInsets.zero,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          BouncingWidget(
                                            onPressed: () async {
                                              await Navigator.push<void>(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      PageMakenewpagecopypest(),
                                                ),
                                              );
                                            },
                                            duration: const Duration(
                                                milliseconds: 100),
                                            scaleFactor: 1.5,
                                            child: Icon(
                                              MdiIcons.fromString(
                                                  'keyboard-backspace'),
                                              size: 24,
                                              color: Color(0xFF000000)
                                                  .withOpacity(1),
                                            ),
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Icon(
                                                MdiIcons.fromString(
                                                    'share-variant'),
                                                size: 24,
                                                color: Color(0xFF000000)
                                                    .withOpacity(1),
                                              ),
                                              Icon(
                                                MdiIcons.fromString(
                                                    'star-outline'),
                                                size: 24,
                                                color: Color(0xFF000000)
                                                    .withOpacity(1),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: getValueForScreenType<EdgeInsets>(
                                      context: context,
                                      mobile: const EdgeInsets.only(
                                        top: 48,
                                        bottom: 4,
                                      ),
                                      tablet: EdgeInsets.zero,
                                      desktop: EdgeInsets.zero,
                                    ),
                                    child: Text('Kumura',
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            color: BlocProvider.of<ThemeCubit>(
                                                    context)
                                                .getColor('Text / Primary'),
                                            fontWeight: FontWeight.w500,
                                            fontSize:
                                                getValueForScreenType<double>(
                                              context: context,
                                              mobile: 40,
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
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        MdiIcons.fromString('crosshairs-gps'),
                                        size: getValueForScreenType<double?>(
                                          context: context,
                                          mobile: 18,
                                          tablet: 24,
                                          desktop: 24,
                                        ),
                                        color: Color(0xFF000000).withOpacity(1),
                                      ),
                                      Text('Hawai',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: BlocProvider.of<
                                                      ThemeCubit>(context)
                                                  .getColor('Text / Primary'),
                                              fontWeight: FontWeight.w500,
                                              fontSize:
                                                  getValueForScreenType<double>(
                                                context: context,
                                                mobile: 14,
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
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: getValueForScreenType<EdgeInsets>(
                            context: context,
                            mobile: const EdgeInsets.only(
                              left: 24,
                              top: 280,
                              right: 24,
                            ),
                            tablet: EdgeInsets.zero,
                            desktop: EdgeInsets.zero,
                          ),
                          child: SizedBox(
                            width: getValueForScreenType<double?>(
                              context: context,
                              mobile: 350,
                              tablet: double.maxFinite,
                              desktop: double.maxFinite,
                            ),
                            height: getValueForScreenType<double?>(
                              context: context,
                              mobile: 100,
                              tablet: 150,
                              desktop: 150,
                            ),
                            child: AnimationConfiguration.staggeredList(
                              position: 0,
                              duration: Duration(
                                milliseconds: 800,
                              ),
                              child: FadeInAnimation(
                                child: SlideAnimation(
                                  child: Card(
                                    elevation: 8,
                                    color: Color(0xFFFFFFFF).withOpacity(1),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          getValueForScreenType<BorderRadius>(
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
                                    child: Padding(
                                      padding:
                                          getValueForScreenType<EdgeInsets>(
                                        context: context,
                                        mobile: const EdgeInsets.only(
                                          left: 24,
                                          right: 24,
                                        ),
                                        tablet: EdgeInsets.zero,
                                        desktop: EdgeInsets.zero,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          AnimationConfiguration.staggeredList(
                                            position: 0,
                                            duration: Duration(
                                              milliseconds: 800,
                                            ),
                                            child: FadeInAnimation(
                                              child: Text('info',
                                                  style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                      color: Color(0xFF27FF00)
                                                          .withOpacity(1),
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize:
                                                          getValueForScreenType<
                                                              double>(
                                                        context: context,
                                                        mobile: 20,
                                                        tablet: 16,
                                                        desktop: 16,
                                                      ),
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
                                            ),
                                          ),
                                          AnimationConfiguration.staggeredList(
                                            position: 0,
                                            duration: Duration(
                                              milliseconds: 800,
                                            ),
                                            child: FadeInAnimation(
                                              child: Text('Offers',
                                                  style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                      color: Color(0xFF9C9C9C)
                                                          .withOpacity(1),
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize:
                                                          getValueForScreenType<
                                                              double>(
                                                        context: context,
                                                        mobile: 20,
                                                        tablet: 16,
                                                        desktop: 16,
                                                      ),
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
                                            ),
                                          ),
                                          AnimationConfiguration.staggeredList(
                                            position: 0,
                                            duration: Duration(
                                              milliseconds: 800,
                                            ),
                                            child: FadeInAnimation(
                                              child: Text('Reviews',
                                                  style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                      color: Color(0xFF989898)
                                                          .withOpacity(1),
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize:
                                                          getValueForScreenType<
                                                              double>(
                                                        context: context,
                                                        mobile: 20,
                                                        tablet: 16,
                                                        desktop: 16,
                                                      ),
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
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: double.maxFinite,
                      height: getValueForScreenType<double?>(
                        context: context,
                        mobile: MediaQuery.of(context).size.height * 100 / 250,
                        tablet: 150,
                        desktop: 150,
                      ),
                      child: Padding(
                        padding: getValueForScreenType<EdgeInsets>(
                          context: context,
                          mobile: const EdgeInsets.only(
                            left: 24,
                            top: 10,
                            right: 24,
                          ),
                          tablet: EdgeInsets.zero,
                          desktop: EdgeInsets.zero,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Best Hukma Work ',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: Color(0xFFFFFFFF).withOpacity(1),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    fontStyle: FontStyle.normal,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                textAlign: TextAlign.left,
                                textDirection: TextDirection.ltr,
                                maxLines: 1),
                            Padding(
                              padding: getValueForScreenType<EdgeInsets>(
                                context: context,
                                mobile: const EdgeInsets.only(
                                  top: 8,
                                ),
                                tablet: EdgeInsets.zero,
                                desktop: EdgeInsets.zero,
                              ),
                              child: Text('''Into the night take my hand baby
Don't be afraid, I know it's crazy to
Make you ready to, get you high through
All the night, all the night

Into the night take my hand baby
Don't be afraid, I know it's crazy to
Make you ready to, get you high through

All the night, all the night''',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Color(0xFFFFFFFF).withOpacity(1),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      fontStyle: FontStyle.normal,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                  textAlign: TextAlign.left,
                                  textDirection: TextDirection.ltr,
                                  maxLines: 11),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.maxFinite,
                      height: getValueForScreenType<double?>(
                        context: context,
                        mobile: MediaQuery.of(context).size.height * 100 / 200,
                        tablet: 150,
                        desktop: 150,
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
                          scrollDirection: Axis.horizontal,
                          children: [
                            AnimationConfiguration.staggeredList(
                              position: 1,
                              duration: Duration(
                                milliseconds: 800,
                              ),
                              child: FadeInAnimation(
                                child: Padding(
                                  padding: getValueForScreenType<EdgeInsets>(
                                    context: context,
                                    mobile: const EdgeInsets.only(
                                      left: 24,
                                    ),
                                    tablet: EdgeInsets.zero,
                                    desktop: EdgeInsets.zero,
                                  ),
                                  child: ClipRRect(
                                    borderRadius:
                                        getValueForScreenType<BorderRadius>(
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
                                    child: Image.network(
                                      'https://images.unsplash.com/photo-1612333112094-f7cd05ddca73?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80',
                                      width: getValueForScreenType<double?>(
                                        context: context,
                                        mobile: 150,
                                        tablet: double.maxFinite,
                                        desktop: double.maxFinite,
                                      ),
                                      height: getValueForScreenType<double?>(
                                        context: context,
                                        mobile: 250,
                                        tablet: 150,
                                        desktop: 150,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            AnimationConfiguration.staggeredList(
                              position: 2,
                              duration: Duration(
                                milliseconds: 800,
                              ),
                              child: FadeInAnimation(
                                child: Padding(
                                  padding: getValueForScreenType<EdgeInsets>(
                                    context: context,
                                    mobile: const EdgeInsets.only(
                                      left: 24,
                                    ),
                                    tablet: EdgeInsets.zero,
                                    desktop: EdgeInsets.zero,
                                  ),
                                  child: ClipRRect(
                                    borderRadius:
                                        getValueForScreenType<BorderRadius>(
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
                                    child: Image.network(
                                      'https://images.unsplash.com/photo-1641985847912-a40a60ab1d59?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
                                      width: getValueForScreenType<double?>(
                                        context: context,
                                        mobile: 150,
                                        tablet: double.maxFinite,
                                        desktop: double.maxFinite,
                                      ),
                                      height: getValueForScreenType<double?>(
                                        context: context,
                                        mobile: 250,
                                        tablet: 150,
                                        desktop: 150,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            AnimationConfiguration.staggeredList(
                              position: 0,
                              duration: Duration(
                                milliseconds: 375,
                              ),
                              child: FadeInAnimation(
                                child: Padding(
                                  padding: getValueForScreenType<EdgeInsets>(
                                    context: context,
                                    mobile: const EdgeInsets.only(
                                      left: 24,
                                    ),
                                    tablet: EdgeInsets.zero,
                                    desktop: EdgeInsets.zero,
                                  ),
                                  child: ClipRRect(
                                    borderRadius:
                                        getValueForScreenType<BorderRadius>(
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
                                    child: Image.network(
                                      'https://images.unsplash.com/photo-1641956183394-5fa30cfcc695?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
                                      width: getValueForScreenType<double?>(
                                        context: context,
                                        mobile: 150,
                                        tablet: double.maxFinite,
                                        desktop: double.maxFinite,
                                      ),
                                      height: getValueForScreenType<double?>(
                                        context: context,
                                        mobile: 250,
                                        tablet: 150,
                                        desktop: 150,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            AnimationConfiguration.staggeredList(
                              position: 0,
                              duration: Duration(
                                milliseconds: 375,
                              ),
                              child: FadeInAnimation(
                                child: Padding(
                                  padding: getValueForScreenType<EdgeInsets>(
                                    context: context,
                                    mobile: const EdgeInsets.only(
                                      left: 24,
                                    ),
                                    tablet: EdgeInsets.zero,
                                    desktop: EdgeInsets.zero,
                                  ),
                                  child: ClipRRect(
                                    borderRadius:
                                        getValueForScreenType<BorderRadius>(
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
                                    child: Image.network(
                                      'https://images.unsplash.com/photo-1641985848004-a61533e174c4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
                                      width: getValueForScreenType<double?>(
                                        context: context,
                                        mobile: 150,
                                        tablet: double.maxFinite,
                                        desktop: double.maxFinite,
                                      ),
                                      height: getValueForScreenType<double?>(
                                        context: context,
                                        mobile: 250,
                                        tablet: 150,
                                        desktop: 150,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            AnimationConfiguration.staggeredList(
                              position: 0,
                              duration: Duration(
                                milliseconds: 375,
                              ),
                              child: FadeInAnimation(
                                child: Padding(
                                  padding: getValueForScreenType<EdgeInsets>(
                                    context: context,
                                    mobile: const EdgeInsets.only(
                                      left: 24,
                                    ),
                                    tablet: EdgeInsets.zero,
                                    desktop: EdgeInsets.zero,
                                  ),
                                  child: ClipRRect(
                                    borderRadius:
                                        getValueForScreenType<BorderRadius>(
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
                                    child: Image.network(
                                      'https://images.unsplash.com/photo-1641956183394-5fa30cfcc695?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
                                      width: getValueForScreenType<double?>(
                                        context: context,
                                        mobile: 150,
                                        tablet: double.maxFinite,
                                        desktop: double.maxFinite,
                                      ),
                                      height: getValueForScreenType<double?>(
                                        context: context,
                                        mobile: 250,
                                        tablet: 150,
                                        desktop: 150,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.maxFinite,
                      height: getValueForScreenType<double?>(
                        context: context,
                        mobile: 50,
                        tablet: 150,
                        desktop: 150,
                      ),
                      child: const SizedBox(),
                    ),
                  ],
                ),
              ),
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
                          MdiIcons.fromString('camera-image'),
                          size: 24,
                          color: Color(0xFF000000).withOpacity(1),
                        ),
                        Icon(
                          MdiIcons.fromString('video'),
                          size: 24,
                          color: Color(0xFF000000).withOpacity(1),
                        ),
                        Icon(
                          MdiIcons.fromString('home'),
                          size: getValueForScreenType<double?>(
                            context: context,
                            mobile: 30,
                            tablet: 24,
                            desktop: 24,
                          ),
                          color: Color(0xFF000000).withOpacity(1),
                        ),
                        Icon(
                          MdiIcons.fromString('cards-heart-outline'),
                          size: 24,
                          color: Color(0xFF000000).withOpacity(1),
                        ),
                        Icon(
                          MdiIcons.fromString('account-circle'),
                          size: 24,
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
