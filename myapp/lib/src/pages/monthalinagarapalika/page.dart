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

class PageMonthalinagarapalika extends StatefulWidget {
  const PageMonthalinagarapalika({
    Key? key,
  }) : super(key: key);

  @override
  _StateMonthalinagarapalika createState() => _StateMonthalinagarapalika();
}

class _StateMonthalinagarapalika extends State<PageMonthalinagarapalika> {
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
        'name': "Monthalinagarapalika",
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
                                    child: Text('मन्थली नगरपालिका',
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
                      Container(
                        padding: getValueForScreenType<EdgeInsets>(
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
                          mobile: 220,
                          tablet: null,
                          desktop: null,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.zero,
                        ),
                        child: SizedBox(
                          width: double.maxFinite,
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
                      Padding(
                          padding: getValueForScreenType<EdgeInsets>(
                            context: context,
                            mobile: const EdgeInsets.only(
                              left: 12,
                              top: 8,
                              right: 12,
                              bottom: 8,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                  padding: getValueForScreenType<EdgeInsets>(
                                    context: context,
                                    mobile: EdgeInsets.zero,
                                    tablet: const EdgeInsets.only(
                                      left: 6,
                                    ),
                                    desktop: const EdgeInsets.only(
                                      left: 6,
                                    ),
                                  ),
                                  child: Text('वडा कार्यालय',
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          color: BlocProvider.of<ThemeCubit>(
                                                  context)
                                              .getColor('Background / Primary'),
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
                                      maxLines: 1)),
                              Icon(
                                MdiIcons.fromString('arrow-right'),
                                size: 24,
                                color: Color(0xFFFFFFFF).withOpacity(1),
                              ),
                            ],
                          )),
                      Padding(
                          padding: getValueForScreenType<EdgeInsets>(
                            context: context,
                            mobile: const EdgeInsets.only(
                              top: 8,
                              bottom: 8,
                            ),
                            tablet: const EdgeInsets.only(
                              left: 18,
                            ),
                            desktop: const EdgeInsets.only(
                              left: 18,
                            ),
                          ),
                          child: SizedBox(
                            width: double.maxFinite,
                            height: getValueForScreenType<double?>(
                              context: context,
                              mobile: 35,
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
                                    width: getValueForScreenType<double?>(
                                      context: context,
                                      mobile: 110,
                                      tablet: double.maxFinite,
                                      desktop: double.maxFinite,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFFFFFF).withOpacity(1),
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
                                    ),
                                    child: Center(
                                      child: Text('१. मन्थली',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: BlocProvider.of<
                                                      ThemeCubit>(context)
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
                                    ),
                                  ),
                                  Container(
                                    margin: getValueForScreenType<EdgeInsets>(
                                      context: context,
                                      mobile: const EdgeInsets.only(
                                        left: 12,
                                      ),
                                      tablet: EdgeInsets.zero,
                                      desktop: EdgeInsets.zero,
                                    ),
                                    width: getValueForScreenType<double?>(
                                      context: context,
                                      mobile: 110,
                                      tablet: double.maxFinite,
                                      desktop: double.maxFinite,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFFFFFF).withOpacity(1),
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
                                    ),
                                    child: Center(
                                      child: Text('2. मन्थली',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: BlocProvider.of<
                                                      ThemeCubit>(context)
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
                                    ),
                                  ),
                                  Container(
                                    margin: getValueForScreenType<EdgeInsets>(
                                      context: context,
                                      mobile: const EdgeInsets.only(
                                        left: 12,
                                      ),
                                      tablet: EdgeInsets.zero,
                                      desktop: EdgeInsets.zero,
                                    ),
                                    width: getValueForScreenType<double?>(
                                      context: context,
                                      mobile: 110,
                                      tablet: double.maxFinite,
                                      desktop: double.maxFinite,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFFFFFF).withOpacity(1),
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
                                    ),
                                    child: Center(
                                      child: Text('३. कठजोर',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: BlocProvider.of<
                                                      ThemeCubit>(context)
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
                                    ),
                                  ),
                                  Container(
                                    margin: getValueForScreenType<EdgeInsets>(
                                      context: context,
                                      mobile: const EdgeInsets.only(
                                        left: 12,
                                      ),
                                      tablet: EdgeInsets.zero,
                                      desktop: EdgeInsets.zero,
                                    ),
                                    width: getValueForScreenType<double?>(
                                      context: context,
                                      mobile: 110,
                                      tablet: double.maxFinite,
                                      desktop: double.maxFinite,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFFFFFF).withOpacity(1),
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
                                    ),
                                    child: Center(
                                      child: Text('४. सालु',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: BlocProvider.of<
                                                      ThemeCubit>(context)
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
                                    ),
                                  ),
                                  Container(
                                    margin: getValueForScreenType<EdgeInsets>(
                                      context: context,
                                      mobile: const EdgeInsets.only(
                                        left: 12,
                                      ),
                                      tablet: EdgeInsets.zero,
                                      desktop: EdgeInsets.zero,
                                    ),
                                    width: getValueForScreenType<double?>(
                                      context: context,
                                      mobile: 110,
                                      tablet: double.maxFinite,
                                      desktop: double.maxFinite,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFFFFFF).withOpacity(1),
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
                                    ),
                                    child: Center(
                                      child: Text('५. सुनारपानी',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: BlocProvider.of<
                                                      ThemeCubit>(context)
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
                                    ),
                                  ),
                                  Container(
                                    margin: getValueForScreenType<EdgeInsets>(
                                      context: context,
                                      mobile: const EdgeInsets.only(
                                        left: 12,
                                      ),
                                      tablet: EdgeInsets.zero,
                                      desktop: EdgeInsets.zero,
                                    ),
                                    width: getValueForScreenType<double?>(
                                      context: context,
                                      mobile: 110,
                                      tablet: double.maxFinite,
                                      desktop: double.maxFinite,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFFFFFF).withOpacity(1),
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
                                    ),
                                    child: Center(
                                      child: Text('६. भलुवाजोर',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: BlocProvider.of<
                                                      ThemeCubit>(context)
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
                                    ),
                                  ),
                                  Container(
                                    margin: getValueForScreenType<EdgeInsets>(
                                      context: context,
                                      mobile: const EdgeInsets.only(
                                        left: 12,
                                      ),
                                      tablet: EdgeInsets.zero,
                                      desktop: EdgeInsets.zero,
                                    ),
                                    width: getValueForScreenType<double?>(
                                      context: context,
                                      mobile: 110,
                                      tablet: double.maxFinite,
                                      desktop: double.maxFinite,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFFFFFF).withOpacity(1),
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
                                    ),
                                    child: Center(
                                      child: Text('७. भटौली',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: BlocProvider.of<
                                                      ThemeCubit>(context)
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
                                    ),
                                  ),
                                  Container(
                                    margin: getValueForScreenType<EdgeInsets>(
                                      context: context,
                                      mobile: const EdgeInsets.only(
                                        left: 12,
                                      ),
                                      tablet: EdgeInsets.zero,
                                      desktop: EdgeInsets.zero,
                                    ),
                                    width: getValueForScreenType<double?>(
                                      context: context,
                                      mobile: 110,
                                      tablet: double.maxFinite,
                                      desktop: double.maxFinite,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFFFFFF).withOpacity(1),
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
                                    ),
                                    child: Center(
                                      child: Text('८. चिसापानी',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: BlocProvider.of<
                                                      ThemeCubit>(context)
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
                                    ),
                                  ),
                                  Container(
                                    margin: getValueForScreenType<EdgeInsets>(
                                      context: context,
                                      mobile: const EdgeInsets.only(
                                        left: 12,
                                      ),
                                      tablet: EdgeInsets.zero,
                                      desktop: EdgeInsets.zero,
                                    ),
                                    width: getValueForScreenType<double?>(
                                      context: context,
                                      mobile: 110,
                                      tablet: double.maxFinite,
                                      desktop: double.maxFinite,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFFFFFF).withOpacity(1),
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
                                    ),
                                    child: Center(
                                      child: Text('९. पुरानागाउ',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: BlocProvider.of<
                                                      ThemeCubit>(context)
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
                                    ),
                                  ),
                                  Container(
                                    margin: getValueForScreenType<EdgeInsets>(
                                      context: context,
                                      mobile: const EdgeInsets.only(
                                        left: 12,
                                      ),
                                      tablet: EdgeInsets.zero,
                                      desktop: EdgeInsets.zero,
                                    ),
                                    width: getValueForScreenType<double?>(
                                      context: context,
                                      mobile: 110,
                                      tablet: double.maxFinite,
                                      desktop: double.maxFinite,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFFFFFF).withOpacity(1),
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
                                    ),
                                    child: Center(
                                      child: Text('१०. चनखु',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: BlocProvider.of<
                                                      ThemeCubit>(context)
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
                                    ),
                                  ),
                                  Container(
                                    margin: getValueForScreenType<EdgeInsets>(
                                      context: context,
                                      mobile: const EdgeInsets.only(
                                        left: 12,
                                      ),
                                      tablet: EdgeInsets.zero,
                                      desktop: EdgeInsets.zero,
                                    ),
                                    width: getValueForScreenType<double?>(
                                      context: context,
                                      mobile: 110,
                                      tablet: double.maxFinite,
                                      desktop: double.maxFinite,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFFFFFF).withOpacity(1),
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
                                    ),
                                    child: Center(
                                      child: Text('११. गेलु',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: BlocProvider.of<
                                                      ThemeCubit>(context)
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
                                    ),
                                  ),
                                  Container(
                                    margin: getValueForScreenType<EdgeInsets>(
                                      context: context,
                                      mobile: const EdgeInsets.only(
                                        left: 12,
                                      ),
                                      tablet: EdgeInsets.zero,
                                      desktop: EdgeInsets.zero,
                                    ),
                                    width: getValueForScreenType<double?>(
                                      context: context,
                                      mobile: 110,
                                      tablet: double.maxFinite,
                                      desktop: double.maxFinite,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFFFFFF).withOpacity(1),
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
                                    ),
                                    child: Center(
                                      child: Text('१२.  नाटिला',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: BlocProvider.of<
                                                      ThemeCubit>(context)
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
                                    ),
                                  ),
                                  Container(
                                    margin: getValueForScreenType<EdgeInsets>(
                                      context: context,
                                      mobile: const EdgeInsets.only(
                                        left: 12,
                                      ),
                                      tablet: EdgeInsets.zero,
                                      desktop: EdgeInsets.zero,
                                    ),
                                    width: getValueForScreenType<double?>(
                                      context: context,
                                      mobile: 110,
                                      tablet: double.maxFinite,
                                      desktop: double.maxFinite,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFFFFFF).withOpacity(1),
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
                                    ),
                                    child: Center(
                                      child: Text('१३. फुलासी',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: BlocProvider.of<
                                                      ThemeCubit>(context)
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
                                    ),
                                  ),
                                  Container(
                                    margin: getValueForScreenType<EdgeInsets>(
                                      context: context,
                                      mobile: const EdgeInsets.only(
                                        left: 12,
                                      ),
                                      tablet: EdgeInsets.zero,
                                      desktop: EdgeInsets.zero,
                                    ),
                                    width: getValueForScreenType<double?>(
                                      context: context,
                                      mobile: 110,
                                      tablet: double.maxFinite,
                                      desktop: double.maxFinite,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFFFFFF).withOpacity(1),
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
                                    ),
                                    child: Center(
                                      child: Text('१४. मन्थली',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: BlocProvider.of<
                                                      ThemeCubit>(context)
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
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                                BorderRadius
                                                                    .zero,
                                                            child:
                                                                Image.network(
                                                              'https://blogger.googleusercontent.com/img/a/AVvXsEg3ZOe5M_V3MCqEfLm-0Y1CV_28ubGgNNd1HeoN9v1phPNkiiIdxGDwOnDgxG_0n7FHLHws6btCZpdmLDgiSFTeRXaxouCLCpS-NzsSedYA6nZcShlqgVQj1RCy5-DEAgYip9n8Snn8PVRbmUqzypnorAfTpsOtxjsv3lpnRYqsscPFPBT8ZUforZAu0g=w200-h200',
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
                                                                  '''सूचना तथा
जानकारी''',
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
                                                                  '''अन्य
सेवाहरु''',
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
                                                                BorderRadius
                                                                    .zero,
                                                            child:
                                                                Image.network(
                                                              'https://1.bp.blogspot.com/-j4wKJgQjexU/YAsGMWvCBMI/AAAAAAAA3No/FH6EvWD5ImQzA0TgaEfnlWUzopRdERaKQCLcBGAsYHQ/s320/Icone-min.png',
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
                                                                BorderRadius
                                                                    .zero,
                                                            child:
                                                                Image.network(
                                                              'https://1.bp.blogspot.com/-j4wKJgQjexU/YAsGMWvCBMI/AAAAAAAA3No/FH6EvWD5ImQzA0TgaEfnlWUzopRdERaKQCLcBGAsYHQ/s320/Icone-min.png',
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
                                                                  '''सूचना
प्रचार प्रसार''',
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
                      Padding(
                          padding: getValueForScreenType<EdgeInsets>(
                            context: context,
                            mobile: const EdgeInsets.only(
                              top: 15,
                            ),
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
