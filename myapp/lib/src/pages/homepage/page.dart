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

class PageHomePage extends StatefulWidget {
  const PageHomePage({
    Key? key,
  }) : super(key: key);

  @override
  _StateHomePage createState() => _StateHomePage();
}

class _StateHomePage extends State<PageHomePage> {
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
        'name': "HomePage",
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
            color: Color(0xFF1C83F6).withOpacity(1),
            borderRadius: getValueForScreenType<BorderRadius>(
              context: context,
              mobile: BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(0),
                bottomRight: Radius.circular(18),
                bottomLeft: Radius.circular(18),
              ),
              tablet: BorderRadius.zero,
              desktop: BorderRadius.zero,
            ),
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
                    width: 1, color: Color(0xFFFFFFFF).withOpacity(1)),
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
            child: Padding(
                padding: getValueForScreenType<EdgeInsets>(
                  context: context,
                  mobile: const EdgeInsets.only(
                    left: 16,
                    right: 16,
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
                        child: Padding(
                            padding: getValueForScreenType<EdgeInsets>(
                              context: context,
                              mobile: EdgeInsets.zero,
                              tablet: const EdgeInsets.only(
                                left: 2,
                                top: 2,
                                right: 2,
                                bottom: 2,
                              ),
                              desktop: const EdgeInsets.only(
                                left: 2,
                                top: 2,
                                right: 2,
                                bottom: 2,
                              ),
                            ),
                            child: Icon(
                              MdiIcons.fromString('menu'),
                              size: getValueForScreenType<double?>(
                                context: context,
                                mobile: 32,
                                tablet: 24,
                                desktop: 24,
                              ),
                              color: Color(0xFFFFFFFF).withOpacity(1),
                            ))),
                    Padding(
                        padding: getValueForScreenType<EdgeInsets>(
                          context: context,
                          mobile: EdgeInsets.zero,
                          tablet: const EdgeInsets.only(
                            left: 2,
                          ),
                          desktop: const EdgeInsets.only(
                            left: 2,
                          ),
                        ),
                        child: Text('मन्थली बजार',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: BlocProvider.of<ThemeCubit>(context)
                                    .getColor('Background / Primary'),
                                fontWeight: FontWeight.w600,
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
                    Padding(
                        padding: getValueForScreenType<EdgeInsets>(
                          context: context,
                          mobile: EdgeInsets.zero,
                          tablet: const EdgeInsets.only(
                            left: 15,
                          ),
                          desktop: const EdgeInsets.only(
                            left: 15,
                          ),
                        ),
                        child: GestureDetector(
                            onTap: () async {
                              BlocProvider.of<ThemeCubit>(context).changeVal();
                            },
                            child: Icon(
                              MdiIcons.fromString('brightness6'),
                              size: getValueForScreenType<double?>(
                                context: context,
                                mobile: 32,
                                tablet: 24,
                                desktop: 24,
                              ),
                              color: Color(0xFFFFFFFF).withOpacity(1),
                            ))),
                  ],
                )),
          ),
        ),
      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.maxFinite,
              height: getValueForScreenType<double?>(
                context: context,
                mobile: MediaQuery.of(context).size.height * 100 / 210,
                tablet: MediaQuery.of(context).size.height * 100 / 25,
                desktop: MediaQuery.of(context).size.height * 100 / 25,
              ),
              decoration: BoxDecoration(
                color: Color(0xFF000000).withOpacity(1),
                borderRadius: BorderRadius.zero,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.zero,
                child: Image.network(
                  'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjRkqt-JUj6jViDx7q8DrQUb3CRozR9GU749R36aV4tcoqUnCQwG_oULYXP52n0KP0n4zrx583FAHjsh15TMLLZ-yUycmIFdo9Blk8A7RCtKdi-iKdICF9HXwC-dt1qKAc-4cR7f95zMaN72I05-H7ZYxLsNo-TK2B920xuml5jm8epEzmthW6Ud5A9YA/w640-h400/Side%20Bar%20Pic.jpg',
                  width: double.maxFinite,
                  height: getValueForScreenType<double?>(
                    context: context,
                    mobile: MediaQuery.of(context).size.height * 100 / 210,
                    tablet: MediaQuery.of(context).size.height * 100 / 25,
                    desktop: MediaQuery.of(context).size.height * 100 / 25,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF).withOpacity(1),
                borderRadius: BorderRadius.zero,
              ),
              child: SafeArea(
                left: false,
                top: false,
                right: false,
                bottom: true,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 24,
                    top: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 10,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              MdiIcons.fromString('home'),
                              size: 30,
                              color: Color(0xFF000000).withOpacity(1),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 15,
                              ),
                              child: Text('Home',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Color(0xFF000000).withOpacity(1),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      fontStyle: FontStyle.normal,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                  textAlign: TextAlign.left,
                                  textDirection: TextDirection.ltr,
                                  maxLines: 1),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 10,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              MdiIcons.fromString('human-greeting-variant'),
                              size: 30,
                              color: Color(0xFF000000).withOpacity(1),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 15,
                              ),
                              child: Text('About us',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Color(0xFF000000).withOpacity(1),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      fontStyle: FontStyle.normal,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                  textAlign: TextAlign.left,
                                  textDirection: TextDirection.ltr,
                                  maxLines: 1),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 10,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              MdiIcons.fromString('share-variant'),
                              size: 30,
                              color: Color(0xFF000000).withOpacity(1),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 15,
                              ),
                              child: Text('Share',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Color(0xFF000000).withOpacity(1),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      fontStyle: FontStyle.normal,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                  textAlign: TextAlign.left,
                                  textDirection: TextDirection.ltr,
                                  maxLines: 1),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 10,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              MdiIcons.fromString('facebook'),
                              size: 30,
                              color: Color(0xFF000000).withOpacity(1),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 15,
                              ),
                              child: Text('Facebook',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Color(0xFF000000).withOpacity(1),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      fontStyle: FontStyle.normal,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                  textAlign: TextAlign.left,
                                  textDirection: TextDirection.ltr,
                                  maxLines: 1),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 10,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              MdiIcons.fromString('share-variant'),
                              size: 30,
                              color: Color(0xFF000000).withOpacity(1),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 15,
                              ),
                              child: Text('Ramechhap',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Color(0xFF000000).withOpacity(1),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      fontStyle: FontStyle.normal,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                  textAlign: TextAlign.left,
                                  textDirection: TextDirection.ltr,
                                  maxLines: 1),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 10,
                        ),
                        child: GestureDetector(
                          onTap: () async {
                            if (await canLaunchUrlString(
                                'https://play.google.com/store/apps/details?id=com.manthalibazaar')) {
                              await launchUrlString(
                                'https://play.google.com/store/apps/details?id=com.manthalibazaar',
                                mode: LaunchMode.inAppWebView,
                              );
                            }
                          },
                          child: Row(
                            children: [
                              Icon(
                                MdiIcons.fromString('update'),
                                size: 30,
                                color: Color(0xFF000000).withOpacity(1),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 15,
                                ),
                                child: Text('Update',
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: Color(0xFF000000).withOpacity(1),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        fontStyle: FontStyle.normal,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                    textAlign: TextAlign.left,
                                    textDirection: TextDirection.ltr,
                                    maxLines: 1),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 10,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              MdiIcons.fromString('police-badge-outline'),
                              size: 30,
                              color: Color(0xFF000000).withOpacity(1),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 15,
                              ),
                              child: Text('Privacy Policy',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Color(0xFF000000).withOpacity(1),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      fontStyle: FontStyle.normal,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                  textAlign: TextAlign.left,
                                  textDirection: TextDirection.ltr,
                                  maxLines: 1),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 10,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              MdiIcons.fromString('exit-to-app'),
                              size: 30,
                              color: Color(0xFF000000).withOpacity(1),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 15,
                              ),
                              child: Text('Exit',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Color(0xFF000000).withOpacity(1),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      fontStyle: FontStyle.normal,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                  textAlign: TextAlign.left,
                                  textDirection: TextDirection.ltr,
                                  maxLines: 1),
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
      backgroundColor: const Color(0xFF000000),
      body: IntrinsicHeight(
        child: Stack(
          children: [
            Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                color: Color(0xFF1C83F6).withOpacity(1),
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
                      padding: getValueForScreenType<EdgeInsets>(
                        context: context,
                        mobile: const EdgeInsets.only(
                          top: 15,
                        ),
                        tablet: EdgeInsets.zero,
                        desktop: EdgeInsets.zero,
                      ),
                      width: getValueForScreenType<double?>(
                        context: context,
                        mobile: 370,
                        tablet: double.maxFinite,
                        desktop: double.maxFinite,
                      ),
                      height: getValueForScreenType<double?>(
                        context: context,
                        mobile: 220,
                        tablet: null,
                        desktop: null,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.zero,
                      ),
                      child: SizedBox(
                        width: getValueForScreenType<double?>(
                          context: context,
                          mobile: 370,
                          tablet: double.maxFinite,
                          desktop: double.maxFinite,
                        ),
                        height: getValueForScreenType<double?>(
                          context: context,
                          mobile: 220,
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
                              Container(
                                padding: getValueForScreenType<EdgeInsets>(
                                  context: context,
                                  mobile: const EdgeInsets.only(
                                    left: 6,
                                  ),
                                  tablet: EdgeInsets.zero,
                                  desktop: EdgeInsets.zero,
                                ),
                                width: getValueForScreenType<double?>(
                                  context: context,
                                  mobile: 370,
                                  tablet: double.maxFinite,
                                  desktop: double.maxFinite,
                                ),
                                height: getValueForScreenType<double?>(
                                  context: context,
                                  mobile: 220,
                                  tablet: null,
                                  desktop: null,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      getValueForScreenType<BorderRadius>(
                                    context: context,
                                    mobile: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                      bottomLeft: Radius.circular(20),
                                    ),
                                    tablet: BorderRadius.zero,
                                    desktop: BorderRadius.zero,
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius:
                                      getValueForScreenType<BorderRadius>(
                                    context: context,
                                    mobile: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                      bottomLeft: Radius.circular(20),
                                    ),
                                    tablet: BorderRadius.zero,
                                    desktop: BorderRadius.zero,
                                  ),
                                  child: Image.network(
                                    'https://blogger.googleusercontent.com/img/a/AVvXsEhNTWtTNn5kUSJCeUy7U_E9V8T9tZ8oD__UfdOV2zE12HZHrT0RjuRZOwlBxPY2LXgBICh4K4nNX5huUNCdNKkBgEPDo29V_wK2prZ9hmj1oNMAfM37FvR4NFip_4Z2vjmtcx-WkHJdiXaqC84xF0eTMwWHr5rni6bWf8544o-kxyospEjjwcNs9nw4dw=w640-h360',
                                    width: getValueForScreenType<double?>(
                                      context: context,
                                      mobile: 370,
                                      tablet: double.maxFinite,
                                      desktop: double.maxFinite,
                                    ),
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
                              Container(
                                padding: getValueForScreenType<EdgeInsets>(
                                  context: context,
                                  mobile: const EdgeInsets.only(
                                    left: 6,
                                  ),
                                  tablet: EdgeInsets.zero,
                                  desktop: EdgeInsets.zero,
                                ),
                                width: getValueForScreenType<double?>(
                                  context: context,
                                  mobile: 370,
                                  tablet: double.maxFinite,
                                  desktop: double.maxFinite,
                                ),
                                height: getValueForScreenType<double?>(
                                  context: context,
                                  mobile: 220,
                                  tablet: null,
                                  desktop: null,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      getValueForScreenType<BorderRadius>(
                                    context: context,
                                    mobile: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                      bottomLeft: Radius.circular(20),
                                    ),
                                    tablet: BorderRadius.zero,
                                    desktop: BorderRadius.zero,
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius:
                                      getValueForScreenType<BorderRadius>(
                                    context: context,
                                    mobile: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                      bottomLeft: Radius.circular(20),
                                    ),
                                    tablet: BorderRadius.zero,
                                    desktop: BorderRadius.zero,
                                  ),
                                  child: Image.network(
                                    'https://blogger.googleusercontent.com/img/a/AVvXsEjYgaV2nk5cygOOkFQQTXkLsQeV6XY75xrIa5b4vQJ8uucki4j-7kJcVXZSDPGsgEbcL2QKyt7UnejinE9cqFAKQQdgZcBiHI3fKw9zOtw9ynCCZj0ze_Fs-pdrIzYHShmOhYtjBl-s5sfj6JIBcrLzh5c5Ba3kEWMwHfgEN3xRWAV5zlk65QvR7ZTEaw=w640-h360',
                                    width: getValueForScreenType<double?>(
                                      context: context,
                                      mobile: 370,
                                      tablet: double.maxFinite,
                                      desktop: double.maxFinite,
                                    ),
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
                              Container(
                                padding: getValueForScreenType<EdgeInsets>(
                                  context: context,
                                  mobile: const EdgeInsets.only(
                                    left: 6,
                                    right: 6,
                                  ),
                                  tablet: EdgeInsets.zero,
                                  desktop: EdgeInsets.zero,
                                ),
                                width: getValueForScreenType<double?>(
                                  context: context,
                                  mobile: 370,
                                  tablet: double.maxFinite,
                                  desktop: double.maxFinite,
                                ),
                                height: getValueForScreenType<double?>(
                                  context: context,
                                  mobile: 220,
                                  tablet: null,
                                  desktop: null,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      getValueForScreenType<BorderRadius>(
                                    context: context,
                                    mobile: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                      bottomLeft: Radius.circular(20),
                                    ),
                                    tablet: BorderRadius.zero,
                                    desktop: BorderRadius.zero,
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius:
                                      getValueForScreenType<BorderRadius>(
                                    context: context,
                                    mobile: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                      bottomLeft: Radius.circular(20),
                                    ),
                                    tablet: BorderRadius.zero,
                                    desktop: BorderRadius.zero,
                                  ),
                                  child: Image.network(
                                    'https://blogger.googleusercontent.com/img/a/AVvXsEh8YpZCbx07Fb5BOCkJSg63YoQEeMXWOH3ABcTA8T1C3KYAq9FAP_lS6n2czD_lq1qvwt6GB4jP974F0hXv9eMEoe91GGTqJoxu48nOlC8_W2-WSZRJOG-tk7jH18n64DeP_o0F7QiE9Phq_jqdlkB9r6KMpCWU7jMu1US_zsITFF_1nCjdv6Ujp8IWFA=w640-h360',
                                    width: getValueForScreenType<double?>(
                                      context: context,
                                      mobile: 370,
                                      tablet: double.maxFinite,
                                      desktop: double.maxFinite,
                                    ),
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
                            ],
                          ),
                        ),
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
                        mobile: 200,
                        tablet: null,
                        desktop: null,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF).withOpacity(1),
                        borderRadius: getValueForScreenType<BorderRadius>(
                          context: context,
                          mobile: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                          tablet: BorderRadius.zero,
                          desktop: BorderRadius.zero,
                        ),
                      ),
                      child: Padding(
                          padding: getValueForScreenType<EdgeInsets>(
                            context: context,
                            mobile: EdgeInsets.zero,
                            tablet: const EdgeInsets.only(
                              left: 2,
                            ),
                            desktop: const EdgeInsets.only(
                              left: 2,
                            ),
                          ),
                          child: SizedBox(
                            width: double.maxFinite,
                            height: getValueForScreenType<double?>(
                              context: context,
                              mobile: 200,
                              tablet: 150,
                              desktop: 150,
                            ),
                            child: Padding(
                                padding: getValueForScreenType<EdgeInsets>(
                                  context: context,
                                  mobile: const EdgeInsets.only(
                                    left: 8,
                                    right: 8,
                                  ),
                                  tablet: const EdgeInsets.only(
                                    left: 4,
                                  ),
                                  desktop: const EdgeInsets.only(
                                    left: 4,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding:
                                            getValueForScreenType<EdgeInsets>(
                                          context: context,
                                          mobile: const EdgeInsets.only(
                                            top: 15,
                                            bottom: 10,
                                          ),
                                          tablet: const EdgeInsets.only(
                                            top: 1,
                                          ),
                                          desktop: const EdgeInsets.only(
                                            top: 1,
                                          ),
                                        ),
                                        child: Text('हाम्रो सेवाहरु',
                                            style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                color: Color(0xFF000000)
                                                    .withOpacity(1),
                                                fontWeight: FontWeight.w700,
                                                fontSize: getValueForScreenType<
                                                    double>(
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
                                    Padding(
                                        padding:
                                            getValueForScreenType<EdgeInsets>(
                                          context: context,
                                          mobile: EdgeInsets.zero,
                                          tablet: const EdgeInsets.only(
                                            top: 6,
                                          ),
                                          desktop: const EdgeInsets.only(
                                            top: 6,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AnimationConfiguration
                                                .staggeredList(
                                              position: 1,
                                              duration: Duration(
                                                milliseconds: 800,
                                              ),
                                              child: FadeInAnimation(
                                                child: SlideAnimation(
                                                  child: BouncingWidget(
                                                    onPressed: () async {
                                                      await Navigator.push<
                                                          void>(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              PagePhoneNumberNeed(),
                                                        ),
                                                      );
                                                    },
                                                    duration: const Duration(
                                                        milliseconds: 100),
                                                    scaleFactor: 1.5,
                                                    child: Column(
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius.zero,
                                                          child: Image.network(
                                                            'https://blogger.googleusercontent.com/img/a/AVvXsEgON-uYNDRSiBuEkOMaQ0uHyOE9lfPuqFZZ6I3zSntQiusY1jMr42_3iW2PWPsGt4uMFCM7r3kKPqCsQz7TPeE04MMbhcuRCYUo6jVWjNovp6TjzHk71Ms8mzx0dz0NuPoyWPxKaDmOZyeijOi2wqqUe5zWsHA-xmaau3pzGnqRYvPRNzyIAZRMPn8huQ=w200-h200',
                                                            width:
                                                                getValueForScreenType<
                                                                    double?>(
                                                              context: context,
                                                              mobile: 80,
                                                              tablet: double
                                                                  .maxFinite,
                                                              desktop: double
                                                                  .maxFinite,
                                                            ),
                                                            height:
                                                                getValueForScreenType<
                                                                    double?>(
                                                              context: context,
                                                              mobile: 80,
                                                              tablet: 150,
                                                              desktop: 150,
                                                            ),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                              top: 6,
                                                            ),
                                                            child: Text(
                                                                '''आवश्यक 
फोन नम्बर''',
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
                                                                        getValueForScreenType<
                                                                            double>(
                                                                      context:
                                                                          context,
                                                                      mobile:
                                                                          15,
                                                                      tablet:
                                                                          16,
                                                                      desktop:
                                                                          16,
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
                                                                    TextAlign
                                                                        .center,
                                                                textDirection:
                                                                    TextDirection
                                                                        .ltr,
                                                                maxLines: 2)),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            AnimationConfiguration
                                                .staggeredList(
                                              position: 2,
                                              duration: Duration(
                                                milliseconds: 800,
                                              ),
                                              child: FadeInAnimation(
                                                child: SlideAnimation(
                                                  child: BouncingWidget(
                                                    onPressed: () async {
                                                      await Navigator.push<
                                                          void>(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              PageRomeFree(),
                                                        ),
                                                      );
                                                    },
                                                    duration: const Duration(
                                                        milliseconds: 100),
                                                    scaleFactor: 1.5,
                                                    child: Column(
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius.zero,
                                                          child: Image.network(
                                                            'https://blogger.googleusercontent.com/img/a/AVvXsEhc6XDobiYZF6j82ece7akHliKw8bBLcN7HgygHKPZZse_-zpS699HoxJ9GfDz4XBrppLa9Z7ZbI-H7iB8ewBGAtEDC6IQrRNPCbGwCw-3alJKnjwYdUr4ACpK9MvWBEiLYs2MjhaC7KeyIiBvQdPCP64HTJOhs3i1qlZZ9u0VmC5Sbxgy4Jt0Ie4ytIQ=w200-h200',
                                                            width:
                                                                getValueForScreenType<
                                                                    double?>(
                                                              context: context,
                                                              mobile: 80,
                                                              tablet: double
                                                                  .maxFinite,
                                                              desktop: double
                                                                  .maxFinite,
                                                            ),
                                                            height:
                                                                getValueForScreenType<
                                                                    double?>(
                                                              context: context,
                                                              mobile: 80,
                                                              tablet: 150,
                                                              desktop: 150,
                                                            ),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                              top: 6,
                                                            ),
                                                            child: Text('''कोठा
खाली छ''',
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
                                                                        getValueForScreenType<
                                                                            double>(
                                                                      context:
                                                                          context,
                                                                      mobile:
                                                                          15,
                                                                      tablet:
                                                                          16,
                                                                      desktop:
                                                                          16,
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
                                                                    TextAlign
                                                                        .center,
                                                                textDirection:
                                                                    TextDirection
                                                                        .ltr,
                                                                maxLines: 2)),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            AnimationConfiguration
                                                .staggeredList(
                                              position: 3,
                                              duration: Duration(
                                                milliseconds: 800,
                                              ),
                                              child: FadeInAnimation(
                                                child: SlideAnimation(
                                                  child: BouncingWidget(
                                                    onPressed: () async {
                                                      await Navigator.push<
                                                          void>(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              PageJobOffer(),
                                                        ),
                                                      );
                                                    },
                                                    duration: const Duration(
                                                        milliseconds: 100),
                                                    scaleFactor: 1.5,
                                                    child: Column(
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius.zero,
                                                          child: Image.network(
                                                            'https://blogger.googleusercontent.com/img/a/AVvXsEhhOsq_Esppo3Ck2R1PfY3ktFtmqOYQY_n8RQJHItsSv5wTw5qZuL3atF-E4rNK5nVFxyJd2Obax1GtlqCyETNU4TMQhe4RcDpQz-O0fYJR8fEPtYauuYHITg9K3Q3AiWYaHpjghxNKXatO2Tew-we8LJr2N4-o4l19u4PhbbBRFUrcg5RjqSwtsBskJw=w200-h200',
                                                            width:
                                                                getValueForScreenType<
                                                                    double?>(
                                                              context: context,
                                                              mobile: 80,
                                                              tablet: double
                                                                  .maxFinite,
                                                              desktop: double
                                                                  .maxFinite,
                                                            ),
                                                            height:
                                                                getValueForScreenType<
                                                                    double?>(
                                                              context: context,
                                                              mobile: 80,
                                                              tablet: 150,
                                                              desktop: 150,
                                                            ),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                              top: 6,
                                                            ),
                                                            child: Text(
                                                                '''कर्मचारी
आवश्यक''',
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
                                                                        getValueForScreenType<
                                                                            double>(
                                                                      context:
                                                                          context,
                                                                      mobile:
                                                                          15,
                                                                      tablet:
                                                                          16,
                                                                      desktop:
                                                                          16,
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
                                                                    TextAlign
                                                                        .center,
                                                                textDirection:
                                                                    TextDirection
                                                                        .ltr,
                                                                maxLines: 2)),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            AnimationConfiguration
                                                .staggeredList(
                                              position: 4,
                                              duration: Duration(
                                                milliseconds: 800,
                                              ),
                                              child: FadeInAnimation(
                                                child: SlideAnimation(
                                                  child: BouncingWidget(
                                                    onPressed: () async {
                                                      await Navigator.push<
                                                          void>(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              PageHospital(),
                                                        ),
                                                      );
                                                    },
                                                    duration: const Duration(
                                                        milliseconds: 100),
                                                    scaleFactor: 1.5,
                                                    child: Column(
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius.zero,
                                                          child: Image.network(
                                                            'https://blogger.googleusercontent.com/img/a/AVvXsEj8NrxENaSTKFVRTMk7UUACve8a4JA95Vq-ZkH2zu37WiudzPsv2wkLa_01RfpjhlvDsPyzyJc6QflrnjUSdWmxpN0dSurH3DgrAANXxpFnTbV6jJzD_D8O7tcgnEy76Np-58sjmhkC1wWzHXxcTOTJpZLLYw0qaUg3tz3k9KDWWRdFhXIJcUj9-vjFbg=w200-h200',
                                                            width:
                                                                getValueForScreenType<
                                                                    double?>(
                                                              context: context,
                                                              mobile: 80,
                                                              tablet: double
                                                                  .maxFinite,
                                                              desktop: double
                                                                  .maxFinite,
                                                            ),
                                                            height:
                                                                getValueForScreenType<
                                                                    double?>(
                                                              context: context,
                                                              mobile: 80,
                                                              tablet: 150,
                                                              desktop: 150,
                                                            ),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                              top: 6,
                                                            ),
                                                            child: Text(
                                                                'अस्पताल',
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
                                                                        getValueForScreenType<
                                                                            double>(
                                                                      context:
                                                                          context,
                                                                      mobile:
                                                                          15,
                                                                      tablet:
                                                                          16,
                                                                      desktop:
                                                                          16,
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
                                                                    TextAlign
                                                                        .center,
                                                                textDirection:
                                                                    TextDirection
                                                                        .ltr,
                                                                maxLines: 2)),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )),
                                  ],
                                )),
                          )),
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
                        mobile: 410,
                        tablet: null,
                        desktop: null,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: <Color>[
                            Color(0xFF6ACEFF).withOpacity(0),
                            Color(0xFFFFFFFF).withOpacity(1)
                          ],
                          stops: [0, 1.5],
                        ),
                        borderRadius: getValueForScreenType<BorderRadius>(
                          context: context,
                          mobile: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                          tablet: BorderRadius.zero,
                          desktop: BorderRadius.zero,
                        ),
                      ),
                      child: SizedBox(
                        width: double.maxFinite,
                        height: getValueForScreenType<double?>(
                          context: context,
                          mobile: 410,
                          tablet: 150,
                          desktop: 150,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: double.maxFinite,
                              height: getValueForScreenType<double?>(
                                context: context,
                                mobile: 210,
                                tablet: 150,
                                desktop: 150,
                              ),
                              child: Padding(
                                  padding: getValueForScreenType<EdgeInsets>(
                                    context: context,
                                    mobile: EdgeInsets.zero,
                                    tablet: const EdgeInsets.only(
                                      left: 4,
                                    ),
                                    desktop: const EdgeInsets.only(
                                      left: 4,
                                    ),
                                  ),
                                  child: NotificationListener<
                                      ScrollEndNotification>(
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
                                      physics:
                                          const AlwaysScrollableScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        Padding(
                                            padding: const EdgeInsets.only(
                                              right: 6,
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  getValueForScreenType<
                                                      BorderRadius>(
                                                context: context,
                                                mobile: BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  topRight: Radius.circular(20),
                                                  bottomRight:
                                                      Radius.circular(20),
                                                  bottomLeft:
                                                      Radius.circular(20),
                                                ),
                                                tablet: BorderRadius.zero,
                                                desktop: BorderRadius.zero,
                                              ),
                                              child: Image.network(
                                                'https://blogger.googleusercontent.com/img/a/AVvXsEglbUzNwcRD2EoFpZcWEfQQLj5Ow5Nn7GObZO2ZeoBrwY_Gs1HT8VKDY1y7rxkmfRSCNU5jkhGNFjf9sbShYbOJcau7kCITYISLbJs2seGgdH1G-nJ2MczYC24N7xQJHXUuz2e8KH4mnPJWWDE-a8Dfb7Xedi5N7eFlBWyLNrz2l6g3u9ZRts7E9ANUog=w640-h360',
                                                width: getValueForScreenType<
                                                    double?>(
                                                  context: context,
                                                  mobile: 370,
                                                  tablet: double.maxFinite,
                                                  desktop: double.maxFinite,
                                                ),
                                                height: getValueForScreenType<
                                                    double?>(
                                                  context: context,
                                                  mobile: 210,
                                                  tablet: 150,
                                                  desktop: 150,
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            )),
                                        Padding(
                                            padding: const EdgeInsets.only(
                                              right: 6,
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  getValueForScreenType<
                                                      BorderRadius>(
                                                context: context,
                                                mobile: BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  topRight: Radius.circular(20),
                                                  bottomRight:
                                                      Radius.circular(20),
                                                  bottomLeft:
                                                      Radius.circular(20),
                                                ),
                                                tablet: BorderRadius.zero,
                                                desktop: BorderRadius.zero,
                                              ),
                                              child: Image.network(
                                                'https://blogger.googleusercontent.com/img/a/AVvXsEiJvE0z129m-lntk_nSRu7zAMoh_8fhb3iXY6gOUhWzCmHun9S-sUeHn5PxAmVvU6-T__fIiOfDBsdM3h0_hzu9AM1eKtWUPpDRlYgXOFcf2gSZa50ZJ9IFpMVgpCnGdxyhgr8-njLT2mEs1LucVQnNuLRFM7UlJyxeuhAizONrSl2slMFYilW1-K0D3Q=w640-h360',
                                                width: getValueForScreenType<
                                                    double?>(
                                                  context: context,
                                                  mobile: 370,
                                                  tablet: double.maxFinite,
                                                  desktop: double.maxFinite,
                                                ),
                                                height: getValueForScreenType<
                                                    double?>(
                                                  context: context,
                                                  mobile: 210,
                                                  tablet: 150,
                                                  desktop: 150,
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            )),
                                      ],
                                    ),
                                  )),
                            ),
                            Padding(
                                padding: getValueForScreenType<EdgeInsets>(
                                  context: context,
                                  mobile: const EdgeInsets.only(
                                    left: 10,
                                    top: 15,
                                    right: 10,
                                    bottom: 10,
                                  ),
                                  tablet: const EdgeInsets.only(
                                    left: 1,
                                  ),
                                  desktop: const EdgeInsets.only(
                                    left: 1,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('स्थानीय सरकार ( रामेछाप जिल्ला )',
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            color: BlocProvider.of<ThemeCubit>(
                                                    context)
                                                .getColor('Text / Primary'),
                                            fontWeight: FontWeight.w700,
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
                                        maxLines: 1),
                                    Icon(
                                      MdiIcons.fromString('arrow-right'),
                                      size: 24,
                                      color: Color(0xFF000000).withOpacity(1),
                                    ),
                                  ],
                                )),
                            SizedBox(
                              width: double.maxFinite,
                              height: getValueForScreenType<double?>(
                                context: context,
                                mobile: 140,
                                tablet: 150,
                                desktop: 150,
                              ),
                              child:
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
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    AnimationConfiguration.staggeredList(
                                      position: 1,
                                      duration: Duration(
                                        milliseconds: 800,
                                      ),
                                      child: FadeInAnimation(
                                        child: SlideAnimation(
                                          child: BouncingWidget(
                                            onPressed: () async {
                                              await Navigator.push<void>(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      PageMonthalinagarapalika(),
                                                ),
                                              );
                                            },
                                            duration: const Duration(
                                                milliseconds: 100),
                                            scaleFactor: 1.5,
                                            child: Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 8,
                                                ),
                                                child: Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile: EdgeInsets.zero,
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        right: 8,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        right: 8,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              getValueForScreenType<
                                                                  BorderRadius>(
                                                            context: context,
                                                            mobile: BorderRadius
                                                                .only(
                                                              topLeft: Radius
                                                                  .circular(12),
                                                              topRight: Radius
                                                                  .circular(12),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          12),
                                                              bottomLeft: Radius
                                                                  .circular(12),
                                                            ),
                                                            tablet: BorderRadius
                                                                .zero,
                                                            desktop:
                                                                BorderRadius
                                                                    .zero,
                                                          ),
                                                          child: Image.network(
                                                            'https://blogger.googleusercontent.com/img/a/AVvXsEgLnyjF23mtaG3MWI0wLIrgF6q9IE4Wz_vcjwbXYF2F3UGa05J1ekEiUqd4ExursTo06E_3_hri-GoU9ysXDN16pPI9Ocf5cz-hL8VMDyEZDRUK_tEYDyJNNMpkszggbYa_UCgRR0usVgIk6kZuhbV7dTtmR48jImSMBv6B1tdDjzEN9MYtv8u0-1v_qA=w200-h200',
                                                            width:
                                                                getValueForScreenType<
                                                                    double?>(
                                                              context: context,
                                                              mobile: 80,
                                                              tablet: double
                                                                  .maxFinite,
                                                              desktop: double
                                                                  .maxFinite,
                                                            ),
                                                            height:
                                                                getValueForScreenType<
                                                                    double?>(
                                                              context: context,
                                                              mobile: 80,
                                                              tablet: 150,
                                                              desktop: 150,
                                                            ),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                              top: 6,
                                                            ),
                                                            child: Text(
                                                                '''मन्थली
नगरपालिका''',
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
                                                                        getValueForScreenType<
                                                                            double>(
                                                                      context:
                                                                          context,
                                                                      mobile:
                                                                          15,
                                                                      tablet:
                                                                          16,
                                                                      desktop:
                                                                          16,
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
                                                                    TextAlign
                                                                        .center,
                                                                textDirection:
                                                                    TextDirection
                                                                        .ltr,
                                                                maxLines: 2)),
                                                      ],
                                                    ))),
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
                                        child: SlideAnimation(
                                          child: BouncingWidget(
                                            onPressed: () async {},
                                            duration: const Duration(
                                                milliseconds: 100),
                                            scaleFactor: 1.5,
                                            child: Padding(
                                                padding: getValueForScreenType<
                                                    EdgeInsets>(
                                                  context: context,
                                                  mobile: const EdgeInsets.only(
                                                    left: 12,
                                                  ),
                                                  tablet: const EdgeInsets.only(
                                                    left: 8,
                                                  ),
                                                  desktop:
                                                      const EdgeInsets.only(
                                                    left: 8,
                                                  ),
                                                ),
                                                child: Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile: EdgeInsets.zero,
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        right: 8,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        right: 8,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius.zero,
                                                          child: Image.network(
                                                            'https://blogger.googleusercontent.com/img/a/AVvXsEgPD80qslwkhg_EDOCsLT5Ra0duW1RaIaDEAfyWJz4KunDKDN0mUzAWozN3I1PwDfwLBLrkD-iLrtJyyuMwnpijM6o58OcUYkjAVJLeqmRuDu-gGgU_YZHclVzCQkQFawsUVLjOqY0A0R3C-MKhyqD7HcSy1xhx9St9cFc5N4QK-rNrhec2fC_875nnzg=w200-h200',
                                                            width:
                                                                getValueForScreenType<
                                                                    double?>(
                                                              context: context,
                                                              mobile: 80,
                                                              tablet: double
                                                                  .maxFinite,
                                                              desktop: double
                                                                  .maxFinite,
                                                            ),
                                                            height:
                                                                getValueForScreenType<
                                                                    double?>(
                                                              context: context,
                                                              mobile: 80,
                                                              tablet: 150,
                                                              desktop: 150,
                                                            ),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                              top: 6,
                                                            ),
                                                            child: Text(
                                                                '''रामेछाप
नगरपालिका''',
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
                                                                        getValueForScreenType<
                                                                            double>(
                                                                      context:
                                                                          context,
                                                                      mobile:
                                                                          15,
                                                                      tablet:
                                                                          16,
                                                                      desktop:
                                                                          16,
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
                                                                    TextAlign
                                                                        .center,
                                                                textDirection:
                                                                    TextDirection
                                                                        .ltr,
                                                                maxLines: 2)),
                                                      ],
                                                    ))),
                                          ),
                                        ),
                                      ),
                                    ),
                                    AnimationConfiguration.staggeredList(
                                      position: 3,
                                      duration: Duration(
                                        milliseconds: 800,
                                      ),
                                      child: FadeInAnimation(
                                        child: SlideAnimation(
                                          child: BouncingWidget(
                                            onPressed: () async {},
                                            duration: const Duration(
                                                milliseconds: 100),
                                            scaleFactor: 1.5,
                                            child: Padding(
                                                padding: getValueForScreenType<
                                                    EdgeInsets>(
                                                  context: context,
                                                  mobile: const EdgeInsets.only(
                                                    left: 12,
                                                  ),
                                                  tablet: const EdgeInsets.only(
                                                    left: 8,
                                                  ),
                                                  desktop:
                                                      const EdgeInsets.only(
                                                    left: 8,
                                                  ),
                                                ),
                                                child: Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile: EdgeInsets.zero,
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        right: 8,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        right: 8,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius.zero,
                                                          child: Image.network(
                                                            'https://blogger.googleusercontent.com/img/a/AVvXsEj7-z3ysj0xy2yEjaiXWpEwo6raRkPKG16stY_lz54t9oGVQr1xRjzPRnsiSjEct0IWrl_ciFIW8Kww-JVUk3VDDEZQ_SHwRDwIi5u6HSrq50iHlOUvQHRnqQ2bZzLgK-JABpturhEBc5CnFlMhJF8EAqtf0qcnUkVF2VtKEgDTf0FQp4Bpug2WZsnayA=w200-h200',
                                                            width:
                                                                getValueForScreenType<
                                                                    double?>(
                                                              context: context,
                                                              mobile: 80,
                                                              tablet: double
                                                                  .maxFinite,
                                                              desktop: double
                                                                  .maxFinite,
                                                            ),
                                                            height:
                                                                getValueForScreenType<
                                                                    double?>(
                                                              context: context,
                                                              mobile: 80,
                                                              tablet: 150,
                                                              desktop: 150,
                                                            ),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                              top: 6,
                                                            ),
                                                            child: Text(
                                                                '''खाडादेबी
गाउपालिका ''',
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
                                                                        getValueForScreenType<
                                                                            double>(
                                                                      context:
                                                                          context,
                                                                      mobile:
                                                                          15,
                                                                      tablet:
                                                                          16,
                                                                      desktop:
                                                                          16,
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
                                                                    TextAlign
                                                                        .center,
                                                                textDirection:
                                                                    TextDirection
                                                                        .ltr,
                                                                maxLines: 2)),
                                                      ],
                                                    ))),
                                          ),
                                        ),
                                      ),
                                    ),
                                    AnimationConfiguration.staggeredList(
                                      position: 4,
                                      duration: Duration(
                                        milliseconds: 800,
                                      ),
                                      child: FadeInAnimation(
                                        child: SlideAnimation(
                                          child: BouncingWidget(
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
                                            child: Padding(
                                                padding: getValueForScreenType<
                                                    EdgeInsets>(
                                                  context: context,
                                                  mobile: const EdgeInsets.only(
                                                    left: 12,
                                                  ),
                                                  tablet: const EdgeInsets.only(
                                                    left: 8,
                                                  ),
                                                  desktop:
                                                      const EdgeInsets.only(
                                                    left: 8,
                                                  ),
                                                ),
                                                child: Column(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.zero,
                                                      child: Image.network(
                                                        'https://blogger.googleusercontent.com/img/a/AVvXsEin1i-uxTJxS6Vwkr_KwCgB3-Jjd4nLAVwVRGVekKuzwT5zmJ9cnQlhQ0E0mYuRxqacDng_ohhTRIUIKSRnWL1TmmU3YS6SbKO5hdIvcBO_H8pYhzjjhwbhgECTL94oQUKFAsVxzCsfUFI9xP8IGVcFApTfG1BP8_CEYvcKqPCg5zs9FJqxzqbTbvcG5w=w200-h200',
                                                        width:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 80,
                                                          tablet:
                                                              double.maxFinite,
                                                          desktop:
                                                              double.maxFinite,
                                                        ),
                                                        height:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 80,
                                                          tablet: 150,
                                                          desktop: 150,
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          top: 6,
                                                        ),
                                                        child: Text('''लिखु 
गाउपालिका''',
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
                                                                  mobile: 15,
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
                                                            textAlign: TextAlign
                                                                .center,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                            maxLines: 2)),
                                                  ],
                                                )),
                                          ),
                                        ),
                                      ),
                                    ),
                                    AnimationConfiguration.staggeredList(
                                      position: 5,
                                      duration: Duration(
                                        milliseconds: 800,
                                      ),
                                      child: FadeInAnimation(
                                        child: SlideAnimation(
                                          child: BouncingWidget(
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
                                            child: Padding(
                                                padding: getValueForScreenType<
                                                    EdgeInsets>(
                                                  context: context,
                                                  mobile: const EdgeInsets.only(
                                                    left: 12,
                                                  ),
                                                  tablet: const EdgeInsets.only(
                                                    left: 8,
                                                  ),
                                                  desktop:
                                                      const EdgeInsets.only(
                                                    left: 8,
                                                  ),
                                                ),
                                                child: Column(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.zero,
                                                      child: Image.network(
                                                        'https://blogger.googleusercontent.com/img/a/AVvXsEji6GR4NqWBXernkYB6Ga_mQiH_bxND4nddrUeSWfphy7c_40-kIpcTXtkontgylUB9ANHz-SewkRT12McE1C8h9p-PC-R-Q68WZqkYkT35p7mmsMP37tT_0zVJpoY6bngc5Mx-8jPXo-OLz2fr_XyBPrH21o3SFicHKDPnRPVhoPNvUixw8f9GzVnfkw=w200-h200',
                                                        width:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 80,
                                                          tablet:
                                                              double.maxFinite,
                                                          desktop:
                                                              double.maxFinite,
                                                        ),
                                                        height:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 80,
                                                          tablet: 150,
                                                          desktop: 150,
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          top: 6,
                                                        ),
                                                        child: Text('''दोरम्बा
गाउपालिका''',
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
                                                                  mobile: 15,
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
                                                            textAlign: TextAlign
                                                                .center,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                            maxLines: 2)),
                                                  ],
                                                )),
                                          ),
                                        ),
                                      ),
                                    ),
                                    AnimationConfiguration.staggeredList(
                                      position: 6,
                                      duration: Duration(
                                        milliseconds: 800,
                                      ),
                                      child: FadeInAnimation(
                                        child: SlideAnimation(
                                          child: BouncingWidget(
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
                                            child: Padding(
                                                padding: getValueForScreenType<
                                                    EdgeInsets>(
                                                  context: context,
                                                  mobile: const EdgeInsets.only(
                                                    left: 12,
                                                  ),
                                                  tablet: const EdgeInsets.only(
                                                    left: 8,
                                                  ),
                                                  desktop:
                                                      const EdgeInsets.only(
                                                    left: 8,
                                                  ),
                                                ),
                                                child: Column(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.zero,
                                                      child: Image.network(
                                                        'https://blogger.googleusercontent.com/img/a/AVvXsEgAaZJv88vDbSOWBZ4kNuu5xwxt4cLuanKBzHAsEztE5wUq7qp9o2nsChwy6qLSAyh5U5DNZmT5VrD36jCL3MWCQy3LunTeO5FGqu9aRs2fzI84KFhRUfjj2Qx55xeO0BVgtKxaAprYgyzPoqpB7ImAeFztDXCVY9e-jc6QQw1DbkUYblPCNGObgHCmVg=w200-h200',
                                                        width:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 80,
                                                          tablet:
                                                              double.maxFinite,
                                                          desktop:
                                                              double.maxFinite,
                                                        ),
                                                        height:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 80,
                                                          tablet: 150,
                                                          desktop: 150,
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          top: 6,
                                                        ),
                                                        child: Text('''गोकुलगंगा
गाउपालिका''',
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
                                                                  mobile: 15,
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
                                                            textAlign: TextAlign
                                                                .center,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                            maxLines: 2)),
                                                  ],
                                                )),
                                          ),
                                        ),
                                      ),
                                    ),
                                    AnimationConfiguration.staggeredList(
                                      position: 7,
                                      duration: Duration(
                                        milliseconds: 800,
                                      ),
                                      child: FadeInAnimation(
                                        child: SlideAnimation(
                                          child: BouncingWidget(
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
                                            child: Padding(
                                                padding: getValueForScreenType<
                                                    EdgeInsets>(
                                                  context: context,
                                                  mobile: const EdgeInsets.only(
                                                    left: 12,
                                                  ),
                                                  tablet: const EdgeInsets.only(
                                                    left: 8,
                                                  ),
                                                  desktop:
                                                      const EdgeInsets.only(
                                                    left: 8,
                                                  ),
                                                ),
                                                child: Column(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.zero,
                                                      child: Image.network(
                                                        'https://blogger.googleusercontent.com/img/a/AVvXsEgR51qdM7S4gpOvz2UNqG_MSWFpLisYNHq-LfnSTwU5sMhh9Y3URd75Ba_qXM6SIpP1hd-9iMMht0qmYhko8-QVfOCjSGNh838CKTGkVxen55-4fYK5T8rnaBWTCddn9H9uh56ex1bayBp3Od5B5gSMNWQmhJURnCd_vd6bSxXw8TtPhvY1pEbx7YnXVg=w200-h200',
                                                        width:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 80,
                                                          tablet:
                                                              double.maxFinite,
                                                          desktop:
                                                              double.maxFinite,
                                                        ),
                                                        height:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 80,
                                                          tablet: 150,
                                                          desktop: 150,
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          top: 6,
                                                        ),
                                                        child: Text('''सुनापति
गाउपालिका''',
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
                                                                  mobile: 15,
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
                                                            textAlign: TextAlign
                                                                .center,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                            maxLines: 2)),
                                                  ],
                                                )),
                                          ),
                                        ),
                                      ),
                                    ),
                                    AnimationConfiguration.staggeredList(
                                      position: 8,
                                      duration: Duration(
                                        milliseconds: 800,
                                      ),
                                      child: FadeInAnimation(
                                        child: SlideAnimation(
                                          child: BouncingWidget(
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
                                            child: Padding(
                                                padding: getValueForScreenType<
                                                    EdgeInsets>(
                                                  context: context,
                                                  mobile: const EdgeInsets.only(
                                                    left: 12,
                                                    right: 8,
                                                  ),
                                                  tablet: const EdgeInsets.only(
                                                    left: 8,
                                                  ),
                                                  desktop:
                                                      const EdgeInsets.only(
                                                    left: 8,
                                                  ),
                                                ),
                                                child: Column(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.zero,
                                                      child: Image.network(
                                                        'https://blogger.googleusercontent.com/img/a/AVvXsEjV4o8e3ngi1EYq4uuwKKiVCMlR5SpVMh5BVw0tQsch5rd18HWN6tb0csfKCuuTJjnad_gF_uh1vKrpFXDDLNA9VrW0Iz5xcPT3yw4iPtVGOBCHAFCEY9mR1LIWbtUNEO70bGBY932Jyrj1zLYhNGridSuJQlwUvcJbZJieuNVO5FsRGQtLCYNuMi92Xg=w200-h200',
                                                        width:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 80,
                                                          tablet:
                                                              double.maxFinite,
                                                          desktop:
                                                              double.maxFinite,
                                                        ),
                                                        height:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 80,
                                                          tablet: 150,
                                                          desktop: 150,
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          top: 6,
                                                        ),
                                                        child: Text(
                                                            '''उमा कुण्ड 
गाउपालिका''',
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
                                                                  mobile: 15,
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
                                                            textAlign: TextAlign
                                                                .center,
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                            maxLines: 2)),
                                                  ],
                                                )),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
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
                        mobile: 530,
                        tablet: null,
                        desktop: null,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: <Color>[
                            Color(0xFF6ACEFF).withOpacity(0),
                            Color(0xFFFFFFFF).withOpacity(1)
                          ],
                          stops: [0, 0.5],
                        ),
                        borderRadius: getValueForScreenType<BorderRadius>(
                          context: context,
                          mobile: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                          tablet: BorderRadius.zero,
                          desktop: BorderRadius.zero,
                        ),
                      ),
                      child: Padding(
                          padding: getValueForScreenType<EdgeInsets>(
                            context: context,
                            mobile: EdgeInsets.zero,
                            tablet: const EdgeInsets.only(
                              left: 2,
                            ),
                            desktop: const EdgeInsets.only(
                              left: 2,
                            ),
                          ),
                          child: SizedBox(
                            width: double.maxFinite,
                            height: getValueForScreenType<double?>(
                              context: context,
                              mobile: 530,
                              tablet: 150,
                              desktop: 150,
                            ),
                            child: Padding(
                                padding: getValueForScreenType<EdgeInsets>(
                                  context: context,
                                  mobile: EdgeInsets.zero,
                                  tablet: const EdgeInsets.only(
                                    left: 4,
                                  ),
                                  desktop: const EdgeInsets.only(
                                    left: 4,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding:
                                            getValueForScreenType<EdgeInsets>(
                                          context: context,
                                          mobile: EdgeInsets.zero,
                                          tablet: const EdgeInsets.only(
                                            right: 6,
                                          ),
                                          desktop: const EdgeInsets.only(
                                            right: 6,
                                          ),
                                        ),
                                        child: SizedBox(
                                          width: double.maxFinite,
                                          height:
                                              getValueForScreenType<double?>(
                                            context: context,
                                            mobile: 210,
                                            tablet: 150,
                                            desktop: 150,
                                          ),
                                          child: NotificationListener<
                                              ScrollEndNotification>(
                                            onNotification: (final scrollEnd) {
                                              final metrics = scrollEnd.metrics;
                                              if (metrics.atEdge) {
                                                final isTop =
                                                    metrics.pixels == 0;
                                                if (isTop) {
                                                } else {}
                                              }
                                              return true;
                                            },
                                            child: ListView(
                                              reverse: false,
                                              primary: true,
                                              physics:
                                                  const AlwaysScrollableScrollPhysics(),
                                              scrollDirection: Axis.horizontal,
                                              children: [
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile:
                                                          const EdgeInsets.only(
                                                        left: 6,
                                                        right: 6,
                                                      ),
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        right: 6,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        right: 6,
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
                                                                  20),
                                                          topRight:
                                                              Radius.circular(
                                                                  20),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  20),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  20),
                                                        ),
                                                        tablet:
                                                            BorderRadius.zero,
                                                        desktop:
                                                            BorderRadius.zero,
                                                      ),
                                                      child: Image.network(
                                                        'https://blogger.googleusercontent.com/img/a/AVvXsEglbUzNwcRD2EoFpZcWEfQQLj5Ow5Nn7GObZO2ZeoBrwY_Gs1HT8VKDY1y7rxkmfRSCNU5jkhGNFjf9sbShYbOJcau7kCITYISLbJs2seGgdH1G-nJ2MczYC24N7xQJHXUuz2e8KH4mnPJWWDE-a8Dfb7Xedi5N7eFlBWyLNrz2l6g3u9ZRts7E9ANUog=w640-h360',
                                                        width:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 370,
                                                          tablet:
                                                              double.maxFinite,
                                                          desktop:
                                                              double.maxFinite,
                                                        ),
                                                        height:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 210,
                                                          tablet: 150,
                                                          desktop: 150,
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    )),
                                                Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      right: 6,
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
                                                                  20),
                                                          topRight:
                                                              Radius.circular(
                                                                  20),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  20),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  20),
                                                        ),
                                                        tablet:
                                                            BorderRadius.zero,
                                                        desktop:
                                                            BorderRadius.zero,
                                                      ),
                                                      child: Image.network(
                                                        'https://blogger.googleusercontent.com/img/a/AVvXsEh5EvIIKfZIGZ36b0rEdJVuQJ21XCQDhiqIDL92h5pi6vztcKlC9W8eo56Otre5w-8X1MHItg1XEkywzB8jET4CSykfk3Pxq2FMEsolz7uS9TiPYJW19Vk8KZGwnRyRz-CuSDwpk2wKmy59DsKP2hPmIS6vNGOwrXT2f3956FJ0fjhVR85alTBHzpKG5A=w640-h360',
                                                        width:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 370,
                                                          tablet:
                                                              double.maxFinite,
                                                          desktop:
                                                              double.maxFinite,
                                                        ),
                                                        height:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 210,
                                                          tablet: 150,
                                                          desktop: 150,
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    )),
                                                Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      right: 6,
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
                                                                  20),
                                                          topRight:
                                                              Radius.circular(
                                                                  20),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  20),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  20),
                                                        ),
                                                        tablet:
                                                            BorderRadius.zero,
                                                        desktop:
                                                            BorderRadius.zero,
                                                      ),
                                                      child: Image.network(
                                                        'https://blogger.googleusercontent.com/img/a/AVvXsEgPuRDSVVozzX5doEQDuqzoQaeN4wClA-gQaL-iNJnerEHiDdIjH4tjyHU2Q2-l4M5BrS75QCXHxvsGlAL1q4jtiFCP37wfRCAe8F30ksOJNq-akedhermpMj142wW8bt1z3x9b8Ht76LB0mJta0TiDwM5seOAgumIQVyH2_Sw_gm7cNhdkF-KXPaP6Hg=w640-h360',
                                                        width:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 370,
                                                          tablet:
                                                              double.maxFinite,
                                                          desktop:
                                                              double.maxFinite,
                                                        ),
                                                        height:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 210,
                                                          tablet: 150,
                                                          desktop: 150,
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    )),
                                              ],
                                            ),
                                          ),
                                        )),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                          left: 6,
                                          right: 6,
                                        ),
                                        child: Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: const EdgeInsets.only(
                                                top: 15,
                                                bottom: 10,
                                              ),
                                              tablet: const EdgeInsets.only(
                                                top: 1,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                top: 1,
                                              ),
                                            ),
                                            child: Text('बिक्रीमा',
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    color: Color(0xFF000000)
                                                        .withOpacity(1),
                                                    fontWeight: FontWeight.w700,
                                                    fontSize:
                                                        getValueForScreenType<
                                                            double>(
                                                      context: context,
                                                      mobile: 20,
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
                                                maxLines: 1))),
                                    Padding(
                                        padding:
                                            getValueForScreenType<EdgeInsets>(
                                          context: context,
                                          mobile: const EdgeInsets.only(
                                            left: 6,
                                            right: 6,
                                          ),
                                          tablet: const EdgeInsets.only(
                                            left: 6,
                                          ),
                                          desktop: const EdgeInsets.only(
                                            left: 6,
                                          ),
                                        ),
                                        child: Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: EdgeInsets.zero,
                                              tablet: const EdgeInsets.only(
                                                top: 6,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                top: 6,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                AnimationConfiguration
                                                    .staggeredList(
                                                  position: 1,
                                                  duration: Duration(
                                                    milliseconds: 800,
                                                  ),
                                                  child: FadeInAnimation(
                                                    child: SlideAnimation(
                                                      child: BouncingWidget(
                                                        onPressed: () async {
                                                          await Navigator.push<
                                                              void>(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  PageManthaliwebHouseSell(),
                                                            ),
                                                          );
                                                        },
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    100),
                                                        scaleFactor: 1.5,
                                                        child: Column(
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .zero,
                                                              child:
                                                                  Image.network(
                                                                'https://blogger.googleusercontent.com/img/a/AVvXsEhzcp7qFgDx7SYaNuxs-ZRmqpTymcUcVYYq2paVcY1u8tJu_T96ZlB4s8jpw9aizhFDhvWmVxnfFRlTkc0ylLz1hPth9MNpWTxUVnQxqYte5yuJK0v8qOqWNDTIgBN0XkdU0-S077Ctaw0ihFTCnPL3x7Eu1d3VkeoJq7Ol7DsoSEkcw008hq4t9g-eOQ=w200-h200',
                                                                width:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: double
                                                                      .maxFinite,
                                                                  desktop: double
                                                                      .maxFinite,
                                                                ),
                                                                height:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: 150,
                                                                  desktop: 150,
                                                                ),
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                  top: 6,
                                                                ),
                                                                child: Text(
                                                                    'घर / जग्गा',
                                                                    style: GoogleFonts
                                                                        .poppins(
                                                                      textStyle:
                                                                          TextStyle(
                                                                        color: Color(0xFF000000)
                                                                            .withOpacity(1),
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        fontSize:
                                                                            getValueForScreenType<double>(
                                                                          context:
                                                                              context,
                                                                          mobile:
                                                                              15,
                                                                          tablet:
                                                                              16,
                                                                          desktop:
                                                                              16,
                                                                        ),
                                                                        fontStyle:
                                                                            FontStyle.normal,
                                                                        decoration:
                                                                            TextDecoration.none,
                                                                      ),
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    textDirection:
                                                                        TextDirection
                                                                            .ltr,
                                                                    maxLines:
                                                                        2)),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                AnimationConfiguration
                                                    .staggeredList(
                                                  position: 2,
                                                  duration: Duration(
                                                    milliseconds: 800,
                                                  ),
                                                  child: FadeInAnimation(
                                                    child: SlideAnimation(
                                                      child: BouncingWidget(
                                                        onPressed: () async {
                                                          await Navigator.push<
                                                              void>(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  PageMakeNewpagecopypestA2(),
                                                            ),
                                                          );
                                                        },
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    100),
                                                        scaleFactor: 1.5,
                                                        child: Column(
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .zero,
                                                              child:
                                                                  Image.network(
                                                                'https://blogger.googleusercontent.com/img/a/AVvXsEg5j-4YdJWDa2ps-8CZYp9Xdr1ykLIFfxl8kHshEOuNNsDXtjGDN5cMDniWjIjMFP5JEraIHw9xqAEeQeNuIp3TI_U3E-FdiAXRE5Rpcv32eu5VzOEFvmASDX3HTxUEQ-P3F_yLMgEUFPwhSuuO9vaoTCYBZZR1vKM5gr61ECyyR1ZiaecdDbSPJJQ4sA=w200-h200',
                                                                width:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: double
                                                                      .maxFinite,
                                                                  desktop: double
                                                                      .maxFinite,
                                                                ),
                                                                height:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: 150,
                                                                  desktop: 150,
                                                                ),
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                  top: 6,
                                                                ),
                                                                child: Text(
                                                                    'पसल',
                                                                    style: GoogleFonts
                                                                        .poppins(
                                                                      textStyle:
                                                                          TextStyle(
                                                                        color: Color(0xFF000000)
                                                                            .withOpacity(1),
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        fontSize:
                                                                            getValueForScreenType<double>(
                                                                          context:
                                                                              context,
                                                                          mobile:
                                                                              15,
                                                                          tablet:
                                                                              16,
                                                                          desktop:
                                                                              16,
                                                                        ),
                                                                        fontStyle:
                                                                            FontStyle.normal,
                                                                        decoration:
                                                                            TextDecoration.none,
                                                                      ),
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    textDirection:
                                                                        TextDirection
                                                                            .ltr,
                                                                    maxLines:
                                                                        2)),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                AnimationConfiguration
                                                    .staggeredList(
                                                  position: 3,
                                                  duration: Duration(
                                                    milliseconds: 800,
                                                  ),
                                                  child: FadeInAnimation(
                                                    child: SlideAnimation(
                                                      child: BouncingWidget(
                                                        onPressed: () async {
                                                          await Navigator.push<
                                                              void>(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  PageMakenewpagecopypest(),
                                                            ),
                                                          );
                                                        },
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    100),
                                                        scaleFactor: 1.5,
                                                        child: Column(
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .zero,
                                                              child:
                                                                  Image.network(
                                                                'https://blogger.googleusercontent.com/img/a/AVvXsEhmagVs3ad72dYTfIwgpJaOs9TLgw04pXo5tcH6P8lQsLvFMkzYRoDIL86oMViExTP2VwD0Ohf2i7uLK1s6u3dxWjWTmdO1hmoLpDrAfag2G8fJtrHhxZImq9lsrr9Mwe0rlIVUNUDMqcqCVavsvxetQp513qP9fzlQJSzOOPIMHFvdQlD1QGQvODNN_Q=w200-h200',
                                                                width:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: double
                                                                      .maxFinite,
                                                                  desktop: double
                                                                      .maxFinite,
                                                                ),
                                                                height:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: 150,
                                                                  desktop: 150,
                                                                ),
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                  top: 6,
                                                                ),
                                                                child: Text(
                                                                    'गाडी',
                                                                    style: GoogleFonts
                                                                        .poppins(
                                                                      textStyle:
                                                                          TextStyle(
                                                                        color: Color(0xFF000000)
                                                                            .withOpacity(1),
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        fontSize:
                                                                            getValueForScreenType<double>(
                                                                          context:
                                                                              context,
                                                                          mobile:
                                                                              15,
                                                                          tablet:
                                                                              16,
                                                                          desktop:
                                                                              16,
                                                                        ),
                                                                        fontStyle:
                                                                            FontStyle.normal,
                                                                        decoration:
                                                                            TextDecoration.none,
                                                                      ),
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    textDirection:
                                                                        TextDirection
                                                                            .ltr,
                                                                    maxLines:
                                                                        2)),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                AnimationConfiguration
                                                    .staggeredList(
                                                  position: 4,
                                                  duration: Duration(
                                                    milliseconds: 800,
                                                  ),
                                                  child: FadeInAnimation(
                                                    child: SlideAnimation(
                                                      child: BouncingWidget(
                                                        onPressed: () async {
                                                          await Navigator.push<
                                                              void>(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  PageRoomFreeHide(),
                                                            ),
                                                          );
                                                        },
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    100),
                                                        scaleFactor: 1.5,
                                                        child: Column(
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .zero,
                                                              child:
                                                                  Image.network(
                                                                'https://blogger.googleusercontent.com/img/a/AVvXsEg63-2JceqkpKTD5x3b9iPj1iFA0zfU5s6XhFBgrIBr05DTTwwqJmVZkGUMjrmjG9NXmoec9xWgaR0kHuVtQQcQ70JXzA9L6CqYle-4uocjXflAg5ERUqzw52DTDJzpnFss2SNDLgIUx_m-JRCeqgB1TXwn0fqm99Ly8rgEuJgL1jNbs7KBzENotT2Utw=w200-h200',
                                                                width:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: double
                                                                      .maxFinite,
                                                                  desktop: double
                                                                      .maxFinite,
                                                                ),
                                                                height:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: 150,
                                                                  desktop: 150,
                                                                ),
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                  top: 6,
                                                                ),
                                                                child: Text(
                                                                    'होटल',
                                                                    style: GoogleFonts
                                                                        .poppins(
                                                                      textStyle:
                                                                          TextStyle(
                                                                        color: Color(0xFF000000)
                                                                            .withOpacity(1),
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        fontSize:
                                                                            getValueForScreenType<double>(
                                                                          context:
                                                                              context,
                                                                          mobile:
                                                                              15,
                                                                          tablet:
                                                                              16,
                                                                          desktop:
                                                                              16,
                                                                        ),
                                                                        fontStyle:
                                                                            FontStyle.normal,
                                                                        decoration:
                                                                            TextDecoration.none,
                                                                      ),
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    textDirection:
                                                                        TextDirection
                                                                            .ltr,
                                                                    maxLines:
                                                                        2)),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ))),
                                    Padding(
                                        padding:
                                            getValueForScreenType<EdgeInsets>(
                                          context: context,
                                          mobile: const EdgeInsets.only(
                                            left: 6,
                                            top: 10,
                                            right: 6,
                                          ),
                                          tablet: const EdgeInsets.only(
                                            top: 5,
                                          ),
                                          desktop: const EdgeInsets.only(
                                            top: 5,
                                          ),
                                        ),
                                        child: Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: EdgeInsets.zero,
                                              tablet: const EdgeInsets.only(
                                                top: 6,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                top: 6,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                AnimationConfiguration
                                                    .staggeredList(
                                                  position: 1,
                                                  duration: Duration(
                                                    milliseconds: 800,
                                                  ),
                                                  child: FadeInAnimation(
                                                    child: SlideAnimation(
                                                      child: BouncingWidget(
                                                        onPressed: () async {
                                                          await Navigator.push<
                                                              void>(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  PageMakenewpagecopypest(),
                                                            ),
                                                          );
                                                        },
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    100),
                                                        scaleFactor: 1.5,
                                                        child: Column(
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .zero,
                                                              child:
                                                                  Image.network(
                                                                'https://blogger.googleusercontent.com/img/a/AVvXsEhwbzQJ3pF1lYxX88LNwMi6dVW-ZhTmCQb7MdU2i-O5-HT_JBgipaRfnVoqg4-JJhc3BEODisLUMRVhK8bFMAa_BtLARL9HAfRyv8vO5DVYW-oM1jJKy3edQHVYsCLn9RVyxLuFborJmRmIgyFiCV4pJzxpOVHqJq-IBHKOqsBc8z3-a5j_a3lwGuYLTA=w200-h200',
                                                                width:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: double
                                                                      .maxFinite,
                                                                  desktop: double
                                                                      .maxFinite,
                                                                ),
                                                                height:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: 150,
                                                                  desktop: 150,
                                                                ),
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                  top: 6,
                                                                ),
                                                                child: Text(
                                                                    'सटर खाली',
                                                                    style: GoogleFonts
                                                                        .poppins(
                                                                      textStyle:
                                                                          TextStyle(
                                                                        color: Color(0xFF000000)
                                                                            .withOpacity(1),
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        fontSize:
                                                                            getValueForScreenType<double>(
                                                                          context:
                                                                              context,
                                                                          mobile:
                                                                              15,
                                                                          tablet:
                                                                              16,
                                                                          desktop:
                                                                              16,
                                                                        ),
                                                                        fontStyle:
                                                                            FontStyle.normal,
                                                                        decoration:
                                                                            TextDecoration.none,
                                                                      ),
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    textDirection:
                                                                        TextDirection
                                                                            .ltr,
                                                                    maxLines:
                                                                        2)),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                AnimationConfiguration
                                                    .staggeredList(
                                                  position: 2,
                                                  duration: Duration(
                                                    milliseconds: 800,
                                                  ),
                                                  child: FadeInAnimation(
                                                    child: SlideAnimation(
                                                      child: BouncingWidget(
                                                        onPressed: () async {},
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    100),
                                                        scaleFactor: 1.5,
                                                        child: Column(
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .zero,
                                                              child:
                                                                  Image.network(
                                                                'https://blogger.googleusercontent.com/img/a/AVvXsEiIS6Sw7uZMcSroSMY-4JsRpX55Z75TnPcFv3g4KnGFodgEFUEo7vexiCFDxgvGzh6VCP-d_OaWmNwAyWWMNA1FEWho6wA1WjuJiN7JDqCYGaoyUUL3eNKoN9wNo5I4iSeJV9N4nVIcYMov8PrDtNk_KRiDaJrHhE9eT3cMMw-N3SpHjq_JNgUgEfhi2Q=w200-h200',
                                                                width:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: double
                                                                      .maxFinite,
                                                                  desktop: double
                                                                      .maxFinite,
                                                                ),
                                                                height:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: 150,
                                                                  desktop: 150,
                                                                ),
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                  top: 6,
                                                                ),
                                                                child: Text(
                                                                    '''मोटर /स्कुटी
साइकल''',
                                                                    style: GoogleFonts
                                                                        .poppins(
                                                                      textStyle:
                                                                          TextStyle(
                                                                        color: Color(0xFF000000)
                                                                            .withOpacity(1),
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        fontSize:
                                                                            getValueForScreenType<double>(
                                                                          context:
                                                                              context,
                                                                          mobile:
                                                                              15,
                                                                          tablet:
                                                                              16,
                                                                          desktop:
                                                                              16,
                                                                        ),
                                                                        fontStyle:
                                                                            FontStyle.normal,
                                                                        decoration:
                                                                            TextDecoration.none,
                                                                      ),
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    textDirection:
                                                                        TextDirection
                                                                            .ltr,
                                                                    maxLines:
                                                                        2)),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                AnimationConfiguration
                                                    .staggeredList(
                                                  position: 3,
                                                  duration: Duration(
                                                    milliseconds: 800,
                                                  ),
                                                  child: FadeInAnimation(
                                                    child: SlideAnimation(
                                                      child: BouncingWidget(
                                                        onPressed: () async {},
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    100),
                                                        scaleFactor: 1.5,
                                                        child: Column(
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .zero,
                                                              child:
                                                                  Image.network(
                                                                'https://blogger.googleusercontent.com/img/a/AVvXsEiIcTm-4EadiFp38d8y2NzU0aB5Q2tId5Maop-pbe83ONRi-8CaIbfE8bt7GjyF5ywZY0GKSm1EARPWFtt-2TBp7p-wFeq77zt4TWOD1gvCcXxa-vKky_qNH0bCXp3QavOOfp9504wEdHshOsjypXMZ_6e864nAhCKokP7XFaqroGV1HEePLc5_K9vMiw=w200-h200',
                                                                width:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: double
                                                                      .maxFinite,
                                                                  desktop: double
                                                                      .maxFinite,
                                                                ),
                                                                height:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: 150,
                                                                  desktop: 150,
                                                                ),
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                  top: 6,
                                                                ),
                                                                child: Text(
                                                                    '''कम्पुटर
ल्यापटप''',
                                                                    style: GoogleFonts
                                                                        .poppins(
                                                                      textStyle:
                                                                          TextStyle(
                                                                        color: Color(0xFF000000)
                                                                            .withOpacity(1),
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        fontSize:
                                                                            getValueForScreenType<double>(
                                                                          context:
                                                                              context,
                                                                          mobile:
                                                                              15,
                                                                          tablet:
                                                                              16,
                                                                          desktop:
                                                                              16,
                                                                        ),
                                                                        fontStyle:
                                                                            FontStyle.normal,
                                                                        decoration:
                                                                            TextDecoration.none,
                                                                      ),
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    textDirection:
                                                                        TextDirection
                                                                            .ltr,
                                                                    maxLines:
                                                                        2)),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                AnimationConfiguration
                                                    .staggeredList(
                                                  position: 4,
                                                  duration: Duration(
                                                    milliseconds: 800,
                                                  ),
                                                  child: FadeInAnimation(
                                                    child: SlideAnimation(
                                                      child: BouncingWidget(
                                                        onPressed: () async {},
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    100),
                                                        scaleFactor: 1.5,
                                                        child: Column(
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .zero,
                                                              child:
                                                                  Image.network(
                                                                'https://blogger.googleusercontent.com/img/a/AVvXsEg9YA44cHy0tuzHbE4DbcG7OIae9qXuN-GlHYorseSUbD27YhzPAOkcxQB6xlVbpbGz21zFFZeT1XYOm8RJb7SdCeZO7hYnSqqf97FzhwFmICXAomgq4DozbF_drB8FcT-Xdk2V_uOAYrElf6wUmiQ5nGh7Jw_UuaXjK0bTk-dwA9Mn6wxGmwBzHV-aCQ=w200-h200',
                                                                width:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: double
                                                                      .maxFinite,
                                                                  desktop: double
                                                                      .maxFinite,
                                                                ),
                                                                height:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: 150,
                                                                  desktop: 150,
                                                                ),
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                  top: 6,
                                                                ),
                                                                child: Text(
                                                                    '''मोवाइल 
पेनड्राइभ''',
                                                                    style: GoogleFonts
                                                                        .poppins(
                                                                      textStyle:
                                                                          TextStyle(
                                                                        color: Color(0xFF000000)
                                                                            .withOpacity(1),
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        fontSize:
                                                                            getValueForScreenType<double>(
                                                                          context:
                                                                              context,
                                                                          mobile:
                                                                              15,
                                                                          tablet:
                                                                              16,
                                                                          desktop:
                                                                              16,
                                                                        ),
                                                                        fontStyle:
                                                                            FontStyle.normal,
                                                                        decoration:
                                                                            TextDecoration.none,
                                                                      ),
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    textDirection:
                                                                        TextDirection
                                                                            .ltr,
                                                                    maxLines:
                                                                        2)),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ))),
                                  ],
                                )),
                          )),
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
                        mobile: 625,
                        tablet: null,
                        desktop: null,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: <Color>[
                            Color(0xFF6ACEFF).withOpacity(0),
                            Color(0xFFFFFFFF).withOpacity(1)
                          ],
                          stops: [0, 0.5],
                        ),
                        borderRadius: getValueForScreenType<BorderRadius>(
                          context: context,
                          mobile: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                          tablet: BorderRadius.zero,
                          desktop: BorderRadius.zero,
                        ),
                      ),
                      child: Padding(
                          padding: getValueForScreenType<EdgeInsets>(
                            context: context,
                            mobile: EdgeInsets.zero,
                            tablet: const EdgeInsets.only(
                              left: 2,
                            ),
                            desktop: const EdgeInsets.only(
                              left: 2,
                            ),
                          ),
                          child: SizedBox(
                            width: double.maxFinite,
                            height: getValueForScreenType<double?>(
                              context: context,
                              mobile: 530,
                              tablet: 150,
                              desktop: 150,
                            ),
                            child: Padding(
                                padding: getValueForScreenType<EdgeInsets>(
                                  context: context,
                                  mobile: EdgeInsets.zero,
                                  tablet: const EdgeInsets.only(
                                    left: 4,
                                  ),
                                  desktop: const EdgeInsets.only(
                                    left: 4,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding:
                                            getValueForScreenType<EdgeInsets>(
                                          context: context,
                                          mobile: EdgeInsets.zero,
                                          tablet: const EdgeInsets.only(
                                            right: 6,
                                          ),
                                          desktop: const EdgeInsets.only(
                                            right: 6,
                                          ),
                                        ),
                                        child: SizedBox(
                                          width: double.maxFinite,
                                          height:
                                              getValueForScreenType<double?>(
                                            context: context,
                                            mobile: 210,
                                            tablet: 150,
                                            desktop: 150,
                                          ),
                                          child: NotificationListener<
                                              ScrollEndNotification>(
                                            onNotification: (final scrollEnd) {
                                              final metrics = scrollEnd.metrics;
                                              if (metrics.atEdge) {
                                                final isTop =
                                                    metrics.pixels == 0;
                                                if (isTop) {
                                                } else {}
                                              }
                                              return true;
                                            },
                                            child: ListView(
                                              reverse: false,
                                              primary: true,
                                              physics:
                                                  const AlwaysScrollableScrollPhysics(),
                                              scrollDirection: Axis.horizontal,
                                              children: [
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile:
                                                          const EdgeInsets.only(
                                                        left: 6,
                                                        right: 6,
                                                      ),
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        right: 6,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        right: 6,
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
                                                                  20),
                                                          topRight:
                                                              Radius.circular(
                                                                  20),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  20),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  20),
                                                        ),
                                                        tablet:
                                                            BorderRadius.zero,
                                                        desktop:
                                                            BorderRadius.zero,
                                                      ),
                                                      child: Image.network(
                                                        'https://blogger.googleusercontent.com/img/a/AVvXsEglbUzNwcRD2EoFpZcWEfQQLj5Ow5Nn7GObZO2ZeoBrwY_Gs1HT8VKDY1y7rxkmfRSCNU5jkhGNFjf9sbShYbOJcau7kCITYISLbJs2seGgdH1G-nJ2MczYC24N7xQJHXUuz2e8KH4mnPJWWDE-a8Dfb7Xedi5N7eFlBWyLNrz2l6g3u9ZRts7E9ANUog=w640-h360',
                                                        width:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 370,
                                                          tablet:
                                                              double.maxFinite,
                                                          desktop:
                                                              double.maxFinite,
                                                        ),
                                                        height:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 210,
                                                          tablet: 150,
                                                          desktop: 150,
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    )),
                                                Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      right: 6,
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
                                                                  20),
                                                          topRight:
                                                              Radius.circular(
                                                                  20),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  20),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  20),
                                                        ),
                                                        tablet:
                                                            BorderRadius.zero,
                                                        desktop:
                                                            BorderRadius.zero,
                                                      ),
                                                      child: Image.network(
                                                        'https://blogger.googleusercontent.com/img/a/AVvXsEh5EvIIKfZIGZ36b0rEdJVuQJ21XCQDhiqIDL92h5pi6vztcKlC9W8eo56Otre5w-8X1MHItg1XEkywzB8jET4CSykfk3Pxq2FMEsolz7uS9TiPYJW19Vk8KZGwnRyRz-CuSDwpk2wKmy59DsKP2hPmIS6vNGOwrXT2f3956FJ0fjhVR85alTBHzpKG5A=w640-h360',
                                                        width:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 370,
                                                          tablet:
                                                              double.maxFinite,
                                                          desktop:
                                                              double.maxFinite,
                                                        ),
                                                        height:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 210,
                                                          tablet: 150,
                                                          desktop: 150,
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    )),
                                                Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      right: 6,
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
                                                                  20),
                                                          topRight:
                                                              Radius.circular(
                                                                  20),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  20),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  20),
                                                        ),
                                                        tablet:
                                                            BorderRadius.zero,
                                                        desktop:
                                                            BorderRadius.zero,
                                                      ),
                                                      child: Image.network(
                                                        'https://blogger.googleusercontent.com/img/a/AVvXsEgPuRDSVVozzX5doEQDuqzoQaeN4wClA-gQaL-iNJnerEHiDdIjH4tjyHU2Q2-l4M5BrS75QCXHxvsGlAL1q4jtiFCP37wfRCAe8F30ksOJNq-akedhermpMj142wW8bt1z3x9b8Ht76LB0mJta0TiDwM5seOAgumIQVyH2_Sw_gm7cNhdkF-KXPaP6Hg=w640-h360',
                                                        width:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 370,
                                                          tablet:
                                                              double.maxFinite,
                                                          desktop:
                                                              double.maxFinite,
                                                        ),
                                                        height:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 210,
                                                          tablet: 150,
                                                          desktop: 150,
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    )),
                                              ],
                                            ),
                                          ),
                                        )),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                          left: 6,
                                          right: 6,
                                        ),
                                        child: Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: const EdgeInsets.only(
                                                top: 15,
                                                bottom: 10,
                                              ),
                                              tablet: const EdgeInsets.only(
                                                top: 1,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                top: 1,
                                              ),
                                            ),
                                            child: Text('मन्थली बजार',
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    color: Color(0xFF000000)
                                                        .withOpacity(1),
                                                    fontWeight: FontWeight.w700,
                                                    fontSize:
                                                        getValueForScreenType<
                                                            double>(
                                                      context: context,
                                                      mobile: 20,
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
                                                maxLines: 1))),
                                    Padding(
                                        padding:
                                            getValueForScreenType<EdgeInsets>(
                                          context: context,
                                          mobile: const EdgeInsets.only(
                                            left: 6,
                                            right: 6,
                                          ),
                                          tablet: const EdgeInsets.only(
                                            left: 6,
                                          ),
                                          desktop: const EdgeInsets.only(
                                            left: 6,
                                          ),
                                        ),
                                        child: Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: EdgeInsets.zero,
                                              tablet: const EdgeInsets.only(
                                                top: 6,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                top: 6,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                AnimationConfiguration
                                                    .staggeredList(
                                                  position: 1,
                                                  duration: Duration(
                                                    milliseconds: 800,
                                                  ),
                                                  child: FadeInAnimation(
                                                    child: SlideAnimation(
                                                      child: BouncingWidget(
                                                        onPressed: () async {
                                                          await Navigator.push<
                                                              void>(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  PageMakenewpagecopypest(),
                                                            ),
                                                          );
                                                        },
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    100),
                                                        scaleFactor: 1.5,
                                                        child: Column(
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .zero,
                                                              child:
                                                                  Image.network(
                                                                'https://blogger.googleusercontent.com/img/a/AVvXsEiZnNIcSFIyk9WMkKLQ1rUBLgMl7MReHy13E_ykLM3KdKDvtDCTtufweTUHlHF_d_uqMf8uB4zmNXe9H3pqCl1xh7icycSzk9KcPjhYizkT0cCZidXaewz3hd1BiqQ2o2zbJK3dtzGQlCeb-i4w4GnZOqxraLMGDMgrlLn5vdhrf_EA0LH3um4j8baC8w=w200-h200',
                                                                width:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: double
                                                                      .maxFinite,
                                                                  desktop: double
                                                                      .maxFinite,
                                                                ),
                                                                height:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: 150,
                                                                  desktop: 150,
                                                                ),
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                  top: 6,
                                                                ),
                                                                child: Text(
                                                                    'होटल',
                                                                    style: GoogleFonts
                                                                        .poppins(
                                                                      textStyle:
                                                                          TextStyle(
                                                                        color: Color(0xFF000000)
                                                                            .withOpacity(1),
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        fontSize:
                                                                            getValueForScreenType<double>(
                                                                          context:
                                                                              context,
                                                                          mobile:
                                                                              15,
                                                                          tablet:
                                                                              16,
                                                                          desktop:
                                                                              16,
                                                                        ),
                                                                        fontStyle:
                                                                            FontStyle.normal,
                                                                        decoration:
                                                                            TextDecoration.none,
                                                                      ),
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    textDirection:
                                                                        TextDirection
                                                                            .ltr,
                                                                    maxLines:
                                                                        2)),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                AnimationConfiguration
                                                    .staggeredList(
                                                  position: 2,
                                                  duration: Duration(
                                                    milliseconds: 800,
                                                  ),
                                                  child: FadeInAnimation(
                                                    child: SlideAnimation(
                                                      child: BouncingWidget(
                                                        onPressed: () async {},
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    100),
                                                        scaleFactor: 1.5,
                                                        child: Column(
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .zero,
                                                              child:
                                                                  Image.network(
                                                                'https://blogger.googleusercontent.com/img/a/AVvXsEi6UcYE918Ej3Y0UOk18fgdan9bPxwa46NMRTOX0OZ0lI9K4WQjJM48Q40YCkkOF77O5vZnNME2vvDDwwOJowPvTmkgO3Gi2ARBhAsHTP9tjHWJky0zUnVyCxE5j0ElRDM7rB2k97oK2Y3-8p5nDrzjRgvt6qGE5SKOrWcUnast1JIv765vzutYEtKQ3g=w200-h200',
                                                                width:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: double
                                                                      .maxFinite,
                                                                  desktop: double
                                                                      .maxFinite,
                                                                ),
                                                                height:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: 150,
                                                                  desktop: 150,
                                                                ),
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                  top: 6,
                                                                ),
                                                                child: Text(
                                                                    'हार्डवेयर ',
                                                                    style: GoogleFonts
                                                                        .poppins(
                                                                      textStyle:
                                                                          TextStyle(
                                                                        color: Color(0xFF000000)
                                                                            .withOpacity(1),
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        fontSize:
                                                                            getValueForScreenType<double>(
                                                                          context:
                                                                              context,
                                                                          mobile:
                                                                              15,
                                                                          tablet:
                                                                              16,
                                                                          desktop:
                                                                              16,
                                                                        ),
                                                                        fontStyle:
                                                                            FontStyle.normal,
                                                                        decoration:
                                                                            TextDecoration.none,
                                                                      ),
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    textDirection:
                                                                        TextDirection
                                                                            .ltr,
                                                                    maxLines:
                                                                        2)),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                AnimationConfiguration
                                                    .staggeredList(
                                                  position: 3,
                                                  duration: Duration(
                                                    milliseconds: 800,
                                                  ),
                                                  child: FadeInAnimation(
                                                    child: SlideAnimation(
                                                      child: BouncingWidget(
                                                        onPressed: () async {},
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    100),
                                                        scaleFactor: 1.5,
                                                        child: Column(
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .zero,
                                                              child:
                                                                  Image.network(
                                                                'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEikVdzRrbPaBEyaqqtdkTHMGoLdpTiTU0kccCVtpuEFl_5DnYPE1tsjFcVoD4LQMsdtF8bLt00_ph5NOLOBRdXvYOZfghW-CorNiRkrALgxEmu3JEPqV-gEkZzvnyIQJAtrovcN_opxHNtXoQnKybTetXOeVxeIeWLhVrsMtmki1VXUv4XE1qrb1KXHhg/w200-h200/Beauty%20Parlur.png',
                                                                width:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: double
                                                                      .maxFinite,
                                                                  desktop: double
                                                                      .maxFinite,
                                                                ),
                                                                height:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: 150,
                                                                  desktop: 150,
                                                                ),
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                  top: 6,
                                                                ),
                                                                child: Text(
                                                                    'ब्युटीपार्लर',
                                                                    style: GoogleFonts
                                                                        .poppins(
                                                                      textStyle:
                                                                          TextStyle(
                                                                        color: Color(0xFF000000)
                                                                            .withOpacity(1),
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        fontSize:
                                                                            getValueForScreenType<double>(
                                                                          context:
                                                                              context,
                                                                          mobile:
                                                                              15,
                                                                          tablet:
                                                                              16,
                                                                          desktop:
                                                                              16,
                                                                        ),
                                                                        fontStyle:
                                                                            FontStyle.normal,
                                                                        decoration:
                                                                            TextDecoration.none,
                                                                      ),
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    textDirection:
                                                                        TextDirection
                                                                            .ltr,
                                                                    maxLines:
                                                                        2)),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                AnimationConfiguration
                                                    .staggeredList(
                                                  position: 4,
                                                  duration: Duration(
                                                    milliseconds: 800,
                                                  ),
                                                  child: FadeInAnimation(
                                                    child: SlideAnimation(
                                                      child: BouncingWidget(
                                                        onPressed: () async {},
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    100),
                                                        scaleFactor: 1.5,
                                                        child: Column(
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .zero,
                                                              child:
                                                                  Image.network(
                                                                'https://blogger.googleusercontent.com/img/a/AVvXsEgNoxTY0EE5YCLdatlS4_a35g1zzPOZxyefOwmSWQxG93SI_DbBlq88Kc2ckTveNbvw3IDOwgR0qHiXMX9OKtHQLIqyfgkBvPy-1bRwWfIUMsYbdfcUGoHLpv9u8Zl1TO7tHYPytdnLfISPRFFMi8m4BTMJ8JiHZBMmvLIZTFSvrwXT19QmGGCnirMgFg=w200-h200',
                                                                width:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: double
                                                                      .maxFinite,
                                                                  desktop: double
                                                                      .maxFinite,
                                                                ),
                                                                height:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: 150,
                                                                  desktop: 150,
                                                                ),
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                  top: 6,
                                                                ),
                                                                child: Text(
                                                                    'सुन पसल',
                                                                    style: GoogleFonts
                                                                        .poppins(
                                                                      textStyle:
                                                                          TextStyle(
                                                                        color: Color(0xFF000000)
                                                                            .withOpacity(1),
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        fontSize:
                                                                            getValueForScreenType<double>(
                                                                          context:
                                                                              context,
                                                                          mobile:
                                                                              15,
                                                                          tablet:
                                                                              16,
                                                                          desktop:
                                                                              16,
                                                                        ),
                                                                        fontStyle:
                                                                            FontStyle.normal,
                                                                        decoration:
                                                                            TextDecoration.none,
                                                                      ),
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    textDirection:
                                                                        TextDirection
                                                                            .ltr,
                                                                    maxLines:
                                                                        2)),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ))),
                                    Padding(
                                        padding:
                                            getValueForScreenType<EdgeInsets>(
                                          context: context,
                                          mobile: const EdgeInsets.only(
                                            left: 6,
                                            top: 10,
                                            right: 6,
                                          ),
                                          tablet: const EdgeInsets.only(
                                            top: 5,
                                          ),
                                          desktop: const EdgeInsets.only(
                                            top: 5,
                                          ),
                                        ),
                                        child: Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: EdgeInsets.zero,
                                              tablet: const EdgeInsets.only(
                                                top: 6,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                top: 6,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                AnimationConfiguration
                                                    .staggeredList(
                                                  position: 1,
                                                  duration: Duration(
                                                    milliseconds: 800,
                                                  ),
                                                  child: FadeInAnimation(
                                                    child: SlideAnimation(
                                                      child: BouncingWidget(
                                                        onPressed: () async {
                                                          await Navigator.push<
                                                              void>(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  PageMakenewpagecopypest(),
                                                            ),
                                                          );
                                                        },
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    100),
                                                        scaleFactor: 1.5,
                                                        child: Column(
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .zero,
                                                              child:
                                                                  Image.network(
                                                                'https://blogger.googleusercontent.com/img/a/AVvXsEgIBqIG0gPGzmVmnAOlbQ34AfZxUxExkBOPWHO0rsJNmOH52uUCzG5jLQ4iGuvokaU8o3kBj2ZzRtKV1RfMvIw90eSzHth9yISJIDB8trsfVW897T3Vfr5y5SOhY0fnfUrz7qRYo1Sbgo04f_Bp3RvgvlahMnAdB19a82HaAnZTi_yDkU_Bj5dnvudpRg=w200-h200',
                                                                width:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: double
                                                                      .maxFinite,
                                                                  desktop: double
                                                                      .maxFinite,
                                                                ),
                                                                height:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: 150,
                                                                  desktop: 150,
                                                                ),
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                  top: 6,
                                                                ),
                                                                child: Text(
                                                                    'पुस्तक पसल',
                                                                    style: GoogleFonts
                                                                        .poppins(
                                                                      textStyle:
                                                                          TextStyle(
                                                                        color: Color(0xFF000000)
                                                                            .withOpacity(1),
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        fontSize:
                                                                            getValueForScreenType<double>(
                                                                          context:
                                                                              context,
                                                                          mobile:
                                                                              15,
                                                                          tablet:
                                                                              16,
                                                                          desktop:
                                                                              16,
                                                                        ),
                                                                        fontStyle:
                                                                            FontStyle.normal,
                                                                        decoration:
                                                                            TextDecoration.none,
                                                                      ),
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    textDirection:
                                                                        TextDirection
                                                                            .ltr,
                                                                    maxLines:
                                                                        2)),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                AnimationConfiguration
                                                    .staggeredList(
                                                  position: 2,
                                                  duration: Duration(
                                                    milliseconds: 800,
                                                  ),
                                                  child: FadeInAnimation(
                                                    child: SlideAnimation(
                                                      child: BouncingWidget(
                                                        onPressed: () async {},
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    100),
                                                        scaleFactor: 1.5,
                                                        child: Column(
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .zero,
                                                              child:
                                                                  Image.network(
                                                                'https://blogger.googleusercontent.com/img/a/AVvXsEhrs-OAFY8Ag-MPS5rU2LKEJ0_gWBDYTH9umCmSV0ry3hw7THqeixG_qhiyrGrqnm-noGhygoPa3FknOcOoXEKFlAjcNNxowj1C6skVvm9lt799qlgvne7v9e-dsAKASUMihodC6xWwjjrUhMWOJ6PG8tgRL007qCUDj7LsFsMpn3OwPMYUPfa-80u4Qw=w200-h200',
                                                                width:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: double
                                                                      .maxFinite,
                                                                  desktop: double
                                                                      .maxFinite,
                                                                ),
                                                                height:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: 150,
                                                                  desktop: 150,
                                                                ),
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                  top: 6,
                                                                ),
                                                                child: Text(
                                                                    'मोटर  रिपेरिंग',
                                                                    style: GoogleFonts
                                                                        .poppins(
                                                                      textStyle:
                                                                          TextStyle(
                                                                        color: Color(0xFF000000)
                                                                            .withOpacity(1),
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        fontSize:
                                                                            getValueForScreenType<double>(
                                                                          context:
                                                                              context,
                                                                          mobile:
                                                                              15,
                                                                          tablet:
                                                                              16,
                                                                          desktop:
                                                                              16,
                                                                        ),
                                                                        fontStyle:
                                                                            FontStyle.normal,
                                                                        decoration:
                                                                            TextDecoration.none,
                                                                      ),
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    textDirection:
                                                                        TextDirection
                                                                            .ltr,
                                                                    maxLines:
                                                                        2)),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                AnimationConfiguration
                                                    .staggeredList(
                                                  position: 3,
                                                  duration: Duration(
                                                    milliseconds: 800,
                                                  ),
                                                  child: FadeInAnimation(
                                                    child: SlideAnimation(
                                                      child: BouncingWidget(
                                                        onPressed: () async {},
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    100),
                                                        scaleFactor: 1.5,
                                                        child: Column(
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .zero,
                                                              child:
                                                                  Image.network(
                                                                'https://blogger.googleusercontent.com/img/a/AVvXsEhBurzW60PjosXKP8_A4BH_gCAH3RDIY8-7r2QiXfSIpHMDkbXYTyqjythf5z5haxkQ-VyITP9Hp_f4724Y0Ko27ebBKhOa-210o1NRJEfp5VDdIztf_MEiiYDAR_-0CtfL2gChqtDBeHYpjm2cHZUC9HYbiAqazuWJ1Ur7llvH-r8MFQCzamXcG3A3HA=w200-h200',
                                                                width:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: double
                                                                      .maxFinite,
                                                                  desktop: double
                                                                      .maxFinite,
                                                                ),
                                                                height:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: 150,
                                                                  desktop: 150,
                                                                ),
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                  top: 6,
                                                                ),
                                                                child: Text(
                                                                    'हेयेरकट',
                                                                    style: GoogleFonts
                                                                        .poppins(
                                                                      textStyle:
                                                                          TextStyle(
                                                                        color: Color(0xFF000000)
                                                                            .withOpacity(1),
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        fontSize:
                                                                            getValueForScreenType<double>(
                                                                          context:
                                                                              context,
                                                                          mobile:
                                                                              15,
                                                                          tablet:
                                                                              16,
                                                                          desktop:
                                                                              16,
                                                                        ),
                                                                        fontStyle:
                                                                            FontStyle.normal,
                                                                        decoration:
                                                                            TextDecoration.none,
                                                                      ),
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    textDirection:
                                                                        TextDirection
                                                                            .ltr,
                                                                    maxLines:
                                                                        2)),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                AnimationConfiguration
                                                    .staggeredList(
                                                  position: 4,
                                                  duration: Duration(
                                                    milliseconds: 800,
                                                  ),
                                                  child: FadeInAnimation(
                                                    child: SlideAnimation(
                                                      child: BouncingWidget(
                                                        onPressed: () async {},
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    100),
                                                        scaleFactor: 1.5,
                                                        child: Column(
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .zero,
                                                              child:
                                                                  Image.network(
                                                                'https://blogger.googleusercontent.com/img/a/AVvXsEg7RRLP2xBUDG5NBsb8w3tJbR9zld1zoodCqbeV_Gb_dPcdmYHBW4q9RHZwYCfMMtCJaAhI30MXh0Z9kxSH6vgu1LfOt2IBu7H4ga3qkvPuQX91ITVru6UvQfOTOeI43eaYSpJKIPDibLUNWqwYqNHPB_oqLCmXVV5Cakn-Ju0c4xfSAM5HzKV8LshYkA=w200-h200',
                                                                width:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: double
                                                                      .maxFinite,
                                                                  desktop: double
                                                                      .maxFinite,
                                                                ),
                                                                height:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: 150,
                                                                  desktop: 150,
                                                                ),
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                  top: 6,
                                                                ),
                                                                child: Text(
                                                                    'टेलर',
                                                                    style: GoogleFonts
                                                                        .poppins(
                                                                      textStyle:
                                                                          TextStyle(
                                                                        color: Color(0xFF000000)
                                                                            .withOpacity(1),
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        fontSize:
                                                                            getValueForScreenType<double>(
                                                                          context:
                                                                              context,
                                                                          mobile:
                                                                              15,
                                                                          tablet:
                                                                              16,
                                                                          desktop:
                                                                              16,
                                                                        ),
                                                                        fontStyle:
                                                                            FontStyle.normal,
                                                                        decoration:
                                                                            TextDecoration.none,
                                                                      ),
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    textDirection:
                                                                        TextDirection
                                                                            .ltr,
                                                                    maxLines:
                                                                        2)),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ))),
                                    Padding(
                                        padding:
                                            getValueForScreenType<EdgeInsets>(
                                          context: context,
                                          mobile: const EdgeInsets.only(
                                            left: 6,
                                            top: 10,
                                            right: 6,
                                          ),
                                          tablet: const EdgeInsets.only(
                                            top: 5,
                                          ),
                                          desktop: const EdgeInsets.only(
                                            top: 5,
                                          ),
                                        ),
                                        child: Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: EdgeInsets.zero,
                                              tablet: const EdgeInsets.only(
                                                top: 6,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                top: 6,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                AnimationConfiguration
                                                    .staggeredList(
                                                  position: 1,
                                                  duration: Duration(
                                                    milliseconds: 800,
                                                  ),
                                                  child: FadeInAnimation(
                                                    child: SlideAnimation(
                                                      child: BouncingWidget(
                                                        onPressed: () async {
                                                          await Navigator.push<
                                                              void>(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  PageMakenewpagecopypest(),
                                                            ),
                                                          );
                                                        },
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    100),
                                                        scaleFactor: 1.5,
                                                        child: Column(
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .zero,
                                                              child:
                                                                  Image.network(
                                                                'https://blogger.googleusercontent.com/img/a/AVvXsEhbisgIKDrHWse61x1TfR5zQbqFVQ8noJLf57vacW3JJJdlN2YBpWYUGYw5-2RRnO7jjsPjJqJk4PtJXXCdsT1kzur6lCx6TGKl--7SErzA577oX9qvHSpQiFxhruo1QvLKUkg17H9HSx3Eohgo1q-iPftrqJk9LayjGkPdK9DaOKjZSnPKmnmrcf-HdA=w200-h200',
                                                                width:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: double
                                                                      .maxFinite,
                                                                  desktop: double
                                                                      .maxFinite,
                                                                ),
                                                                height:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: 150,
                                                                  desktop: 150,
                                                                ),
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                  top: 6,
                                                                ),
                                                                child: Text(
                                                                    'यातायात',
                                                                    style: GoogleFonts
                                                                        .poppins(
                                                                      textStyle:
                                                                          TextStyle(
                                                                        color: Color(0xFF000000)
                                                                            .withOpacity(1),
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        fontSize:
                                                                            getValueForScreenType<double>(
                                                                          context:
                                                                              context,
                                                                          mobile:
                                                                              15,
                                                                          tablet:
                                                                              16,
                                                                          desktop:
                                                                              16,
                                                                        ),
                                                                        fontStyle:
                                                                            FontStyle.normal,
                                                                        decoration:
                                                                            TextDecoration.none,
                                                                      ),
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    textDirection:
                                                                        TextDirection
                                                                            .ltr,
                                                                    maxLines:
                                                                        2)),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                AnimationConfiguration
                                                    .staggeredList(
                                                  position: 2,
                                                  duration: Duration(
                                                    milliseconds: 800,
                                                  ),
                                                  child: FadeInAnimation(
                                                    child: SlideAnimation(
                                                      child: BouncingWidget(
                                                        onPressed: () async {},
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    100),
                                                        scaleFactor: 1.5,
                                                        child: Column(
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .zero,
                                                              child:
                                                                  Image.network(
                                                                'https://blogger.googleusercontent.com/img/a/AVvXsEjjzJQ4oqg6-lVaYPeCVkhzxeQwg_svAh5NriAiINXOMn72PzC7Cnc8vYztUiZ1F-pK8-fBD1t8xPrtAEiYiwefwIZxwB73QRvK5CKosb4D5RBKVKD4tCDcBUlC38xenta1a2NLw34ZIkdNDcn-0pWerQXMKBx6a1rtflmfvIo1jkhu4tNj7raqj3mJ1g=w200-h200',
                                                                width:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: double
                                                                      .maxFinite,
                                                                  desktop: double
                                                                      .maxFinite,
                                                                ),
                                                                height:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: 150,
                                                                  desktop: 150,
                                                                ),
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                  top: 6,
                                                                ),
                                                                child: Text(
                                                                    'मासु पसल',
                                                                    style: GoogleFonts
                                                                        .poppins(
                                                                      textStyle:
                                                                          TextStyle(
                                                                        color: Color(0xFF000000)
                                                                            .withOpacity(1),
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        fontSize:
                                                                            getValueForScreenType<double>(
                                                                          context:
                                                                              context,
                                                                          mobile:
                                                                              15,
                                                                          tablet:
                                                                              16,
                                                                          desktop:
                                                                              16,
                                                                        ),
                                                                        fontStyle:
                                                                            FontStyle.normal,
                                                                        decoration:
                                                                            TextDecoration.none,
                                                                      ),
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    textDirection:
                                                                        TextDirection
                                                                            .ltr,
                                                                    maxLines:
                                                                        2)),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                AnimationConfiguration
                                                    .staggeredList(
                                                  position: 3,
                                                  duration: Duration(
                                                    milliseconds: 800,
                                                  ),
                                                  child: FadeInAnimation(
                                                    child: SlideAnimation(
                                                      child: BouncingWidget(
                                                        onPressed: () async {},
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    100),
                                                        scaleFactor: 1.5,
                                                        child: Column(
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .zero,
                                                              child:
                                                                  Image.network(
                                                                'https://blogger.googleusercontent.com/img/a/AVvXsEi7XKoW7A0YDN_4UgC42p0Yv5DvJd20S5--4PUGtrmfholnojw7ooQGhojSil6fIanpiprvxjhdywzfjg35HJ_RB4Tr6WSGc0r42JRGu1gnGwmN37rOWouHfiXsQP0PMMGVCQtTkL6m-QPT8X7yJm-i9pkNGJaNktOuSa96cOV2q3g9GSHN3bCAeQV3Vw=w200-h200',
                                                                width:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: double
                                                                      .maxFinite,
                                                                  desktop: double
                                                                      .maxFinite,
                                                                ),
                                                                height:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: 150,
                                                                  desktop: 150,
                                                                ),
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                  top: 6,
                                                                ),
                                                                child: Text(
                                                                    'फर्निचर',
                                                                    style: GoogleFonts
                                                                        .poppins(
                                                                      textStyle:
                                                                          TextStyle(
                                                                        color: Color(0xFF000000)
                                                                            .withOpacity(1),
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        fontSize:
                                                                            getValueForScreenType<double>(
                                                                          context:
                                                                              context,
                                                                          mobile:
                                                                              15,
                                                                          tablet:
                                                                              16,
                                                                          desktop:
                                                                              16,
                                                                        ),
                                                                        fontStyle:
                                                                            FontStyle.normal,
                                                                        decoration:
                                                                            TextDecoration.none,
                                                                      ),
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    textDirection:
                                                                        TextDirection
                                                                            .ltr,
                                                                    maxLines:
                                                                        2)),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                AnimationConfiguration
                                                    .staggeredList(
                                                  position: 4,
                                                  duration: Duration(
                                                    milliseconds: 800,
                                                  ),
                                                  child: FadeInAnimation(
                                                    child: SlideAnimation(
                                                      child: BouncingWidget(
                                                        onPressed: () async {},
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    100),
                                                        scaleFactor: 1.5,
                                                        child: Column(
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .zero,
                                                              child:
                                                                  Image.network(
                                                                'https://blogger.googleusercontent.com/img/a/AVvXsEhWdZzH0vhu35V_FCNSyLpE7OUH3DapOaj3kT7zZ1z2iAoQD210oD5Ksg6aN3yB8ptb4Ez7u8gddT0I6CdhPHvi7dc_w6LCAZkvLb_YxFKNEfCPBhLlNLjPV7M9zUv6n9137gsuku8WbgMJB1jHOs2-p7O1-M3T38_DcLo8vbFjOoB1wzayjdfiUJ95jg=w200-h200',
                                                                width:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: double
                                                                      .maxFinite,
                                                                  desktop: double
                                                                      .maxFinite,
                                                                ),
                                                                height:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: 150,
                                                                  desktop: 150,
                                                                ),
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                  top: 6,
                                                                ),
                                                                child: Text(
                                                                    'अटो',
                                                                    style: GoogleFonts
                                                                        .poppins(
                                                                      textStyle:
                                                                          TextStyle(
                                                                        color: Color(0xFF000000)
                                                                            .withOpacity(1),
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        fontSize:
                                                                            getValueForScreenType<double>(
                                                                          context:
                                                                              context,
                                                                          mobile:
                                                                              15,
                                                                          tablet:
                                                                              16,
                                                                          desktop:
                                                                              16,
                                                                        ),
                                                                        fontStyle:
                                                                            FontStyle.normal,
                                                                        decoration:
                                                                            TextDecoration.none,
                                                                      ),
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    textDirection:
                                                                        TextDirection
                                                                            .ltr,
                                                                    maxLines:
                                                                        2)),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ))),
                                  ],
                                )),
                          )),
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
                        mobile: 200,
                        tablet: null,
                        desktop: null,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF).withOpacity(1),
                        borderRadius: getValueForScreenType<BorderRadius>(
                          context: context,
                          mobile: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                          tablet: BorderRadius.zero,
                          desktop: BorderRadius.zero,
                        ),
                      ),
                      child: SizedBox(
                        width: double.maxFinite,
                        height: getValueForScreenType<double?>(
                          context: context,
                          mobile: 200,
                          tablet: 150,
                          desktop: 150,
                        ),
                        child: Padding(
                            padding: const EdgeInsets.only(
                              top: 15,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: getValueForScreenType<EdgeInsets>(
                                      context: context,
                                      mobile: const EdgeInsets.only(
                                        left: 8,
                                        right: 8,
                                      ),
                                      tablet: const EdgeInsets.only(
                                        left: 6,
                                        right: 6,
                                      ),
                                      desktop: const EdgeInsets.only(
                                        left: 6,
                                        right: 6,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: EdgeInsets.zero,
                                              tablet: const EdgeInsets.only(
                                                left: 6,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                left: 6,
                                              ),
                                            ),
                                            child: Text('घरायसी सेवाहरु',
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    color: BlocProvider.of<
                                                            ThemeCubit>(context)
                                                        .getColor(
                                                            'Text / Primary'),
                                                    fontWeight: FontWeight.w700,
                                                    fontSize:
                                                        getValueForScreenType<
                                                            double>(
                                                      context: context,
                                                      mobile: 20,
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
                                        Icon(
                                          MdiIcons.fromString('arrow-right'),
                                          size: 24,
                                          color:
                                              Color(0xFF000000).withOpacity(1),
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: const EdgeInsets.only(
                                      top: 8,
                                    ),
                                    child: SizedBox(
                                      width: double.maxFinite,
                                      height: 150,
                                      child: NotificationListener<
                                          ScrollEndNotification>(
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
                                          physics:
                                              const AlwaysScrollableScrollPhysics(),
                                          scrollDirection: Axis.horizontal,
                                          children: [
                                            AnimationConfiguration
                                                .staggeredList(
                                              position: 1,
                                              duration: Duration(
                                                milliseconds: 800,
                                              ),
                                              child: FadeInAnimation(
                                                child: SlideAnimation(
                                                  child: BouncingWidget(
                                                    onPressed: () async {},
                                                    duration: const Duration(
                                                        milliseconds: 100),
                                                    scaleFactor: 1.5,
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          left: 8,
                                                        ),
                                                        child: Padding(
                                                            padding:
                                                                getValueForScreenType<
                                                                    EdgeInsets>(
                                                              context: context,
                                                              mobile:
                                                                  const EdgeInsets
                                                                      .only(
                                                                right: 6,
                                                              ),
                                                              tablet:
                                                                  const EdgeInsets
                                                                      .only(
                                                                right: 8,
                                                              ),
                                                              desktop:
                                                                  const EdgeInsets
                                                                      .only(
                                                                right: 8,
                                                              ),
                                                            ),
                                                            child: Column(
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      getValueForScreenType<
                                                                          BorderRadius>(
                                                                    context:
                                                                        context,
                                                                    mobile:
                                                                        BorderRadius
                                                                            .only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              12),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              12),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              12),
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              12),
                                                                    ),
                                                                    tablet:
                                                                        BorderRadius
                                                                            .zero,
                                                                    desktop:
                                                                        BorderRadius
                                                                            .zero,
                                                                  ),
                                                                  child: Image
                                                                      .network(
                                                                    'https://blogger.googleusercontent.com/img/a/AVvXsEi09N-kUBxrc2SoLWiBoM3gwm-kMM-kyGdApOhpdAfuvFdQCKwGjKYIIe92jSgEzQQxWqTRx5B4BdNOV-P9axrhQm06b1LdhxweM_CsZ9HhRTzMuvk4o7A6xiRBUEoKSs94s1n2Nx2Oafy-bGNWJy4Qt9PAfr4McXXos4319f0IzeWpZbatuNWcPUI0gw=w200-h200',
                                                                    width: getValueForScreenType<
                                                                        double?>(
                                                                      context:
                                                                          context,
                                                                      mobile:
                                                                          80,
                                                                      tablet: double
                                                                          .maxFinite,
                                                                      desktop:
                                                                          double
                                                                              .maxFinite,
                                                                    ),
                                                                    height: getValueForScreenType<
                                                                        double?>(
                                                                      context:
                                                                          context,
                                                                      mobile:
                                                                          80,
                                                                      tablet:
                                                                          150,
                                                                      desktop:
                                                                          150,
                                                                    ),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .only(
                                                                      top: 6,
                                                                    ),
                                                                    child: Text(
                                                                        '''बिजुली
मर्मत / जडान''',
                                                                        style: GoogleFonts
                                                                            .poppins(
                                                                          textStyle:
                                                                              TextStyle(
                                                                            color:
                                                                                Color(0xFF000000).withOpacity(1),
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                            fontSize:
                                                                                getValueForScreenType<double>(
                                                                              context: context,
                                                                              mobile: 15,
                                                                              tablet: 16,
                                                                              desktop: 16,
                                                                            ),
                                                                            fontStyle:
                                                                                FontStyle.normal,
                                                                            decoration:
                                                                                TextDecoration.none,
                                                                          ),
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign
                                                                                .center,
                                                                        textDirection:
                                                                            TextDirection
                                                                                .ltr,
                                                                        maxLines:
                                                                            2)),
                                                              ],
                                                            ))),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            AnimationConfiguration
                                                .staggeredList(
                                              position: 2,
                                              duration: Duration(
                                                milliseconds: 800,
                                              ),
                                              child: FadeInAnimation(
                                                child: SlideAnimation(
                                                  child: BouncingWidget(
                                                    onPressed: () async {},
                                                    duration: const Duration(
                                                        milliseconds: 100),
                                                    scaleFactor: 1.5,
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          left: 8,
                                                        ),
                                                        child: Padding(
                                                            padding:
                                                                getValueForScreenType<
                                                                    EdgeInsets>(
                                                              context: context,
                                                              mobile:
                                                                  const EdgeInsets
                                                                      .only(
                                                                right: 6,
                                                              ),
                                                              tablet:
                                                                  const EdgeInsets
                                                                      .only(
                                                                right: 8,
                                                              ),
                                                              desktop:
                                                                  const EdgeInsets
                                                                      .only(
                                                                right: 8,
                                                              ),
                                                            ),
                                                            child: Column(
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .zero,
                                                                  child: Image
                                                                      .network(
                                                                    'https://blogger.googleusercontent.com/img/a/AVvXsEhhpJYf2hCeqYqdLkpAevzkga1aQVSbZg0VYfM7v5amnG6Up-82xCCNhz83KeiAQI561D_wCVSeF3hc1LxGVfSJ2TnfDvYTOP1kEquWT53WpQGFNFUDoZvJB6YzOgvjd5HgM5NnZ8efOIwMF5voll8j-EnHRMqUZu3k8GEqt66uTi3Oi8mIxlXopCvosw=w200-h200',
                                                                    width: getValueForScreenType<
                                                                        double?>(
                                                                      context:
                                                                          context,
                                                                      mobile:
                                                                          80,
                                                                      tablet: double
                                                                          .maxFinite,
                                                                      desktop:
                                                                          double
                                                                              .maxFinite,
                                                                    ),
                                                                    height: getValueForScreenType<
                                                                        double?>(
                                                                      context:
                                                                          context,
                                                                      mobile:
                                                                          80,
                                                                      tablet:
                                                                          150,
                                                                      desktop:
                                                                          150,
                                                                    ),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .only(
                                                                      top: 6,
                                                                    ),
                                                                    child: Text(
                                                                        '''कुकर /  ग्यास
मर्मत''',
                                                                        style: GoogleFonts
                                                                            .poppins(
                                                                          textStyle:
                                                                              TextStyle(
                                                                            color:
                                                                                Color(0xFF000000).withOpacity(1),
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                            fontSize:
                                                                                getValueForScreenType<double>(
                                                                              context: context,
                                                                              mobile: 15,
                                                                              tablet: 16,
                                                                              desktop: 16,
                                                                            ),
                                                                            fontStyle:
                                                                                FontStyle.normal,
                                                                            decoration:
                                                                                TextDecoration.none,
                                                                          ),
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign
                                                                                .center,
                                                                        textDirection:
                                                                            TextDirection
                                                                                .ltr,
                                                                        maxLines:
                                                                            2)),
                                                              ],
                                                            ))),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            AnimationConfiguration
                                                .staggeredList(
                                              position: 3,
                                              duration: Duration(
                                                milliseconds: 800,
                                              ),
                                              child: FadeInAnimation(
                                                child: SlideAnimation(
                                                  child: BouncingWidget(
                                                    onPressed: () async {},
                                                    duration: const Duration(
                                                        milliseconds: 100),
                                                    scaleFactor: 1.5,
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          left: 8,
                                                        ),
                                                        child: Padding(
                                                            padding:
                                                                getValueForScreenType<
                                                                    EdgeInsets>(
                                                              context: context,
                                                              mobile:
                                                                  const EdgeInsets
                                                                      .only(
                                                                right: 6,
                                                              ),
                                                              tablet:
                                                                  const EdgeInsets
                                                                      .only(
                                                                right: 8,
                                                              ),
                                                              desktop:
                                                                  const EdgeInsets
                                                                      .only(
                                                                right: 8,
                                                              ),
                                                            ),
                                                            child: Column(
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .zero,
                                                                  child: Image
                                                                      .network(
                                                                    'https://blogger.googleusercontent.com/img/a/AVvXsEg0_imV2EM89HqYOgdPwV6vokgphpRLVmSjay1CtPosqhtvMBsE6Rj1OgqzhWOnXClPu7CCXpCMWeCBit5Fsmy4NKBjdR0yQePGBcV0xzbJl8LtK0jDfHqDZqVI6E1IaVGzHKij_uDNv9O62hIONr3Tgg2U6r6vF3y9vXcUZKXO_Nnj_u3spwX4D532gQ=w200-h200',
                                                                    width: getValueForScreenType<
                                                                        double?>(
                                                                      context:
                                                                          context,
                                                                      mobile:
                                                                          80,
                                                                      tablet: double
                                                                          .maxFinite,
                                                                      desktop:
                                                                          double
                                                                              .maxFinite,
                                                                    ),
                                                                    height: getValueForScreenType<
                                                                        double?>(
                                                                      context:
                                                                          context,
                                                                      mobile:
                                                                          80,
                                                                      tablet:
                                                                          150,
                                                                      desktop:
                                                                          150,
                                                                    ),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .only(
                                                                      top: 6,
                                                                    ),
                                                                    child: Text(
                                                                        'रङ लगाउने',
                                                                        style: GoogleFonts
                                                                            .poppins(
                                                                          textStyle:
                                                                              TextStyle(
                                                                            color:
                                                                                Color(0xFF000000).withOpacity(1),
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                            fontSize:
                                                                                getValueForScreenType<double>(
                                                                              context: context,
                                                                              mobile: 15,
                                                                              tablet: 16,
                                                                              desktop: 16,
                                                                            ),
                                                                            fontStyle:
                                                                                FontStyle.normal,
                                                                            decoration:
                                                                                TextDecoration.none,
                                                                          ),
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign
                                                                                .center,
                                                                        textDirection:
                                                                            TextDirection
                                                                                .ltr,
                                                                        maxLines:
                                                                            2)),
                                                              ],
                                                            ))),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            AnimationConfiguration
                                                .staggeredList(
                                              position: 4,
                                              duration: Duration(
                                                milliseconds: 800,
                                              ),
                                              child: FadeInAnimation(
                                                child: SlideAnimation(
                                                  child: BouncingWidget(
                                                    onPressed: () async {
                                                      await Navigator.push<
                                                          void>(
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
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          left: 8,
                                                        ),
                                                        child: Column(
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .zero,
                                                              child:
                                                                  Image.network(
                                                                'https://blogger.googleusercontent.com/img/a/AVvXsEicKCat_0qAXWJkgvqGTRISKgR84c7K0O_tQl2Vk7LHJSh2cBv771aOHMzJw83yfgjE1Woh_bWcwNgqbiVSYpd89GYIGrw7Q3kgyNgj9B9mtGhruhDFTg1-YAH0xNnWTHiFlM7Jkh7DyWwh_weWu-NjYImmKIOpERgAP8rto96riRDGBFlHoOOlV8lfOQ=w200-h200',
                                                                width:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: double
                                                                      .maxFinite,
                                                                  desktop: double
                                                                      .maxFinite,
                                                                ),
                                                                height:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: 150,
                                                                  desktop: 150,
                                                                ),
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                  top: 6,
                                                                ),
                                                                child: Text(
                                                                    'प्लास्टर',
                                                                    style: GoogleFonts
                                                                        .poppins(
                                                                      textStyle:
                                                                          TextStyle(
                                                                        color: Color(0xFF000000)
                                                                            .withOpacity(1),
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        fontSize:
                                                                            getValueForScreenType<double>(
                                                                          context:
                                                                              context,
                                                                          mobile:
                                                                              15,
                                                                          tablet:
                                                                              16,
                                                                          desktop:
                                                                              16,
                                                                        ),
                                                                        fontStyle:
                                                                            FontStyle.normal,
                                                                        decoration:
                                                                            TextDecoration.none,
                                                                      ),
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    textDirection:
                                                                        TextDirection
                                                                            .ltr,
                                                                    maxLines:
                                                                        2)),
                                                          ],
                                                        )),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            AnimationConfiguration
                                                .staggeredList(
                                              position: 5,
                                              duration: Duration(
                                                milliseconds: 800,
                                              ),
                                              child: FadeInAnimation(
                                                child: SlideAnimation(
                                                  child: BouncingWidget(
                                                    onPressed: () async {
                                                      await Navigator.push<
                                                          void>(
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
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          left: 8,
                                                        ),
                                                        child: Column(
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .zero,
                                                              child:
                                                                  Image.network(
                                                                'https://blogger.googleusercontent.com/img/a/AVvXsEgwKv8vzxNRCc4RttH95xKINiATB8ju-4KblnTkDw-BO6JsDyUivoHd7RvhNjBxHv3mxUp8PcaO48-HqZoMTiSZcjU9YdkTUPLBAIjmzhnghsTkRWTPWPq7aM_2oWnzrOfWrKG-UJxQxfpZOqfgG7Gv2CXC4d48pMvCA_kTd4nOp6sf2KlX9DoHyqSpcQ=w200-h200',
                                                                width:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: double
                                                                      .maxFinite,
                                                                  desktop: double
                                                                      .maxFinite,
                                                                ),
                                                                height:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: 150,
                                                                  desktop: 150,
                                                                ),
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                  top: 6,
                                                                ),
                                                                child: Text(
                                                                    '''पाइप जडान
तथा मर्मत''',
                                                                    style: GoogleFonts
                                                                        .poppins(
                                                                      textStyle:
                                                                          TextStyle(
                                                                        color: Color(0xFF000000)
                                                                            .withOpacity(1),
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        fontSize:
                                                                            getValueForScreenType<double>(
                                                                          context:
                                                                              context,
                                                                          mobile:
                                                                              15,
                                                                          tablet:
                                                                              16,
                                                                          desktop:
                                                                              16,
                                                                        ),
                                                                        fontStyle:
                                                                            FontStyle.normal,
                                                                        decoration:
                                                                            TextDecoration.none,
                                                                      ),
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    textDirection:
                                                                        TextDirection
                                                                            .ltr,
                                                                    maxLines:
                                                                        2)),
                                                          ],
                                                        )),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            AnimationConfiguration
                                                .staggeredList(
                                              position: 6,
                                              duration: Duration(
                                                milliseconds: 800,
                                              ),
                                              child: FadeInAnimation(
                                                child: SlideAnimation(
                                                  child: BouncingWidget(
                                                    onPressed: () async {
                                                      await Navigator.push<
                                                          void>(
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
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          left: 8,
                                                        ),
                                                        child: Column(
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .zero,
                                                              child:
                                                                  Image.network(
                                                                'https://blogger.googleusercontent.com/img/a/AVvXsEiUjoFjeZw5BaiqiV25lTqaWVgXu3koA9bSqV6Uq9M-ElTmBqwdywhmC7nFDIr8_gbzT1BNx2yEe0CUYjpLKudqoHznhyT6fF-bfVZqLx9ofiDmo_7KIPCJLpuBh9bPNxO3ht_JfiQ5GdMHgK3592WQdIqwSX4Ad5POG726Q0aP2W3Jl_8_eRWwYX4WDA=w200-h200',
                                                                width:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: double
                                                                      .maxFinite,
                                                                  desktop: double
                                                                      .maxFinite,
                                                                ),
                                                                height:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: 150,
                                                                  desktop: 150,
                                                                ),
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                  top: 6,
                                                                ),
                                                                child: Text(
                                                                    '''कवाडी
सामानहरु''',
                                                                    style: GoogleFonts
                                                                        .poppins(
                                                                      textStyle:
                                                                          TextStyle(
                                                                        color: Color(0xFF000000)
                                                                            .withOpacity(1),
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        fontSize:
                                                                            getValueForScreenType<double>(
                                                                          context:
                                                                              context,
                                                                          mobile:
                                                                              15,
                                                                          tablet:
                                                                              16,
                                                                          desktop:
                                                                              16,
                                                                        ),
                                                                        fontStyle:
                                                                            FontStyle.normal,
                                                                        decoration:
                                                                            TextDecoration.none,
                                                                      ),
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    textDirection:
                                                                        TextDirection
                                                                            .ltr,
                                                                    maxLines:
                                                                        2)),
                                                          ],
                                                        )),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )),
                              ],
                            )),
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
                        mobile: 710,
                        tablet: null,
                        desktop: null,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: <Color>[
                            Color(0xFF6ACEFF).withOpacity(0),
                            Color(0xFFFFFFFF).withOpacity(1)
                          ],
                          stops: [0, 0.5],
                        ),
                        borderRadius: getValueForScreenType<BorderRadius>(
                          context: context,
                          mobile: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                          tablet: BorderRadius.zero,
                          desktop: BorderRadius.zero,
                        ),
                      ),
                      child: Padding(
                          padding: getValueForScreenType<EdgeInsets>(
                            context: context,
                            mobile: EdgeInsets.zero,
                            tablet: const EdgeInsets.only(
                              left: 2,
                            ),
                            desktop: const EdgeInsets.only(
                              left: 2,
                            ),
                          ),
                          child: SizedBox(
                            width: double.maxFinite,
                            height: getValueForScreenType<double?>(
                              context: context,
                              mobile: 710,
                              tablet: 150,
                              desktop: 150,
                            ),
                            child: Padding(
                                padding: getValueForScreenType<EdgeInsets>(
                                  context: context,
                                  mobile: EdgeInsets.zero,
                                  tablet: const EdgeInsets.only(
                                    left: 4,
                                  ),
                                  desktop: const EdgeInsets.only(
                                    left: 4,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding:
                                            getValueForScreenType<EdgeInsets>(
                                          context: context,
                                          mobile: EdgeInsets.zero,
                                          tablet: const EdgeInsets.only(
                                            right: 6,
                                          ),
                                          desktop: const EdgeInsets.only(
                                            right: 6,
                                          ),
                                        ),
                                        child: SizedBox(
                                          width: double.maxFinite,
                                          height:
                                              getValueForScreenType<double?>(
                                            context: context,
                                            mobile: 210,
                                            tablet: 150,
                                            desktop: 150,
                                          ),
                                          child: NotificationListener<
                                              ScrollEndNotification>(
                                            onNotification: (final scrollEnd) {
                                              final metrics = scrollEnd.metrics;
                                              if (metrics.atEdge) {
                                                final isTop =
                                                    metrics.pixels == 0;
                                                if (isTop) {
                                                } else {}
                                              }
                                              return true;
                                            },
                                            child: ListView(
                                              reverse: false,
                                              primary: true,
                                              physics:
                                                  const AlwaysScrollableScrollPhysics(),
                                              scrollDirection: Axis.horizontal,
                                              children: [
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile:
                                                          const EdgeInsets.only(
                                                        left: 6,
                                                        right: 6,
                                                      ),
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        right: 6,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        right: 6,
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
                                                                  20),
                                                          topRight:
                                                              Radius.circular(
                                                                  20),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  20),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  20),
                                                        ),
                                                        tablet:
                                                            BorderRadius.zero,
                                                        desktop:
                                                            BorderRadius.zero,
                                                      ),
                                                      child: Image.network(
                                                        'https://blogger.googleusercontent.com/img/a/AVvXsEglbUzNwcRD2EoFpZcWEfQQLj5Ow5Nn7GObZO2ZeoBrwY_Gs1HT8VKDY1y7rxkmfRSCNU5jkhGNFjf9sbShYbOJcau7kCITYISLbJs2seGgdH1G-nJ2MczYC24N7xQJHXUuz2e8KH4mnPJWWDE-a8Dfb7Xedi5N7eFlBWyLNrz2l6g3u9ZRts7E9ANUog=w640-h360',
                                                        width:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 370,
                                                          tablet:
                                                              double.maxFinite,
                                                          desktop:
                                                              double.maxFinite,
                                                        ),
                                                        height:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 210,
                                                          tablet: 150,
                                                          desktop: 150,
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    )),
                                                Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      right: 6,
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
                                                                  20),
                                                          topRight:
                                                              Radius.circular(
                                                                  20),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  20),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  20),
                                                        ),
                                                        tablet:
                                                            BorderRadius.zero,
                                                        desktop:
                                                            BorderRadius.zero,
                                                      ),
                                                      child: Image.network(
                                                        'https://blogger.googleusercontent.com/img/a/AVvXsEh5EvIIKfZIGZ36b0rEdJVuQJ21XCQDhiqIDL92h5pi6vztcKlC9W8eo56Otre5w-8X1MHItg1XEkywzB8jET4CSykfk3Pxq2FMEsolz7uS9TiPYJW19Vk8KZGwnRyRz-CuSDwpk2wKmy59DsKP2hPmIS6vNGOwrXT2f3956FJ0fjhVR85alTBHzpKG5A=w640-h360',
                                                        width:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 370,
                                                          tablet:
                                                              double.maxFinite,
                                                          desktop:
                                                              double.maxFinite,
                                                        ),
                                                        height:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 210,
                                                          tablet: 150,
                                                          desktop: 150,
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    )),
                                                Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      right: 6,
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
                                                                  20),
                                                          topRight:
                                                              Radius.circular(
                                                                  20),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  20),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  20),
                                                        ),
                                                        tablet:
                                                            BorderRadius.zero,
                                                        desktop:
                                                            BorderRadius.zero,
                                                      ),
                                                      child: Image.network(
                                                        'https://blogger.googleusercontent.com/img/a/AVvXsEgPuRDSVVozzX5doEQDuqzoQaeN4wClA-gQaL-iNJnerEHiDdIjH4tjyHU2Q2-l4M5BrS75QCXHxvsGlAL1q4jtiFCP37wfRCAe8F30ksOJNq-akedhermpMj142wW8bt1z3x9b8Ht76LB0mJta0TiDwM5seOAgumIQVyH2_Sw_gm7cNhdkF-KXPaP6Hg=w640-h360',
                                                        width:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 370,
                                                          tablet:
                                                              double.maxFinite,
                                                          desktop:
                                                              double.maxFinite,
                                                        ),
                                                        height:
                                                            getValueForScreenType<
                                                                double?>(
                                                          context: context,
                                                          mobile: 210,
                                                          tablet: 150,
                                                          desktop: 150,
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    )),
                                              ],
                                            ),
                                          ),
                                        )),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                          left: 6,
                                          right: 6,
                                        ),
                                        child: Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: const EdgeInsets.only(
                                                top: 15,
                                                bottom: 10,
                                              ),
                                              tablet: const EdgeInsets.only(
                                                top: 1,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                top: 1,
                                              ),
                                            ),
                                            child: Text('अन्य सेवाहरु',
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    color: Color(0xFF000000)
                                                        .withOpacity(1),
                                                    fontWeight: FontWeight.w700,
                                                    fontSize:
                                                        getValueForScreenType<
                                                            double>(
                                                      context: context,
                                                      mobile: 20,
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
                                                maxLines: 1))),
                                    Padding(
                                        padding:
                                            getValueForScreenType<EdgeInsets>(
                                          context: context,
                                          mobile: const EdgeInsets.only(
                                            left: 6,
                                            right: 6,
                                          ),
                                          tablet: const EdgeInsets.only(
                                            left: 6,
                                          ),
                                          desktop: const EdgeInsets.only(
                                            left: 6,
                                          ),
                                        ),
                                        child: Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: EdgeInsets.zero,
                                              tablet: const EdgeInsets.only(
                                                top: 6,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                top: 6,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                AnimationConfiguration
                                                    .staggeredList(
                                                  position: 1,
                                                  duration: Duration(
                                                    milliseconds: 800,
                                                  ),
                                                  child: FadeInAnimation(
                                                    child: SlideAnimation(
                                                      child: BouncingWidget(
                                                        onPressed: () async {
                                                          await Navigator.push<
                                                              void>(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  PageMakenewpagecopypest(),
                                                            ),
                                                          );
                                                        },
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    100),
                                                        scaleFactor: 1.5,
                                                        child: Column(
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .zero,
                                                              child:
                                                                  Image.network(
                                                                'https://blogger.googleusercontent.com/img/a/AVvXsEjdbnee2TM7P5JKDaDSPdhkdCbP-rspyb944M6T9J9ijyYLyxdWz-ghxxZkPcm1TXQzvYtEY3b9uGEulSLEEuW-zPEzgu67Bqc0Hhpu6laUTKeMUsQFkLioF6PtvxrYkpG38TBxKebucsDSzD41DF2fvOtq3jDxZe6VPBbku0A4SLPbvCDKUiwo3AtUBg=w200-h200',
                                                                width:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: double
                                                                      .maxFinite,
                                                                  desktop: double
                                                                      .maxFinite,
                                                                ),
                                                                height:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: 150,
                                                                  desktop: 150,
                                                                ),
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                  top: 6,
                                                                ),
                                                                child: Text(
                                                                    '''श्री हाम्रो
मोटर्स पार्ट्स''',
                                                                    style: GoogleFonts
                                                                        .poppins(
                                                                      textStyle:
                                                                          TextStyle(
                                                                        color: Color(0xFF000000)
                                                                            .withOpacity(1),
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        fontSize:
                                                                            getValueForScreenType<double>(
                                                                          context:
                                                                              context,
                                                                          mobile:
                                                                              15,
                                                                          tablet:
                                                                              16,
                                                                          desktop:
                                                                              16,
                                                                        ),
                                                                        fontStyle:
                                                                            FontStyle.normal,
                                                                        decoration:
                                                                            TextDecoration.none,
                                                                      ),
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    textDirection:
                                                                        TextDirection
                                                                            .ltr,
                                                                    maxLines:
                                                                        2)),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                AnimationConfiguration
                                                    .staggeredList(
                                                  position: 2,
                                                  duration: Duration(
                                                    milliseconds: 800,
                                                  ),
                                                  child: FadeInAnimation(
                                                    child: SlideAnimation(
                                                      child: BouncingWidget(
                                                        onPressed: () async {},
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    100),
                                                        scaleFactor: 1.5,
                                                        child: Column(
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .zero,
                                                              child:
                                                                  Image.network(
                                                                'https://blogger.googleusercontent.com/img/a/AVvXsEjz-NjAQSMH86_m31GvsiHq5QtNfMpXMth8lf5cmilDx75M-Fk1e2o8DOHBHHyVuLTYR5n6aSZMfScQPxY22TH1pXsxAnElsY2fGIocrkRmyuA0NgcZS_Ur2Sjp7M1a_Y5cwS_FwZgJTbFbmAEQLzjGe7iNvFKk0TTx_5Ircg172IuiH3UIByaogirMMw=w200-h200',
                                                                width:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: double
                                                                      .maxFinite,
                                                                  desktop: double
                                                                      .maxFinite,
                                                                ),
                                                                height:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: 150,
                                                                  desktop: 150,
                                                                ),
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                  top: 6,
                                                                ),
                                                                child: Text(
                                                                    '''पद्मरत्न
फर्निचर''',
                                                                    style: GoogleFonts
                                                                        .poppins(
                                                                      textStyle:
                                                                          TextStyle(
                                                                        color: Color(0xFF000000)
                                                                            .withOpacity(1),
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        fontSize:
                                                                            getValueForScreenType<double>(
                                                                          context:
                                                                              context,
                                                                          mobile:
                                                                              15,
                                                                          tablet:
                                                                              16,
                                                                          desktop:
                                                                              16,
                                                                        ),
                                                                        fontStyle:
                                                                            FontStyle.normal,
                                                                        decoration:
                                                                            TextDecoration.none,
                                                                      ),
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    textDirection:
                                                                        TextDirection
                                                                            .ltr,
                                                                    maxLines:
                                                                        2)),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                AnimationConfiguration
                                                    .staggeredList(
                                                  position: 3,
                                                  duration: Duration(
                                                    milliseconds: 800,
                                                  ),
                                                  child: FadeInAnimation(
                                                    child: SlideAnimation(
                                                      child: BouncingWidget(
                                                        onPressed: () async {},
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    100),
                                                        scaleFactor: 1.5,
                                                        child: Column(
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .zero,
                                                              child:
                                                                  Image.network(
                                                                'https://blogger.googleusercontent.com/img/a/AVvXsEj-CD6FbFVphh3_QdvYYsO248YJdIDQdGtDSV3mdIn49Jvi_dyIH2Ntv1lCMqKHZKba0q8qAd1yY3MchR_Bbp_F9_2CzBaJK41MAolfnhl1hBAwg9TXUMlkYFgIgAgGvoV_0ufrohcSPl92Y1PLhaQLkOlMeZ6Y3p2dRfqHCM2g_tvvbNtX5n8bcHvWSQ=w200-h200',
                                                                width:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: double
                                                                      .maxFinite,
                                                                  desktop: double
                                                                      .maxFinite,
                                                                ),
                                                                height:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: 150,
                                                                  desktop: 150,
                                                                ),
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                  top: 6,
                                                                ),
                                                                child: Text(
                                                                    '''सुनापति
बेकरी''',
                                                                    style: GoogleFonts
                                                                        .poppins(
                                                                      textStyle:
                                                                          TextStyle(
                                                                        color: Color(0xFF000000)
                                                                            .withOpacity(1),
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        fontSize:
                                                                            getValueForScreenType<double>(
                                                                          context:
                                                                              context,
                                                                          mobile:
                                                                              15,
                                                                          tablet:
                                                                              16,
                                                                          desktop:
                                                                              16,
                                                                        ),
                                                                        fontStyle:
                                                                            FontStyle.normal,
                                                                        decoration:
                                                                            TextDecoration.none,
                                                                      ),
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    textDirection:
                                                                        TextDirection
                                                                            .ltr,
                                                                    maxLines:
                                                                        2)),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                AnimationConfiguration
                                                    .staggeredList(
                                                  position: 4,
                                                  duration: Duration(
                                                    milliseconds: 800,
                                                  ),
                                                  child: FadeInAnimation(
                                                    child: SlideAnimation(
                                                      child: BouncingWidget(
                                                        onPressed: () async {},
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    100),
                                                        scaleFactor: 1.5,
                                                        child: Column(
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .zero,
                                                              child:
                                                                  Image.network(
                                                                'https://blogger.googleusercontent.com/img/a/AVvXsEhyZKYzp1kQCgUDbopqgHs9eZ67ll0-NIt9HxwVOVKqWSEa62gyT-qFH4Fs6f4D3qv35Dr13Dswd0sRWoh1aUDTuBBDQzohJO3eLI1BzqKxnyoEOCUkUH_-8vPjtRluHHVuWoplJqxdsqlqN7N3b2tpoyuKxDwr2zkyz2Rtn0ru2FXCjViqPYyHss-t7A=w200-h200',
                                                                width:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: double
                                                                      .maxFinite,
                                                                  desktop: double
                                                                      .maxFinite,
                                                                ),
                                                                height:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: 150,
                                                                  desktop: 150,
                                                                ),
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                  top: 6,
                                                                ),
                                                                child: Text(
                                                                    '''बिराज
सप्लायेर्स''',
                                                                    style: GoogleFonts
                                                                        .poppins(
                                                                      textStyle:
                                                                          TextStyle(
                                                                        color: Color(0xFF000000)
                                                                            .withOpacity(1),
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        fontSize:
                                                                            getValueForScreenType<double>(
                                                                          context:
                                                                              context,
                                                                          mobile:
                                                                              15,
                                                                          tablet:
                                                                              16,
                                                                          desktop:
                                                                              16,
                                                                        ),
                                                                        fontStyle:
                                                                            FontStyle.normal,
                                                                        decoration:
                                                                            TextDecoration.none,
                                                                      ),
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    textDirection:
                                                                        TextDirection
                                                                            .ltr,
                                                                    maxLines:
                                                                        2)),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ))),
                                    Padding(
                                        padding:
                                            getValueForScreenType<EdgeInsets>(
                                          context: context,
                                          mobile: const EdgeInsets.only(
                                            left: 6,
                                            top: 10,
                                            right: 6,
                                          ),
                                          tablet: const EdgeInsets.only(
                                            top: 5,
                                          ),
                                          desktop: const EdgeInsets.only(
                                            top: 5,
                                          ),
                                        ),
                                        child: Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: EdgeInsets.zero,
                                              tablet: const EdgeInsets.only(
                                                top: 6,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                top: 6,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                AnimationConfiguration
                                                    .staggeredList(
                                                  position: 1,
                                                  duration: Duration(
                                                    milliseconds: 800,
                                                  ),
                                                  child: FadeInAnimation(
                                                    child: SlideAnimation(
                                                      child: BouncingWidget(
                                                        onPressed: () async {
                                                          await Navigator.push<
                                                              void>(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  PageMakenewpagecopypest(),
                                                            ),
                                                          );
                                                        },
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    100),
                                                        scaleFactor: 1.5,
                                                        child: Column(
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .zero,
                                                              child:
                                                                  Image.network(
                                                                'https://blogger.googleusercontent.com/img/a/AVvXsEihjZHhjzUus-s6_O3dvX5Dm38meuvXbGPPDiguiLojdoLuPQRarTE9G-upIoKG_OsrcnsLBszGeoGJaE4S9SrObdtzwSLQn5oJ4novQncR-eEFpv2rD7zJWjYVr3LPSNQAnN5E_EEHrYtiH7JWJDMRsB9nz2oGSaAlW_FwXtWn37UzAevHbtjGSdTKJQ=w200-h200',
                                                                width:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: double
                                                                      .maxFinite,
                                                                  desktop: double
                                                                      .maxFinite,
                                                                ),
                                                                height:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: 150,
                                                                  desktop: 150,
                                                                ),
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                  top: 6,
                                                                ),
                                                                child: Text(
                                                                    'अनमिका',
                                                                    style: GoogleFonts
                                                                        .poppins(
                                                                      textStyle:
                                                                          TextStyle(
                                                                        color: Color(0xFF000000)
                                                                            .withOpacity(1),
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        fontSize:
                                                                            getValueForScreenType<double>(
                                                                          context:
                                                                              context,
                                                                          mobile:
                                                                              15,
                                                                          tablet:
                                                                              16,
                                                                          desktop:
                                                                              16,
                                                                        ),
                                                                        fontStyle:
                                                                            FontStyle.normal,
                                                                        decoration:
                                                                            TextDecoration.none,
                                                                      ),
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    textDirection:
                                                                        TextDirection
                                                                            .ltr,
                                                                    maxLines:
                                                                        2)),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                AnimationConfiguration
                                                    .staggeredList(
                                                  position: 2,
                                                  duration: Duration(
                                                    milliseconds: 800,
                                                  ),
                                                  child: FadeInAnimation(
                                                    child: SlideAnimation(
                                                      child: BouncingWidget(
                                                        onPressed: () async {},
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    100),
                                                        scaleFactor: 1.5,
                                                        child: Column(
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .zero,
                                                              child:
                                                                  Image.network(
                                                                'https://blogger.googleusercontent.com/img/a/AVvXsEjwCmFY3IPXbKuT5ArUU1F_OMcu4E_G5s88hO7-n6Jiq--G4Xpb4tlMZrgfYgMaTkCTheXuddwWTF8LE2TDUzkH_-8AVyzXWHn1rIVDujb4LBUT8hTzk2HVmWOn_L5HM6dOqCC8SeYXhySli5kEJ-DGuXwysewFU-5vOEq9c8XRFRUGyZJm1z9d_ORkGg=w200-h200',
                                                                width:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: double
                                                                      .maxFinite,
                                                                  desktop: double
                                                                      .maxFinite,
                                                                ),
                                                                height:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: 150,
                                                                  desktop: 150,
                                                                ),
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                  top: 6,
                                                                ),
                                                                child: Text(
                                                                    '''ग्रीन
हाईलाइट''',
                                                                    style: GoogleFonts
                                                                        .poppins(
                                                                      textStyle:
                                                                          TextStyle(
                                                                        color: Color(0xFF000000)
                                                                            .withOpacity(1),
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        fontSize:
                                                                            getValueForScreenType<double>(
                                                                          context:
                                                                              context,
                                                                          mobile:
                                                                              15,
                                                                          tablet:
                                                                              16,
                                                                          desktop:
                                                                              16,
                                                                        ),
                                                                        fontStyle:
                                                                            FontStyle.normal,
                                                                        decoration:
                                                                            TextDecoration.none,
                                                                      ),
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    textDirection:
                                                                        TextDirection
                                                                            .ltr,
                                                                    maxLines:
                                                                        2)),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                AnimationConfiguration
                                                    .staggeredList(
                                                  position: 3,
                                                  duration: Duration(
                                                    milliseconds: 800,
                                                  ),
                                                  child: FadeInAnimation(
                                                    child: SlideAnimation(
                                                      child: BouncingWidget(
                                                        onPressed: () async {
                                                          await Navigator.push<
                                                              void>(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  PageMilkShop(
                                                                param1: datasets['null']
                                                                            ?[
                                                                            index]
                                                                        ?[
                                                                        'null'] ??
                                                                    '',
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    100),
                                                        scaleFactor: 1.5,
                                                        child: Column(
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .zero,
                                                              child:
                                                                  Image.network(
                                                                'https://blogger.googleusercontent.com/img/a/AVvXsEh1Az9r01v2PxR_VF2LU2bJJceZP3vTB-FgYCEojJz9EmHKrqqzoWLqoRW7vi9zAfvkCaSiyURgWoEuu9Pzlbx7swth5-sa7ORSUuILVt1iGkZx48k3k8E6cFvMZj007QMXDUxWq8l0pi8zVBnGq9NleKtDQwJS0qnleUhfmbhTri8jtpt3W8YVzSIDPA=w200-h200',
                                                                width:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: double
                                                                      .maxFinite,
                                                                  desktop: double
                                                                      .maxFinite,
                                                                ),
                                                                height:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: 150,
                                                                  desktop: 150,
                                                                ),
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                  top: 6,
                                                                ),
                                                                child: Text(
                                                                    '''चिरन्जीवी 
डेरी''',
                                                                    style: GoogleFonts
                                                                        .poppins(
                                                                      textStyle:
                                                                          TextStyle(
                                                                        color: Color(0xFF000000)
                                                                            .withOpacity(1),
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        fontSize:
                                                                            getValueForScreenType<double>(
                                                                          context:
                                                                              context,
                                                                          mobile:
                                                                              15,
                                                                          tablet:
                                                                              16,
                                                                          desktop:
                                                                              16,
                                                                        ),
                                                                        fontStyle:
                                                                            FontStyle.normal,
                                                                        decoration:
                                                                            TextDecoration.none,
                                                                      ),
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    textDirection:
                                                                        TextDirection
                                                                            .ltr,
                                                                    maxLines:
                                                                        2)),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                AnimationConfiguration
                                                    .staggeredList(
                                                  position: 4,
                                                  duration: Duration(
                                                    milliseconds: 800,
                                                  ),
                                                  child: FadeInAnimation(
                                                    child: SlideAnimation(
                                                      child: BouncingWidget(
                                                        onPressed: () async {},
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    100),
                                                        scaleFactor: 1.5,
                                                        child: Column(
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .zero,
                                                              child:
                                                                  Image.network(
                                                                'https://blogger.googleusercontent.com/img/a/AVvXsEhtOQ25tTw0B2i4BaiAv8P7aXogtv7eQUsLaBwOcbdUgoo78qMXlUY5jsJrJVlIE293mOIUqBk9usXgSAQMpPPR0DG6IQU0zzcxwi4uafEzpwBkFIiEwYYLL-AKbYOhXHCMH1Nax-rbNfgE1Tm2o0OMm5QzgYHWh3x30-l01YUBJysIyOmn1DAd-8ry3g=w200-h200',
                                                                width:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: double
                                                                      .maxFinite,
                                                                  desktop: double
                                                                      .maxFinite,
                                                                ),
                                                                height:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: 150,
                                                                  desktop: 150,
                                                                ),
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                  top: 6,
                                                                ),
                                                                child: Text(
                                                                    '''रामेछाप
कलर हाउस''',
                                                                    style: GoogleFonts
                                                                        .poppins(
                                                                      textStyle:
                                                                          TextStyle(
                                                                        color: Color(0xFF000000)
                                                                            .withOpacity(1),
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        fontSize:
                                                                            getValueForScreenType<double>(
                                                                          context:
                                                                              context,
                                                                          mobile:
                                                                              15,
                                                                          tablet:
                                                                              16,
                                                                          desktop:
                                                                              16,
                                                                        ),
                                                                        fontStyle:
                                                                            FontStyle.normal,
                                                                        decoration:
                                                                            TextDecoration.none,
                                                                      ),
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    textDirection:
                                                                        TextDirection
                                                                            .ltr,
                                                                    maxLines:
                                                                        2)),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ))),
                                    Padding(
                                        padding:
                                            getValueForScreenType<EdgeInsets>(
                                          context: context,
                                          mobile: const EdgeInsets.only(
                                            left: 6,
                                            top: 10,
                                            right: 6,
                                          ),
                                          tablet: const EdgeInsets.only(
                                            top: 5,
                                          ),
                                          desktop: const EdgeInsets.only(
                                            top: 5,
                                          ),
                                        ),
                                        child: Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: EdgeInsets.zero,
                                              tablet: const EdgeInsets.only(
                                                top: 6,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                top: 6,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                AnimationConfiguration
                                                    .staggeredList(
                                                  position: 1,
                                                  duration: Duration(
                                                    milliseconds: 800,
                                                  ),
                                                  child: FadeInAnimation(
                                                    child: SlideAnimation(
                                                      child: BouncingWidget(
                                                        onPressed: () async {
                                                          await Navigator.push<
                                                              void>(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  PageMakenewpagecopypest(),
                                                            ),
                                                          );
                                                        },
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    100),
                                                        scaleFactor: 1.5,
                                                        child: Column(
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .zero,
                                                              child:
                                                                  Image.network(
                                                                'https://blogger.googleusercontent.com/img/a/AVvXsEi49UXJPRBTvdIA2bWckMGHAY6R9RXeUgIfV0DixemWfX3MgGjY9pfO8keSGXFe4cd33yxXz3q0hUxPq8I1vMZWZ_6Zq3ZlKff0SIUvTiBdQTOUuOxC64QbOaN1c1viiuazXfWM4d6X497vOQEQcEySr7b27fy4DBM-kRdxqFjtXHpRtMQurox6rl9Dgw=w200-h200',
                                                                width:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: double
                                                                      .maxFinite,
                                                                  desktop: double
                                                                      .maxFinite,
                                                                ),
                                                                height:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: 150,
                                                                  desktop: 150,
                                                                ),
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                  top: 6,
                                                                ),
                                                                child: Text(
                                                                    '''गुगल डिजिटल
फेल्स प्रिन्ट''',
                                                                    style: GoogleFonts
                                                                        .poppins(
                                                                      textStyle:
                                                                          TextStyle(
                                                                        color: Color(0xFF000000)
                                                                            .withOpacity(1),
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        fontSize:
                                                                            getValueForScreenType<double>(
                                                                          context:
                                                                              context,
                                                                          mobile:
                                                                              15,
                                                                          tablet:
                                                                              16,
                                                                          desktop:
                                                                              16,
                                                                        ),
                                                                        fontStyle:
                                                                            FontStyle.normal,
                                                                        decoration:
                                                                            TextDecoration.none,
                                                                      ),
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    textDirection:
                                                                        TextDirection
                                                                            .ltr,
                                                                    maxLines:
                                                                        2)),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                AnimationConfiguration
                                                    .staggeredList(
                                                  position: 2,
                                                  duration: Duration(
                                                    milliseconds: 800,
                                                  ),
                                                  child: FadeInAnimation(
                                                    child: SlideAnimation(
                                                      child: BouncingWidget(
                                                        onPressed: () async {},
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    100),
                                                        scaleFactor: 1.5,
                                                        child: Column(
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .zero,
                                                              child:
                                                                  Image.network(
                                                                'https://blogger.googleusercontent.com/img/a/AVvXsEhkDYR6YHkxdbgik_s4_0_5gMXZbIzBA8i2UhiU1pwbblONt2YQe0W6HNJ5d2a_BJh7nKGLjtjwJfbMPvX0jguhqpB_Bsd5oIh2BYnjJXqHcvYtqglcru_VYvZ8Gyg79syus0vphgKnMaqhbik1hdT1K6r_gwYrlwoZ8Gu_P5VPyG9fU6SjrIUPcWl7jw=w200-h200',
                                                                width:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: double
                                                                      .maxFinite,
                                                                  desktop: double
                                                                      .maxFinite,
                                                                ),
                                                                height:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: 150,
                                                                  desktop: 150,
                                                                ),
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                  top: 6,
                                                                ),
                                                                child: Text(
                                                                    '''अभिषेक
इन्टरप्राइजेज ''',
                                                                    style: GoogleFonts
                                                                        .poppins(
                                                                      textStyle:
                                                                          TextStyle(
                                                                        color: Color(0xFF000000)
                                                                            .withOpacity(1),
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        fontSize:
                                                                            getValueForScreenType<double>(
                                                                          context:
                                                                              context,
                                                                          mobile:
                                                                              15,
                                                                          tablet:
                                                                              16,
                                                                          desktop:
                                                                              16,
                                                                        ),
                                                                        fontStyle:
                                                                            FontStyle.normal,
                                                                        decoration:
                                                                            TextDecoration.none,
                                                                      ),
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    textDirection:
                                                                        TextDirection
                                                                            .ltr,
                                                                    maxLines:
                                                                        2)),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                AnimationConfiguration
                                                    .staggeredList(
                                                  position: 3,
                                                  duration: Duration(
                                                    milliseconds: 800,
                                                  ),
                                                  child: FadeInAnimation(
                                                    child: SlideAnimation(
                                                      child: BouncingWidget(
                                                        onPressed: () async {},
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    100),
                                                        scaleFactor: 1.5,
                                                        child: Column(
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .zero,
                                                              child:
                                                                  Image.network(
                                                                'https://blogger.googleusercontent.com/img/a/AVvXsEj6LXa6eNOVS3HsmcFp3d3PdLgbfIsnMCmRJ1UnZWr6FeKFdUu1cSrzzE-Nzol66FwhPULG7t3_zV1mfiUtE8VFD0iK_wg59xIyRN49Pddji7dcE67J-r084Filz9c_wtd4Tt-9B9aRGDVqBFQftbsGxve-DQwefQNXadCJEaVfPP9WmtcPnqG0uTwL6Q=w200-h200',
                                                                width:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: double
                                                                      .maxFinite,
                                                                  desktop: double
                                                                      .maxFinite,
                                                                ),
                                                                height:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: 150,
                                                                  desktop: 150,
                                                                ),
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                  top: 6,
                                                                ),
                                                                child: Text(
                                                                    '''मन्थली डिलक्स
एग्रो फरेस्टिक
प्रा. लि. ''',
                                                                    style: GoogleFonts
                                                                        .poppins(
                                                                      textStyle:
                                                                          TextStyle(
                                                                        color: Color(0xFF000000)
                                                                            .withOpacity(1),
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        fontSize:
                                                                            getValueForScreenType<double>(
                                                                          context:
                                                                              context,
                                                                          mobile:
                                                                              15,
                                                                          tablet:
                                                                              16,
                                                                          desktop:
                                                                              16,
                                                                        ),
                                                                        fontStyle:
                                                                            FontStyle.normal,
                                                                        decoration:
                                                                            TextDecoration.none,
                                                                      ),
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    textDirection:
                                                                        TextDirection
                                                                            .ltr,
                                                                    maxLines:
                                                                        3)),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                AnimationConfiguration
                                                    .staggeredList(
                                                  position: 4,
                                                  duration: Duration(
                                                    milliseconds: 800,
                                                  ),
                                                  child: FadeInAnimation(
                                                    child: SlideAnimation(
                                                      child: BouncingWidget(
                                                        onPressed: () async {},
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    100),
                                                        scaleFactor: 1.5,
                                                        child: Column(
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .zero,
                                                              child:
                                                                  Image.network(
                                                                'https://blogger.googleusercontent.com/img/a/AVvXsEhy1rWuG5ntGFQydzr5IbOsP03J5g8Pc3MnAzxhow3u4zv-HeZfGJ-VSAd_8mq1zMxLowHk_TSMqGV0w9JxLmfx7LIG-v-Fq5MxyV0Yko8Mnuq-iXfQd4iL8Wx4F9NVOorIS-rDZV0KB8PYANr5sCcih-6NuPtmTnInABoglgPkjo74bL51LRkarTpvuw=w200-h200',
                                                                width:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: double
                                                                      .maxFinite,
                                                                  desktop: double
                                                                      .maxFinite,
                                                                ),
                                                                height:
                                                                    getValueForScreenType<
                                                                        double?>(
                                                                  context:
                                                                      context,
                                                                  mobile: 80,
                                                                  tablet: 150,
                                                                  desktop: 150,
                                                                ),
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                  top: 6,
                                                                ),
                                                                child: Text(
                                                                    '''अन्य 
सेवाहरु''',
                                                                    style: GoogleFonts
                                                                        .poppins(
                                                                      textStyle:
                                                                          TextStyle(
                                                                        color: Color(0xFF000000)
                                                                            .withOpacity(1),
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        fontSize:
                                                                            getValueForScreenType<double>(
                                                                          context:
                                                                              context,
                                                                          mobile:
                                                                              15,
                                                                          tablet:
                                                                              16,
                                                                          desktop:
                                                                              16,
                                                                        ),
                                                                        fontStyle:
                                                                            FontStyle.normal,
                                                                        decoration:
                                                                            TextDecoration.none,
                                                                      ),
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    textDirection:
                                                                        TextDirection
                                                                            .ltr,
                                                                    maxLines:
                                                                        2)),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ))),
                                  ],
                                )),
                          )),
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
                        mobile: 440,
                        tablet: null,
                        desktop: null,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: <Color>[
                            Color(0xFF6ACEFF).withOpacity(1),
                            Color(0xFFFFFFFF).withOpacity(1)
                          ],
                          stops: [0, 1],
                        ),
                        borderRadius: getValueForScreenType<BorderRadius>(
                          context: context,
                          mobile: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                          tablet: BorderRadius.zero,
                          desktop: BorderRadius.zero,
                        ),
                      ),
                      child: Padding(
                          padding: getValueForScreenType<EdgeInsets>(
                            context: context,
                            mobile: EdgeInsets.zero,
                            tablet: const EdgeInsets.only(
                              left: 2,
                            ),
                            desktop: const EdgeInsets.only(
                              left: 2,
                            ),
                          ),
                          child: SizedBox(
                            width: double.maxFinite,
                            height: getValueForScreenType<double?>(
                              context: context,
                              mobile: 440,
                              tablet: 150,
                              desktop: 150,
                            ),
                            child: Padding(
                                padding: getValueForScreenType<EdgeInsets>(
                                  context: context,
                                  mobile: const EdgeInsets.only(
                                    left: 8,
                                    right: 8,
                                  ),
                                  tablet: const EdgeInsets.only(
                                    left: 4,
                                  ),
                                  desktop: const EdgeInsets.only(
                                    left: 4,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding:
                                            getValueForScreenType<EdgeInsets>(
                                          context: context,
                                          mobile: const EdgeInsets.only(
                                            top: 15,
                                            bottom: 10,
                                          ),
                                          tablet: const EdgeInsets.only(
                                            top: 1,
                                          ),
                                          desktop: const EdgeInsets.only(
                                            top: 1,
                                          ),
                                        ),
                                        child: Text('होटल एण्ड  लज',
                                            style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                color: Color(0xFF000000)
                                                    .withOpacity(1),
                                                fontWeight: FontWeight.w700,
                                                fontSize: getValueForScreenType<
                                                    double>(
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
                                    Padding(
                                        padding:
                                            getValueForScreenType<EdgeInsets>(
                                          context: context,
                                          mobile: EdgeInsets.zero,
                                          tablet: const EdgeInsets.only(
                                            top: 6,
                                          ),
                                          desktop: const EdgeInsets.only(
                                            top: 6,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AnimationConfiguration
                                                .staggeredList(
                                              position: 1,
                                              duration: Duration(
                                                milliseconds: 800,
                                              ),
                                              child: FadeInAnimation(
                                                child: SlideAnimation(
                                                  child: BouncingWidget(
                                                    onPressed: () async {},
                                                    duration: const Duration(
                                                        milliseconds: 100),
                                                    scaleFactor: 1.5,
                                                    child: Column(
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius.zero,
                                                          child: Image.network(
                                                            'https://blogger.googleusercontent.com/img/a/AVvXsEhkNzI9Lew_L5mbzI8kEfrDE0ZNOtngbhAdCNRZsm8desc_6aVmabHVgc5sshbAlaFYGvC-qRyMliFNrZoCmxDB7Tp7Wq8Qq7adtZS1W2l6mtUAqx5QHHuqOj7T-xdRIIzrRrixjYT7crnc4YtlGJRyIv0p7YUTGk2qPDVbJTRXE09r_cenC8JhFRzOKg=w200-h200',
                                                            width:
                                                                getValueForScreenType<
                                                                    double?>(
                                                              context: context,
                                                              mobile: 80,
                                                              tablet: double
                                                                  .maxFinite,
                                                              desktop: double
                                                                  .maxFinite,
                                                            ),
                                                            height:
                                                                getValueForScreenType<
                                                                    double?>(
                                                              context: context,
                                                              mobile: 80,
                                                              tablet: 150,
                                                              desktop: 150,
                                                            ),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                              top: 6,
                                                            ),
                                                            child: Text(
                                                                '''गाल्पाली होटल
एण्ड लज''',
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
                                                                        getValueForScreenType<
                                                                            double>(
                                                                      context:
                                                                          context,
                                                                      mobile:
                                                                          15,
                                                                      tablet:
                                                                          16,
                                                                      desktop:
                                                                          16,
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
                                                                    TextAlign
                                                                        .center,
                                                                textDirection:
                                                                    TextDirection
                                                                        .ltr,
                                                                maxLines: 2)),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            AnimationConfiguration
                                                .staggeredList(
                                              position: 2,
                                              duration: Duration(
                                                milliseconds: 800,
                                              ),
                                              child: FadeInAnimation(
                                                child: SlideAnimation(
                                                  child: BouncingWidget(
                                                    onPressed: () async {},
                                                    duration: const Duration(
                                                        milliseconds: 100),
                                                    scaleFactor: 1.5,
                                                    child: Column(
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius.zero,
                                                          child: Image.network(
                                                            'https://blogger.googleusercontent.com/img/a/AVvXsEh-wq1y2tdrw6N-YQeHCf8NkrR3BuJduoiiX6ziSGfM3FLBv37h8SJE6Dc9QTbZ8QqNS3c62rtZsrm83_qCNIUu2Y7OhmiJL5w7efegASrmybON4YxLx_94nXOsrPZ4YFSJi5AwXhrW3lLWLDvGCw-i-Ojf-8FlgpFogFP2nBv52rc6odrcZrZ9EcdwgQ=w200-h200',
                                                            width:
                                                                getValueForScreenType<
                                                                    double?>(
                                                              context: context,
                                                              mobile: 80,
                                                              tablet: double
                                                                  .maxFinite,
                                                              desktop: double
                                                                  .maxFinite,
                                                            ),
                                                            height:
                                                                getValueForScreenType<
                                                                    double?>(
                                                              context: context,
                                                              mobile: 80,
                                                              tablet: 150,
                                                              desktop: 150,
                                                            ),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                              top: 6,
                                                            ),
                                                            child: Text(
                                                                '''सनराइज
फुड क्याफे''',
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
                                                                        getValueForScreenType<
                                                                            double>(
                                                                      context:
                                                                          context,
                                                                      mobile:
                                                                          15,
                                                                      tablet:
                                                                          16,
                                                                      desktop:
                                                                          16,
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
                                                                    TextAlign
                                                                        .center,
                                                                textDirection:
                                                                    TextDirection
                                                                        .ltr,
                                                                maxLines: 2)),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            AnimationConfiguration
                                                .staggeredList(
                                              position: 3,
                                              duration: Duration(
                                                milliseconds: 800,
                                              ),
                                              child: FadeInAnimation(
                                                child: SlideAnimation(
                                                  child: BouncingWidget(
                                                    onPressed: () async {},
                                                    duration: const Duration(
                                                        milliseconds: 100),
                                                    scaleFactor: 1.5,
                                                    child: Column(
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius.zero,
                                                          child: Image.network(
                                                            'https://1.bp.blogspot.com/-j4wKJgQjexU/YAsGMWvCBMI/AAAAAAAA3No/FH6EvWD5ImQzA0TgaEfnlWUzopRdERaKQCLcBGAsYHQ/s320/Icone-min.png',
                                                            width:
                                                                getValueForScreenType<
                                                                    double?>(
                                                              context: context,
                                                              mobile: 80,
                                                              tablet: double
                                                                  .maxFinite,
                                                              desktop: double
                                                                  .maxFinite,
                                                            ),
                                                            height:
                                                                getValueForScreenType<
                                                                    double?>(
                                                              context: context,
                                                              mobile: 80,
                                                              tablet: 150,
                                                              desktop: 150,
                                                            ),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                              top: 6,
                                                            ),
                                                            child: Text(
                                                                '''मन्थली
बजार''',
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
                                                                        getValueForScreenType<
                                                                            double>(
                                                                      context:
                                                                          context,
                                                                      mobile:
                                                                          15,
                                                                      tablet:
                                                                          16,
                                                                      desktop:
                                                                          16,
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
                                                                    TextAlign
                                                                        .center,
                                                                textDirection:
                                                                    TextDirection
                                                                        .ltr,
                                                                maxLines: 2)),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            AnimationConfiguration
                                                .staggeredList(
                                              position: 4,
                                              duration: Duration(
                                                milliseconds: 800,
                                              ),
                                              child: FadeInAnimation(
                                                child: SlideAnimation(
                                                  child: BouncingWidget(
                                                    onPressed: () async {},
                                                    duration: const Duration(
                                                        milliseconds: 100),
                                                    scaleFactor: 1.5,
                                                    child: Column(
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius.zero,
                                                          child: Image.network(
                                                            'https://1.bp.blogspot.com/-j4wKJgQjexU/YAsGMWvCBMI/AAAAAAAA3No/FH6EvWD5ImQzA0TgaEfnlWUzopRdERaKQCLcBGAsYHQ/s320/Icone-min.png',
                                                            width:
                                                                getValueForScreenType<
                                                                    double?>(
                                                              context: context,
                                                              mobile: 80,
                                                              tablet: double
                                                                  .maxFinite,
                                                              desktop: double
                                                                  .maxFinite,
                                                            ),
                                                            height:
                                                                getValueForScreenType<
                                                                    double?>(
                                                              context: context,
                                                              mobile: 80,
                                                              tablet: 150,
                                                              desktop: 150,
                                                            ),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                              top: 6,
                                                            ),
                                                            child: Text(
                                                                '''मन्थली 
बजार''',
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
                                                                        getValueForScreenType<
                                                                            double>(
                                                                      context:
                                                                          context,
                                                                      mobile:
                                                                          15,
                                                                      tablet:
                                                                          16,
                                                                      desktop:
                                                                          16,
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
                                                                    TextAlign
                                                                        .center,
                                                                textDirection:
                                                                    TextDirection
                                                                        .ltr,
                                                                maxLines: 2)),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )),
                                    Padding(
                                        padding:
                                            getValueForScreenType<EdgeInsets>(
                                          context: context,
                                          mobile: const EdgeInsets.only(
                                            top: 15,
                                            bottom: 10,
                                          ),
                                          tablet: const EdgeInsets.only(
                                            top: 1,
                                          ),
                                          desktop: const EdgeInsets.only(
                                            top: 1,
                                          ),
                                        ),
                                        child: Text('बैक तथा सहकारी सस्थाहरु',
                                            style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                color: Color(0xFF000000)
                                                    .withOpacity(1),
                                                fontWeight: FontWeight.w700,
                                                fontSize: getValueForScreenType<
                                                    double>(
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
                                    Padding(
                                        padding:
                                            getValueForScreenType<EdgeInsets>(
                                          context: context,
                                          mobile: EdgeInsets.zero,
                                          tablet: const EdgeInsets.only(
                                            top: 6,
                                          ),
                                          desktop: const EdgeInsets.only(
                                            top: 6,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AnimationConfiguration
                                                .staggeredList(
                                              position: 1,
                                              duration: Duration(
                                                milliseconds: 800,
                                              ),
                                              child: FadeInAnimation(
                                                child: SlideAnimation(
                                                  child: BouncingWidget(
                                                    onPressed: () async {},
                                                    duration: const Duration(
                                                        milliseconds: 100),
                                                    scaleFactor: 1.5,
                                                    child: Column(
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius.zero,
                                                          child: Image.network(
                                                            'https://blogger.googleusercontent.com/img/a/AVvXsEjQ5C8DFyikusPzijmsaazwY7gLlEo06vcHFs-S86DmWw_0MvdGQkZJ1-GeoxFg91C5fGswDe3GdTTklT9EhTBCXHfjCLjBnfgYZLR2oADhtPsFrEmtdQMSydv9LI57jG4EWkH1VoV5bIKgCHsstEZeQMS4mUJfTaMOls7EqQ1dUlS_h99-SphX7TWhqQ=w200-h200',
                                                            width:
                                                                getValueForScreenType<
                                                                    double?>(
                                                              context: context,
                                                              mobile: 80,
                                                              tablet: double
                                                                  .maxFinite,
                                                              desktop: double
                                                                  .maxFinite,
                                                            ),
                                                            height:
                                                                getValueForScreenType<
                                                                    double?>(
                                                              context: context,
                                                              mobile: 80,
                                                              tablet: 150,
                                                              desktop: 150,
                                                            ),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                              top: 6,
                                                            ),
                                                            child: Text(
                                                                '''मन्थली बैंक
फोन न.''',
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
                                                                        getValueForScreenType<
                                                                            double>(
                                                                      context:
                                                                          context,
                                                                      mobile:
                                                                          15,
                                                                      tablet:
                                                                          16,
                                                                      desktop:
                                                                          16,
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
                                                                    TextAlign
                                                                        .center,
                                                                textDirection:
                                                                    TextDirection
                                                                        .ltr,
                                                                maxLines: 2)),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            AnimationConfiguration
                                                .staggeredList(
                                              position: 2,
                                              duration: Duration(
                                                milliseconds: 800,
                                              ),
                                              child: FadeInAnimation(
                                                child: SlideAnimation(
                                                  child: BouncingWidget(
                                                    onPressed: () async {},
                                                    duration: const Duration(
                                                        milliseconds: 100),
                                                    scaleFactor: 1.5,
                                                    child: Column(
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius.zero,
                                                          child: Image.network(
                                                            'https://blogger.googleusercontent.com/img/a/AVvXsEjcUzW4M_e-95bNWleGxWOLoPsDKQ9J9t0CPDJ4OIyeesZiHlAZmwZqhi5ycnsVkhnKDMoiss7xrbTso_cSx-pHG5xvj4Dvh91ucXCcQXCTAZs0m7kJaJIH1rH93XTnyGNgNmNwLcqTqiWEmwfSNU8-Oo68aIwRf6JOvb7Z3YC-IdJh1PXVC-RWoG_bfA=w200-h200',
                                                            width:
                                                                getValueForScreenType<
                                                                    double?>(
                                                              context: context,
                                                              mobile: 80,
                                                              tablet: double
                                                                  .maxFinite,
                                                              desktop: double
                                                                  .maxFinite,
                                                            ),
                                                            height:
                                                                getValueForScreenType<
                                                                    double?>(
                                                              context: context,
                                                              mobile: 80,
                                                              tablet: 150,
                                                              desktop: 150,
                                                            ),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                              top: 6,
                                                            ),
                                                            child: Text(
                                                                '''मन्थली बचत
तथा ऋण सहकारी
सस्था लि.''',
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
                                                                        getValueForScreenType<
                                                                            double>(
                                                                      context:
                                                                          context,
                                                                      mobile:
                                                                          15,
                                                                      tablet:
                                                                          16,
                                                                      desktop:
                                                                          16,
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
                                                                    TextAlign
                                                                        .center,
                                                                textDirection:
                                                                    TextDirection
                                                                        .ltr,
                                                                maxLines: 3)),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            AnimationConfiguration
                                                .staggeredList(
                                              position: 3,
                                              duration: Duration(
                                                milliseconds: 800,
                                              ),
                                              child: FadeInAnimation(
                                                child: SlideAnimation(
                                                  child: BouncingWidget(
                                                    onPressed: () async {},
                                                    duration: const Duration(
                                                        milliseconds: 100),
                                                    scaleFactor: 1.5,
                                                    child: Column(
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius.zero,
                                                          child: Image.network(
                                                            'https://blogger.googleusercontent.com/img/a/AVvXsEjFcKfwZ_-F--WFQhUjXpHiEGHYPK8--YnbU3fhhFpGQDTOu_ztVCSCdt8rcqMLbokwiJkwFHxJJ4Iqv6c-lXcZkYCymCo3qWmVFE2q1XmXvZ3-OA1_iEMt_K6gn7ygyzf0_pfcoAk57ZEgiqlsDjXmUuPPJzRaEDK5h7xzSWsNQFC2iMj7z9e5o8jU4w=w200-h200',
                                                            width:
                                                                getValueForScreenType<
                                                                    double?>(
                                                              context: context,
                                                              mobile: 80,
                                                              tablet: double
                                                                  .maxFinite,
                                                              desktop: double
                                                                  .maxFinite,
                                                            ),
                                                            height:
                                                                getValueForScreenType<
                                                                    double?>(
                                                              context: context,
                                                              mobile: 80,
                                                              tablet: 150,
                                                              desktop: 150,
                                                            ),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                              top: 6,
                                                            ),
                                                            child: Text(
                                                                '''नवजागरण 
बचत तथा 
ऋण सहकारी 
सस्था लि.''',
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
                                                                        getValueForScreenType<
                                                                            double>(
                                                                      context:
                                                                          context,
                                                                      mobile:
                                                                          15,
                                                                      tablet:
                                                                          16,
                                                                      desktop:
                                                                          16,
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
                                                                    TextAlign
                                                                        .center,
                                                                textDirection:
                                                                    TextDirection
                                                                        .ltr,
                                                                maxLines: 4)),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            AnimationConfiguration
                                                .staggeredList(
                                              position: 4,
                                              duration: Duration(
                                                milliseconds: 800,
                                              ),
                                              child: FadeInAnimation(
                                                child: SlideAnimation(
                                                  child: BouncingWidget(
                                                    onPressed: () async {},
                                                    duration: const Duration(
                                                        milliseconds: 100),
                                                    scaleFactor: 1.5,
                                                    child: Column(
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius.zero,
                                                          child: Image.network(
                                                            'https://1.bp.blogspot.com/-j4wKJgQjexU/YAsGMWvCBMI/AAAAAAAA3No/FH6EvWD5ImQzA0TgaEfnlWUzopRdERaKQCLcBGAsYHQ/s320/Icone-min.png',
                                                            width:
                                                                getValueForScreenType<
                                                                    double?>(
                                                              context: context,
                                                              mobile: 80,
                                                              tablet: double
                                                                  .maxFinite,
                                                              desktop: double
                                                                  .maxFinite,
                                                            ),
                                                            height:
                                                                getValueForScreenType<
                                                                    double?>(
                                                              context: context,
                                                              mobile: 80,
                                                              tablet: 150,
                                                              desktop: 150,
                                                            ),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                              top: 6,
                                                            ),
                                                            child: Text(
                                                                '''मन्थली 
बजार''',
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
                                                                        getValueForScreenType<
                                                                            double>(
                                                                      context:
                                                                          context,
                                                                      mobile:
                                                                          15,
                                                                      tablet:
                                                                          16,
                                                                      desktop:
                                                                          16,
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
                                                                    TextAlign
                                                                        .center,
                                                                textDirection:
                                                                    TextDirection
                                                                        .ltr,
                                                                maxLines: 2)),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )),
                                  ],
                                )),
                          )),
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
