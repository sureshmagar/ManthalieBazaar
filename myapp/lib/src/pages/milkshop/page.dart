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

class PageMilkShop extends StatefulWidget {
  const PageMilkShop({
    Key? key,
    this.param1 = '''0''',
  }) : super(key: key);

  final String param1;

  @override
  _StateMilkShop createState() => _StateMilkShop();
}

class _StateMilkShop extends State<PageMilkShop> {
  WebViewXController? state1 = null;

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
        'name': "MilkShop",
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
            mobile: MediaQuery.of(context).size.height * 100 / 80,
            tablet: null,
            desktop: null,
          ),
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF).withOpacity(1),
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
                    left: 18,
                    right: 18,
                  ),
                  tablet: const EdgeInsets.only(
                    left: 2,
                  ),
                  desktop: const EdgeInsets.only(
                    left: 2,
                  ),
                ),
                child: Row(
                  children: [
                    AnimationConfiguration.staggeredList(
                      position: 1,
                      duration: Duration(
                        milliseconds: 800,
                      ),
                      child: SlideAnimation(
                        child: BouncingWidget(
                          onPressed: () async {
                            await Navigator.push<void>(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PageHomePage(),
                              ),
                            );
                          },
                          duration: const Duration(milliseconds: 100),
                          scaleFactor: 1.5,
                          child: Padding(
                              padding: getValueForScreenType<EdgeInsets>(
                                context: context,
                                mobile: EdgeInsets.zero,
                                tablet: const EdgeInsets.only(
                                  left: 16,
                                  right: 16,
                                ),
                                desktop: const EdgeInsets.only(
                                  left: 16,
                                  right: 16,
                                ),
                              ),
                              child: GestureDetector(
                                  onTap: () async {
                                    await Navigator.push<void>(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PageHomePage(),
                                      ),
                                    );
                                  },
                                  child: Padding(
                                      padding:
                                          getValueForScreenType<EdgeInsets>(
                                        context: context,
                                        mobile: EdgeInsets.zero,
                                        tablet: const EdgeInsets.only(
                                          right: 15,
                                        ),
                                        desktop: const EdgeInsets.only(
                                          right: 15,
                                        ),
                                      ),
                                      child: Card(
                                        elevation: 0,
                                        color: Color(0xFFFFFFFF).withOpacity(1),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: getValueForScreenType<
                                              BorderRadius>(
                                            context: context,
                                            mobile: BorderRadius.only(
                                              topLeft: Radius.circular(80),
                                              topRight: Radius.circular(80),
                                              bottomRight: Radius.circular(80),
                                              bottomLeft: Radius.circular(80),
                                            ),
                                            tablet: BorderRadius.only(
                                              topLeft: Radius.circular(16),
                                              topRight: Radius.circular(16),
                                              bottomRight: Radius.circular(16),
                                              bottomLeft: Radius.circular(16),
                                            ),
                                            desktop: BorderRadius.only(
                                              topLeft: Radius.circular(16),
                                              topRight: Radius.circular(16),
                                              bottomRight: Radius.circular(16),
                                              bottomLeft: Radius.circular(16),
                                            ),
                                          ),
                                        ),
                                        child: Container(
                                          margin:
                                              getValueForScreenType<EdgeInsets>(
                                            context: context,
                                            mobile: EdgeInsets.zero,
                                            tablet: const EdgeInsets.only(),
                                            desktop: const EdgeInsets.only(),
                                          ),
                                          padding:
                                              getValueForScreenType<EdgeInsets>(
                                            context: context,
                                            mobile: const EdgeInsets.only(
                                              left: 6,
                                              top: 6,
                                              right: 6,
                                              bottom: 6,
                                            ),
                                            tablet: const EdgeInsets.only(
                                              top: 16,
                                              bottom: 16,
                                            ),
                                            desktop: const EdgeInsets.only(
                                              top: 16,
                                              bottom: 16,
                                            ),
                                          ),
                                          width: getValueForScreenType<double?>(
                                            context: context,
                                            mobile: null,
                                            tablet: double.maxFinite,
                                            desktop: double.maxFinite,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFFFFFF)
                                                .withOpacity(1),
                                            borderRadius: getValueForScreenType<
                                                BorderRadius>(
                                              context: context,
                                              mobile: BorderRadius.only(
                                                topLeft: Radius.circular(80),
                                                topRight: Radius.circular(80),
                                                bottomRight:
                                                    Radius.circular(80),
                                                bottomLeft: Radius.circular(80),
                                              ),
                                              tablet: BorderRadius.only(
                                                topLeft: Radius.circular(16),
                                                topRight: Radius.circular(16),
                                                bottomRight:
                                                    Radius.circular(16),
                                                bottomLeft: Radius.circular(16),
                                              ),
                                              desktop: BorderRadius.only(
                                                topLeft: Radius.circular(16),
                                                topRight: Radius.circular(16),
                                                bottomRight:
                                                    Radius.circular(16),
                                                bottomLeft: Radius.circular(16),
                                              ),
                                            ),
                                            border:
                                                getValueForScreenType<Border>(
                                              context: context,
                                              mobile: Border(
                                                left: BorderSide(
                                                    width: 1,
                                                    color: Color(0xFF000000)
                                                        .withOpacity(1)),
                                                top: BorderSide(
                                                    width: 1,
                                                    color: Color(0xFF000000)
                                                        .withOpacity(1)),
                                                right: BorderSide(
                                                    width: 1,
                                                    color: Color(0xFF000000)
                                                        .withOpacity(1)),
                                                bottom: BorderSide(
                                                    width: 1,
                                                    color: Color(0xFF000000)
                                                        .withOpacity(1)),
                                              ),
                                              tablet: null,
                                              desktop: null,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                padding: getValueForScreenType<
                                                    EdgeInsets>(
                                                  context: context,
                                                  mobile: EdgeInsets.zero,
                                                  tablet: const EdgeInsets.only(
                                                    left: 16,
                                                    top: 16,
                                                    right: 16,
                                                    bottom: 16,
                                                  ),
                                                  desktop:
                                                      const EdgeInsets.only(
                                                    left: 16,
                                                    top: 16,
                                                    right: 16,
                                                    bottom: 16,
                                                  ),
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFFFFFFF)
                                                      .withOpacity(1),
                                                  borderRadius:
                                                      getValueForScreenType<
                                                          BorderRadius>(
                                                    context: context,
                                                    mobile: BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(80),
                                                      topRight:
                                                          Radius.circular(80),
                                                      bottomRight:
                                                          Radius.circular(80),
                                                      bottomLeft:
                                                          Radius.circular(80),
                                                    ),
                                                    tablet: BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(64),
                                                      topRight:
                                                          Radius.circular(64),
                                                      bottomRight:
                                                          Radius.circular(64),
                                                      bottomLeft:
                                                          Radius.circular(64),
                                                    ),
                                                    desktop: BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(64),
                                                      topRight:
                                                          Radius.circular(64),
                                                      bottomRight:
                                                          Radius.circular(64),
                                                      bottomLeft:
                                                          Radius.circular(64),
                                                    ),
                                                  ),
                                                  border: getValueForScreenType<
                                                      Border>(
                                                    context: context,
                                                    mobile: Border(
                                                      left: BorderSide(
                                                          width: 4,
                                                          style:
                                                              BorderStyle.none,
                                                          color: Color(
                                                                  0xFF000000)
                                                              .withOpacity(1)),
                                                      top: BorderSide(
                                                          width: 4,
                                                          style:
                                                              BorderStyle.none,
                                                          color: Color(
                                                                  0xFF000000)
                                                              .withOpacity(1)),
                                                      right: BorderSide(
                                                          width: 4,
                                                          style:
                                                              BorderStyle.none,
                                                          color: Color(
                                                                  0xFF000000)
                                                              .withOpacity(1)),
                                                      bottom: BorderSide(
                                                          width: 4,
                                                          style:
                                                              BorderStyle.none,
                                                          color: Color(
                                                                  0xFF000000)
                                                              .withOpacity(1)),
                                                    ),
                                                    tablet: null,
                                                    desktop: null,
                                                  ),
                                                ),
                                                child: Icon(
                                                  faIconNameMapping[
                                                      'arrowLeft'],
                                                  size: getValueForScreenType<
                                                      double?>(
                                                    context: context,
                                                    mobile: 25,
                                                    tablet: 24,
                                                    desktop: 24,
                                                  ),
                                                  color: Color(0xFF000000)
                                                      .withOpacity(1),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )))),
                        ),
                      ),
                    ),
                    Padding(
                        padding: getValueForScreenType<EdgeInsets>(
                          context: context,
                          mobile: const EdgeInsets.only(
                            left: 70,
                          ),
                          tablet: const EdgeInsets.only(
                            left: 50,
                          ),
                          desktop: const EdgeInsets.only(
                            left: 50,
                          ),
                        ),
                        child: Text('चिरन्जीवी डेरी',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: Color(0xFF000000).withOpacity(1),
                                fontWeight: FontWeight.w500,
                                fontSize: getValueForScreenType<double>(
                                  context: context,
                                  mobile: 22,
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
                )),
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
                    Color(0xFF288CEC).withOpacity(1)
                  ],
                  stops: [0, 1],
                ),
                borderRadius: BorderRadius.zero,
              ),
              child: SizedBox(
                width: double.maxFinite,
                height: getValueForScreenType<double?>(
                  context: context,
                  mobile: double.maxFinite,
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
                                      'https://cdn.pixabay.com/photo/2021/09/28/16/29/tea-6664999_960_720.jpg',
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
                                      'https://cdn.pixabay.com/photo/2018/10/11/14/18/tea-3739843_960_720.jpg',
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
                        width: double.maxFinite,
                        height: getValueForScreenType<double?>(
                          context: context,
                          mobile: 250,
                          tablet: null,
                          desktop: null,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.zero,
                          border: getValueForScreenType<Border>(
                            context: context,
                            mobile: Border(
                              left: BorderSide(
                                  width: 1,
                                  style: BorderStyle.none,
                                  color: Color(0xFF000000).withOpacity(1)),
                              top: BorderSide(
                                  width: 1,
                                  style: BorderStyle.none,
                                  color: Color(0xFF000000).withOpacity(1)),
                              right: BorderSide(
                                  width: 1,
                                  style: BorderStyle.none,
                                  color: Color(0xFF000000).withOpacity(1)),
                              bottom: BorderSide(
                                  width: 1,
                                  style: BorderStyle.none,
                                  color: Color(0xFF000000).withOpacity(1)),
                            ),
                            tablet: null,
                            desktop: null,
                          ),
                        ),
                        child: SizedBox(
                          width: double.maxFinite,
                          height: getValueForScreenType<double?>(
                            context: context,
                            mobile: 250,
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
                                      top: 15,
                                      bottom: 15,
                                    ),
                                    tablet: const EdgeInsets.only(
                                      left: 6,
                                    ),
                                    desktop: const EdgeInsets.only(
                                      left: 6,
                                    ),
                                  ),
                                  child: Text('प्रति लिटर (रू.)',
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
                                      maxLines: 1)),
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius:
                                        getValueForScreenType<BorderRadius>(
                                      context: context,
                                      mobile: BorderRadius.only(
                                        topLeft: Radius.circular(18),
                                        topRight: Radius.circular(0),
                                        bottomRight: Radius.circular(0),
                                        bottomLeft: Radius.circular(18),
                                      ),
                                      tablet: BorderRadius.zero,
                                      desktop: BorderRadius.zero,
                                    ),
                                    child: Image.network(
                                      'https://cdn.pixabay.com/photo/2016/12/06/18/27/milk-1887234_960_720.jpg',
                                      width: getValueForScreenType<double?>(
                                        context: context,
                                        mobile: 180,
                                        tablet: double.maxFinite,
                                        desktop: double.maxFinite,
                                      ),
                                      height: getValueForScreenType<double?>(
                                        context: context,
                                        mobile: 180,
                                        tablet: 150,
                                        desktop: 150,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        width: getValueForScreenType<double?>(
                                          context: context,
                                          mobile: 210,
                                          tablet: double.maxFinite,
                                          desktop: double.maxFinite,
                                        ),
                                        height: getValueForScreenType<double?>(
                                          context: context,
                                          mobile: 60,
                                          tablet: null,
                                          desktop: null,
                                        ),
                                        decoration: BoxDecoration(
                                          color:
                                              Color(0xFFF7FFE8).withOpacity(1),
                                          borderRadius: getValueForScreenType<
                                              BorderRadius>(
                                            context: context,
                                            mobile: BorderRadius.only(
                                              topLeft: Radius.circular(0),
                                              topRight: Radius.circular(18),
                                              bottomRight: Radius.circular(0),
                                              bottomLeft: Radius.circular(0),
                                            ),
                                            tablet: BorderRadius.zero,
                                            desktop: BorderRadius.zero,
                                          ),
                                        ),
                                        child: Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: const EdgeInsets.only(
                                                left: 16,
                                                right: 16,
                                              ),
                                              tablet: const EdgeInsets.only(
                                                left: 16,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                left: 16,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile: EdgeInsets.zero,
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        left: 8,
                                                        top: 8,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        left: 8,
                                                        top: 8,
                                                      ),
                                                    ),
                                                    child: Text('दुध',
                                                        style:
                                                            GoogleFonts.poppins(
                                                          textStyle: TextStyle(
                                                            color: Color(
                                                                    0xFF000000)
                                                                .withOpacity(1),
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize:
                                                                getValueForScreenType<
                                                                    double>(
                                                              context: context,
                                                              mobile: 24,
                                                              tablet: 20,
                                                              desktop: 20,
                                                            ),
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            decoration:
                                                                TextDecoration
                                                                    .none,
                                                          ),
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
                                                        textDirection:
                                                            TextDirection.ltr,
                                                        maxLines: 2)),
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile:
                                                          const EdgeInsets.only(
                                                        left: 80,
                                                      ),
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        left: 8,
                                                        top: 4,
                                                        bottom: 8,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        left: 8,
                                                        top: 4,
                                                        bottom: 8,
                                                      ),
                                                    ),
                                                    child: Text('रू. 80',
                                                        style:
                                                            GoogleFonts.poppins(
                                                          textStyle: TextStyle(
                                                            color: Color(
                                                                    0xFFFF0000)
                                                                .withOpacity(1),
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize:
                                                                getValueForScreenType<
                                                                    double>(
                                                              context: context,
                                                              mobile: 18,
                                                              tablet: 14,
                                                              desktop: 14,
                                                            ),
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            decoration:
                                                                TextDecoration
                                                                    .none,
                                                          ),
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
                                                        textDirection:
                                                            TextDirection.ltr,
                                                        maxLines: 1)),
                                              ],
                                            )),
                                      ),
                                      Container(
                                        width: getValueForScreenType<double?>(
                                          context: context,
                                          mobile: 210,
                                          tablet: double.maxFinite,
                                          desktop: double.maxFinite,
                                        ),
                                        height: getValueForScreenType<double?>(
                                          context: context,
                                          mobile: 60,
                                          tablet: null,
                                          desktop: null,
                                        ),
                                        decoration: BoxDecoration(
                                          color:
                                              Color(0xFFFFE5E5).withOpacity(1),
                                          borderRadius: BorderRadius.zero,
                                        ),
                                        child: Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: const EdgeInsets.only(
                                                left: 16,
                                                right: 16,
                                              ),
                                              tablet: const EdgeInsets.only(
                                                left: 16,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                left: 16,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile: EdgeInsets.zero,
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        left: 8,
                                                        top: 8,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        left: 8,
                                                        top: 8,
                                                      ),
                                                    ),
                                                    child: Text('दहि',
                                                        style:
                                                            GoogleFonts.poppins(
                                                          textStyle: TextStyle(
                                                            color: Color(
                                                                    0xFF000000)
                                                                .withOpacity(1),
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize:
                                                                getValueForScreenType<
                                                                    double>(
                                                              context: context,
                                                              mobile: 24,
                                                              tablet: 20,
                                                              desktop: 20,
                                                            ),
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            decoration:
                                                                TextDecoration
                                                                    .none,
                                                          ),
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
                                                        textDirection:
                                                            TextDirection.ltr,
                                                        maxLines: 2)),
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile:
                                                          const EdgeInsets.only(
                                                        left: 80,
                                                      ),
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        left: 8,
                                                        top: 4,
                                                        bottom: 8,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        left: 8,
                                                        top: 4,
                                                        bottom: 8,
                                                      ),
                                                    ),
                                                    child: Text('रू. 100',
                                                        style:
                                                            GoogleFonts.poppins(
                                                          textStyle: TextStyle(
                                                            color: Color(
                                                                    0xFFFF0000)
                                                                .withOpacity(1),
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize:
                                                                getValueForScreenType<
                                                                    double>(
                                                              context: context,
                                                              mobile: 18,
                                                              tablet: 14,
                                                              desktop: 14,
                                                            ),
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            decoration:
                                                                TextDecoration
                                                                    .none,
                                                          ),
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
                                                        textDirection:
                                                            TextDirection.ltr,
                                                        maxLines: 1)),
                                              ],
                                            )),
                                      ),
                                      Container(
                                        width: getValueForScreenType<double?>(
                                          context: context,
                                          mobile: 210,
                                          tablet: double.maxFinite,
                                          desktop: double.maxFinite,
                                        ),
                                        height: getValueForScreenType<double?>(
                                          context: context,
                                          mobile: 60,
                                          tablet: null,
                                          desktop: null,
                                        ),
                                        decoration: BoxDecoration(
                                          color:
                                              Color(0xFFD9F8FF).withOpacity(1),
                                          borderRadius: getValueForScreenType<
                                              BorderRadius>(
                                            context: context,
                                            mobile: BorderRadius.only(
                                              topLeft: Radius.circular(0),
                                              topRight: Radius.circular(0),
                                              bottomRight: Radius.circular(18),
                                              bottomLeft: Radius.circular(0),
                                            ),
                                            tablet: BorderRadius.zero,
                                            desktop: BorderRadius.zero,
                                          ),
                                        ),
                                        child: Padding(
                                            padding: getValueForScreenType<
                                                EdgeInsets>(
                                              context: context,
                                              mobile: const EdgeInsets.only(
                                                left: 16,
                                                right: 16,
                                              ),
                                              tablet: const EdgeInsets.only(
                                                left: 16,
                                              ),
                                              desktop: const EdgeInsets.only(
                                                left: 16,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile: EdgeInsets.zero,
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        left: 8,
                                                        top: 8,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        left: 8,
                                                        top: 8,
                                                      ),
                                                    ),
                                                    child: Text('मोही',
                                                        style:
                                                            GoogleFonts.poppins(
                                                          textStyle: TextStyle(
                                                            color: Color(
                                                                    0xFF000000)
                                                                .withOpacity(1),
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize:
                                                                getValueForScreenType<
                                                                    double>(
                                                              context: context,
                                                              mobile: 24,
                                                              tablet: 20,
                                                              desktop: 20,
                                                            ),
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            decoration:
                                                                TextDecoration
                                                                    .none,
                                                          ),
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
                                                        textDirection:
                                                            TextDirection.ltr,
                                                        maxLines: 2)),
                                                Padding(
                                                    padding:
                                                        getValueForScreenType<
                                                            EdgeInsets>(
                                                      context: context,
                                                      mobile:
                                                          const EdgeInsets.only(
                                                        left: 80,
                                                      ),
                                                      tablet:
                                                          const EdgeInsets.only(
                                                        left: 8,
                                                        top: 4,
                                                        bottom: 8,
                                                      ),
                                                      desktop:
                                                          const EdgeInsets.only(
                                                        left: 8,
                                                        top: 4,
                                                        bottom: 8,
                                                      ),
                                                    ),
                                                    child: Text('रू. 50',
                                                        style:
                                                            GoogleFonts.poppins(
                                                          textStyle: TextStyle(
                                                            color: Color(
                                                                    0xFFFF0000)
                                                                .withOpacity(1),
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize:
                                                                getValueForScreenType<
                                                                    double>(
                                                              context: context,
                                                              mobile: 18,
                                                              tablet: 14,
                                                              desktop: 14,
                                                            ),
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            decoration:
                                                                TextDecoration
                                                                    .none,
                                                          ),
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
                                                        textDirection:
                                                            TextDirection.ltr,
                                                        maxLines: 1)),
                                              ],
                                            )),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('किसान को गोठ देखि तपाइको ओठ सम्म ',
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
                            ],
                          )),
                      Container(
                        margin: getValueForScreenType<EdgeInsets>(
                          context: context,
                          mobile: const EdgeInsets.only(
                            top: 10,
                          ),
                          tablet: EdgeInsets.zero,
                          desktop: EdgeInsets.zero,
                        ),
                        width: double.maxFinite,
                        height: getValueForScreenType<double?>(
                          context: context,
                          mobile: 300,
                          tablet: null,
                          desktop: null,
                        ),
                        decoration: BoxDecoration(
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
                            mobile: 300,
                            tablet: 150,
                            desktop: 150,
                          ),
                          child: Padding(
                              padding: getValueForScreenType<EdgeInsets>(
                                context: context,
                                mobile: EdgeInsets.zero,
                                tablet: const EdgeInsets.only(
                                  top: 15,
                                ),
                                desktop: const EdgeInsets.only(
                                  top: 15,
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
                                              child: Text(
                                                  'प्रति किलो ग्राम रू.',
                                                  style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                      color: BlocProvider.of<
                                                                  ThemeCubit>(
                                                              context)
                                                          .getColor(
                                                              'Text / Primary'),
                                                      fontWeight:
                                                          FontWeight.w700,
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
                                                  maxLines: 1)),
                                          Icon(
                                            MdiIcons.fromString('arrow-right'),
                                            size: 24,
                                            color: Color(0xFF000000)
                                                .withOpacity(1),
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                        top: 8,
                                      ),
                                      child: SizedBox(
                                        width: double.maxFinite,
                                        height: getValueForScreenType<double?>(
                                          context: context,
                                          mobile: 230,
                                          tablet: 150,
                                          desktop: 150,
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
                                                  padding:
                                                      getValueForScreenType<
                                                          EdgeInsets>(
                                                    context: context,
                                                    mobile: EdgeInsets.zero,
                                                    tablet:
                                                        const EdgeInsets.only(
                                                      right: 50,
                                                    ),
                                                    desktop:
                                                        const EdgeInsets.only(
                                                      right: 50,
                                                    ),
                                                  ),
                                                  child: Card(
                                                    elevation: 8,
                                                    color: Color(0xFFFFFFFF)
                                                        .withOpacity(1),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          getValueForScreenType<
                                                              BorderRadius>(
                                                        context: context,
                                                        mobile:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  22),
                                                          topRight:
                                                              Radius.circular(
                                                                  22),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  22),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  22),
                                                        ),
                                                        tablet:
                                                            BorderRadius.zero,
                                                        desktop:
                                                            BorderRadius.zero,
                                                      ),
                                                    ),
                                                    child: Container(
                                                      width:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: 140,
                                                        tablet:
                                                            double.maxFinite,
                                                        desktop:
                                                            double.maxFinite,
                                                      ),
                                                      height:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: 150,
                                                        tablet: null,
                                                        desktop: null,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: Color(0xFFFFFFFF)
                                                            .withOpacity(1),
                                                        borderRadius:
                                                            getValueForScreenType<
                                                                BorderRadius>(
                                                          context: context,
                                                          mobile:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    18),
                                                            topRight:
                                                                Radius.circular(
                                                                    18),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    18),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    18),
                                                          ),
                                                          tablet:
                                                              BorderRadius.zero,
                                                          desktop:
                                                              BorderRadius.zero,
                                                        ),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                getValueForScreenType<
                                                                    BorderRadius>(
                                                              context: context,
                                                              mobile:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        24),
                                                                topRight: Radius
                                                                    .circular(
                                                                        24),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            0),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        0),
                                                              ),
                                                              tablet:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8),
                                                              ),
                                                              desktop:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8),
                                                              ),
                                                            ),
                                                            child:
                                                                Image.network(
                                                              'https://images.pexels.com/photos/4109947/pexels-photo-4109947.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                                                              width:
                                                                  getValueForScreenType<
                                                                      double?>(
                                                                context:
                                                                    context,
                                                                mobile: 200,
                                                                tablet: double
                                                                    .maxFinite,
                                                                desktop: double
                                                                    .maxFinite,
                                                              ),
                                                              height: 150,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                left: 8,
                                                                top: 8,
                                                              ),
                                                              child: Text(
                                                                  'पनिर',
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
                                                                              .w600,
                                                                      fontSize:
                                                                          20,
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
                                                                  maxLines: 2)),
                                                          Padding(
                                                              padding: const EdgeInsets
                                                                  .only(
                                                                left: 8,
                                                                top: 4,
                                                                bottom: 8,
                                                              ),
                                                              child: Text(
                                                                  'रू. 700',
                                                                  style: GoogleFonts
                                                                      .poppins(
                                                                    textStyle:
                                                                        TextStyle(
                                                                      color: Color(
                                                                              0xFFFF0000)
                                                                          .withOpacity(
                                                                              1),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontSize:
                                                                          14,
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
                                                      ),
                                                    ),
                                                  )),
                                              Padding(
                                                  padding:
                                                      getValueForScreenType<
                                                          EdgeInsets>(
                                                    context: context,
                                                    mobile: EdgeInsets.zero,
                                                    tablet:
                                                        const EdgeInsets.only(
                                                      right: 50,
                                                    ),
                                                    desktop:
                                                        const EdgeInsets.only(
                                                      right: 50,
                                                    ),
                                                  ),
                                                  child: Card(
                                                    elevation: 8,
                                                    color: Color(0xFFFFFFFF)
                                                        .withOpacity(1),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          getValueForScreenType<
                                                              BorderRadius>(
                                                        context: context,
                                                        mobile:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  22),
                                                          topRight:
                                                              Radius.circular(
                                                                  22),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  22),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  22),
                                                        ),
                                                        tablet:
                                                            BorderRadius.zero,
                                                        desktop:
                                                            BorderRadius.zero,
                                                      ),
                                                    ),
                                                    child: Container(
                                                      width:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: 140,
                                                        tablet:
                                                            double.maxFinite,
                                                        desktop:
                                                            double.maxFinite,
                                                      ),
                                                      height:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: 150,
                                                        tablet: null,
                                                        desktop: null,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: Color(0xFFFFFFFF)
                                                            .withOpacity(1),
                                                        borderRadius:
                                                            getValueForScreenType<
                                                                BorderRadius>(
                                                          context: context,
                                                          mobile:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    18),
                                                            topRight:
                                                                Radius.circular(
                                                                    18),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    18),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    18),
                                                          ),
                                                          tablet:
                                                              BorderRadius.zero,
                                                          desktop:
                                                              BorderRadius.zero,
                                                        ),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                getValueForScreenType<
                                                                    BorderRadius>(
                                                              context: context,
                                                              mobile:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        24),
                                                                topRight: Radius
                                                                    .circular(
                                                                        24),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            0),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        0),
                                                              ),
                                                              tablet:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8),
                                                              ),
                                                              desktop:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8),
                                                              ),
                                                            ),
                                                            child:
                                                                Image.network(
                                                              'https://images.unsplash.com/photo-1505253716362-afaea1d3d1af?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
                                                              width:
                                                                  getValueForScreenType<
                                                                      double?>(
                                                                context:
                                                                    context,
                                                                mobile: 200,
                                                                tablet: double
                                                                    .maxFinite,
                                                                desktop: double
                                                                    .maxFinite,
                                                              ),
                                                              height: 150,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                left: 8,
                                                                top: 8,
                                                              ),
                                                              child: Text(
                                                                  'खुवा',
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
                                                                              .w600,
                                                                      fontSize:
                                                                          20,
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
                                                                  maxLines: 2)),
                                                          Padding(
                                                              padding: const EdgeInsets
                                                                  .only(
                                                                left: 8,
                                                                top: 4,
                                                                bottom: 8,
                                                              ),
                                                              child: Text(
                                                                  'रू. 650',
                                                                  style: GoogleFonts
                                                                      .poppins(
                                                                    textStyle:
                                                                        TextStyle(
                                                                      color: Color(
                                                                              0xFFFF0000)
                                                                          .withOpacity(
                                                                              1),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontSize:
                                                                          14,
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
                                                      ),
                                                    ),
                                                  )),
                                              Padding(
                                                  padding:
                                                      getValueForScreenType<
                                                          EdgeInsets>(
                                                    context: context,
                                                    mobile: EdgeInsets.zero,
                                                    tablet:
                                                        const EdgeInsets.only(
                                                      right: 50,
                                                    ),
                                                    desktop:
                                                        const EdgeInsets.only(
                                                      right: 50,
                                                    ),
                                                  ),
                                                  child: Card(
                                                    elevation: 8,
                                                    color: Color(0xFFFFFFFF)
                                                        .withOpacity(1),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          getValueForScreenType<
                                                              BorderRadius>(
                                                        context: context,
                                                        mobile:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  22),
                                                          topRight:
                                                              Radius.circular(
                                                                  22),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  22),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  22),
                                                        ),
                                                        tablet:
                                                            BorderRadius.zero,
                                                        desktop:
                                                            BorderRadius.zero,
                                                      ),
                                                    ),
                                                    child: Container(
                                                      width:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: 140,
                                                        tablet:
                                                            double.maxFinite,
                                                        desktop:
                                                            double.maxFinite,
                                                      ),
                                                      height:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: 150,
                                                        tablet: null,
                                                        desktop: null,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: Color(0xFFFFFFFF)
                                                            .withOpacity(1),
                                                        borderRadius:
                                                            getValueForScreenType<
                                                                BorderRadius>(
                                                          context: context,
                                                          mobile:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    18),
                                                            topRight:
                                                                Radius.circular(
                                                                    18),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    18),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    18),
                                                          ),
                                                          tablet:
                                                              BorderRadius.zero,
                                                          desktop:
                                                              BorderRadius.zero,
                                                        ),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                getValueForScreenType<
                                                                    BorderRadius>(
                                                              context: context,
                                                              mobile:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        24),
                                                                topRight: Radius
                                                                    .circular(
                                                                        24),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            0),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        0),
                                                              ),
                                                              tablet:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8),
                                                              ),
                                                              desktop:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8),
                                                              ),
                                                            ),
                                                            child:
                                                                Image.network(
                                                              'https://cdn.apartmenttherapy.info/image/upload/f_auto,q_auto:eco,c_fill,g_center,w_730,h_913/k%2Farchive%2F143f3f127ade44d817efbf645606142e56c66317',
                                                              width:
                                                                  getValueForScreenType<
                                                                      double?>(
                                                                context:
                                                                    context,
                                                                mobile: 200,
                                                                tablet: double
                                                                    .maxFinite,
                                                                desktop: double
                                                                    .maxFinite,
                                                              ),
                                                              height: 150,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                left: 8,
                                                                top: 8,
                                                              ),
                                                              child: Text(
                                                                  'घ्यु',
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
                                                                              .w600,
                                                                      fontSize:
                                                                          20,
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
                                                                  maxLines: 2)),
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                left: 8,
                                                                top: 4,
                                                                bottom: 8,
                                                              ),
                                                              child: Text(
                                                                  'रू. 1200',
                                                                  style: GoogleFonts
                                                                      .poppins(
                                                                    textStyle:
                                                                        TextStyle(
                                                                      color: Color(
                                                                              0xFFFF0000)
                                                                          .withOpacity(
                                                                              1),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontSize:
                                                                          14,
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
                                                      ),
                                                    ),
                                                  )),
                                              Padding(
                                                  padding:
                                                      getValueForScreenType<
                                                          EdgeInsets>(
                                                    context: context,
                                                    mobile: EdgeInsets.zero,
                                                    tablet:
                                                        const EdgeInsets.only(
                                                      right: 50,
                                                    ),
                                                    desktop:
                                                        const EdgeInsets.only(
                                                      right: 50,
                                                    ),
                                                  ),
                                                  child: Card(
                                                    elevation: 8,
                                                    color: Color(0xFFFFFFFF)
                                                        .withOpacity(1),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          getValueForScreenType<
                                                              BorderRadius>(
                                                        context: context,
                                                        mobile:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  22),
                                                          topRight:
                                                              Radius.circular(
                                                                  22),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  22),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  22),
                                                        ),
                                                        tablet:
                                                            BorderRadius.zero,
                                                        desktop:
                                                            BorderRadius.zero,
                                                      ),
                                                    ),
                                                    child: Container(
                                                      width:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: 140,
                                                        tablet:
                                                            double.maxFinite,
                                                        desktop:
                                                            double.maxFinite,
                                                      ),
                                                      height:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: 150,
                                                        tablet: null,
                                                        desktop: null,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: Color(0xFFFFFFFF)
                                                            .withOpacity(1),
                                                        borderRadius:
                                                            getValueForScreenType<
                                                                BorderRadius>(
                                                          context: context,
                                                          mobile:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    18),
                                                            topRight:
                                                                Radius.circular(
                                                                    18),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    18),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    18),
                                                          ),
                                                          tablet:
                                                              BorderRadius.zero,
                                                          desktop:
                                                              BorderRadius.zero,
                                                        ),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                getValueForScreenType<
                                                                    BorderRadius>(
                                                              context: context,
                                                              mobile:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        24),
                                                                topRight: Radius
                                                                    .circular(
                                                                        24),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            0),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        0),
                                                              ),
                                                              tablet:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8),
                                                              ),
                                                              desktop:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8),
                                                              ),
                                                            ),
                                                            child:
                                                                Image.network(
                                                              'https://images.unsplash.com/photo-1505253716362-afaea1d3d1af?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
                                                              width:
                                                                  getValueForScreenType<
                                                                      double?>(
                                                                context:
                                                                    context,
                                                                mobile: 200,
                                                                tablet: double
                                                                    .maxFinite,
                                                                desktop: double
                                                                    .maxFinite,
                                                              ),
                                                              height: 150,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                left: 8,
                                                                top: 8,
                                                              ),
                                                              child: Text(
                                                                  'छुर्पि',
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
                                                                              .w600,
                                                                      fontSize:
                                                                          20,
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
                                                                  maxLines: 2)),
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                left: 8,
                                                                top: 4,
                                                                bottom: 8,
                                                              ),
                                                              child: Text(
                                                                  'रू. 1000',
                                                                  style: GoogleFonts
                                                                      .poppins(
                                                                    textStyle:
                                                                        TextStyle(
                                                                      color: Color(
                                                                              0xFFFF0000)
                                                                          .withOpacity(
                                                                              1),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontSize:
                                                                          14,
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
                                                      ),
                                                    ),
                                                  )),
                                              Padding(
                                                  padding:
                                                      getValueForScreenType<
                                                          EdgeInsets>(
                                                    context: context,
                                                    mobile: EdgeInsets.zero,
                                                    tablet:
                                                        const EdgeInsets.only(
                                                      right: 50,
                                                    ),
                                                    desktop:
                                                        const EdgeInsets.only(
                                                      right: 50,
                                                    ),
                                                  ),
                                                  child: Card(
                                                    elevation: 8,
                                                    color: Color(0xFFFFFFFF)
                                                        .withOpacity(1),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          getValueForScreenType<
                                                              BorderRadius>(
                                                        context: context,
                                                        mobile:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  22),
                                                          topRight:
                                                              Radius.circular(
                                                                  22),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  22),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  22),
                                                        ),
                                                        tablet:
                                                            BorderRadius.zero,
                                                        desktop:
                                                            BorderRadius.zero,
                                                      ),
                                                    ),
                                                    child: Container(
                                                      width:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: 140,
                                                        tablet:
                                                            double.maxFinite,
                                                        desktop:
                                                            double.maxFinite,
                                                      ),
                                                      height:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: 150,
                                                        tablet: null,
                                                        desktop: null,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: Color(0xFFFFFFFF)
                                                            .withOpacity(1),
                                                        borderRadius:
                                                            getValueForScreenType<
                                                                BorderRadius>(
                                                          context: context,
                                                          mobile:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    18),
                                                            topRight:
                                                                Radius.circular(
                                                                    18),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    18),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    18),
                                                          ),
                                                          tablet:
                                                              BorderRadius.zero,
                                                          desktop:
                                                              BorderRadius.zero,
                                                        ),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                getValueForScreenType<
                                                                    BorderRadius>(
                                                              context: context,
                                                              mobile:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        24),
                                                                topRight: Radius
                                                                    .circular(
                                                                        24),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            0),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        0),
                                                              ),
                                                              tablet:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8),
                                                              ),
                                                              desktop:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8),
                                                              ),
                                                            ),
                                                            child:
                                                                Image.network(
                                                              'https://images.unsplash.com/photo-1505253716362-afaea1d3d1af?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
                                                              width:
                                                                  getValueForScreenType<
                                                                      double?>(
                                                                context:
                                                                    context,
                                                                mobile: 200,
                                                                tablet: double
                                                                    .maxFinite,
                                                                desktop: double
                                                                    .maxFinite,
                                                              ),
                                                              height: 150,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                left: 8,
                                                                top: 8,
                                                              ),
                                                              child: Text(
                                                                  'पुस्टकारी ',
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
                                                                              .w600,
                                                                      fontSize:
                                                                          20,
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
                                                                  maxLines: 2)),
                                                          Padding(
                                                              padding: const EdgeInsets
                                                                  .only(
                                                                left: 8,
                                                                top: 4,
                                                                bottom: 8,
                                                              ),
                                                              child: Text(
                                                                  'रू. 600',
                                                                  style: GoogleFonts
                                                                      .poppins(
                                                                    textStyle:
                                                                        TextStyle(
                                                                      color: Color(
                                                                              0xFFFF0000)
                                                                          .withOpacity(
                                                                              1),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontSize:
                                                                          14,
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
                                                      ),
                                                    ),
                                                  )),
                                              Padding(
                                                  padding:
                                                      getValueForScreenType<
                                                          EdgeInsets>(
                                                    context: context,
                                                    mobile: EdgeInsets.zero,
                                                    tablet:
                                                        const EdgeInsets.only(
                                                      right: 50,
                                                    ),
                                                    desktop:
                                                        const EdgeInsets.only(
                                                      right: 50,
                                                    ),
                                                  ),
                                                  child: Card(
                                                    elevation: 8,
                                                    color: Color(0xFFFFFFFF)
                                                        .withOpacity(1),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          getValueForScreenType<
                                                              BorderRadius>(
                                                        context: context,
                                                        mobile:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  22),
                                                          topRight:
                                                              Radius.circular(
                                                                  22),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  22),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  22),
                                                        ),
                                                        tablet:
                                                            BorderRadius.zero,
                                                        desktop:
                                                            BorderRadius.zero,
                                                      ),
                                                    ),
                                                    child: Container(
                                                      width:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: 140,
                                                        tablet:
                                                            double.maxFinite,
                                                        desktop:
                                                            double.maxFinite,
                                                      ),
                                                      height:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: 150,
                                                        tablet: null,
                                                        desktop: null,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: Color(0xFFFFFFFF)
                                                            .withOpacity(1),
                                                        borderRadius:
                                                            getValueForScreenType<
                                                                BorderRadius>(
                                                          context: context,
                                                          mobile:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    18),
                                                            topRight:
                                                                Radius.circular(
                                                                    18),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    18),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    18),
                                                          ),
                                                          tablet:
                                                              BorderRadius.zero,
                                                          desktop:
                                                              BorderRadius.zero,
                                                        ),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                getValueForScreenType<
                                                                    BorderRadius>(
                                                              context: context,
                                                              mobile:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        24),
                                                                topRight: Radius
                                                                    .circular(
                                                                        24),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            0),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        0),
                                                              ),
                                                              tablet:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8),
                                                              ),
                                                              desktop:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8),
                                                              ),
                                                            ),
                                                            child:
                                                                Image.network(
                                                              'https://images.unsplash.com/photo-1505253716362-afaea1d3d1af?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
                                                              width:
                                                                  getValueForScreenType<
                                                                      double?>(
                                                                context:
                                                                    context,
                                                                mobile: 200,
                                                                tablet: double
                                                                    .maxFinite,
                                                                desktop: double
                                                                    .maxFinite,
                                                              ),
                                                              height: 150,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                left: 8,
                                                                top: 8,
                                                              ),
                                                              child: Text(
                                                                  'गुदपाक',
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
                                                                              .w600,
                                                                      fontSize:
                                                                          20,
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
                                                                  maxLines: 2)),
                                                          Padding(
                                                              padding: const EdgeInsets
                                                                  .only(
                                                                left: 8,
                                                                top: 4,
                                                                bottom: 8,
                                                              ),
                                                              child: Text(
                                                                  'रू. 700',
                                                                  style: GoogleFonts
                                                                      .poppins(
                                                                    textStyle:
                                                                        TextStyle(
                                                                      color: Color(
                                                                              0xFFFF0000)
                                                                          .withOpacity(
                                                                              1),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontSize:
                                                                          14,
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
                                                      ),
                                                    ),
                                                  )),
                                              Padding(
                                                  padding:
                                                      getValueForScreenType<
                                                          EdgeInsets>(
                                                    context: context,
                                                    mobile: EdgeInsets.zero,
                                                    tablet:
                                                        const EdgeInsets.only(
                                                      right: 50,
                                                    ),
                                                    desktop:
                                                        const EdgeInsets.only(
                                                      right: 50,
                                                    ),
                                                  ),
                                                  child: Card(
                                                    elevation: 8,
                                                    color: Color(0xFFFFFFFF)
                                                        .withOpacity(1),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          getValueForScreenType<
                                                              BorderRadius>(
                                                        context: context,
                                                        mobile:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  22),
                                                          topRight:
                                                              Radius.circular(
                                                                  22),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  22),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  22),
                                                        ),
                                                        tablet:
                                                            BorderRadius.zero,
                                                        desktop:
                                                            BorderRadius.zero,
                                                      ),
                                                    ),
                                                    child: Container(
                                                      width:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: 140,
                                                        tablet:
                                                            double.maxFinite,
                                                        desktop:
                                                            double.maxFinite,
                                                      ),
                                                      height:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: 150,
                                                        tablet: null,
                                                        desktop: null,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: Color(0xFFFFFFFF)
                                                            .withOpacity(1),
                                                        borderRadius:
                                                            getValueForScreenType<
                                                                BorderRadius>(
                                                          context: context,
                                                          mobile:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    18),
                                                            topRight:
                                                                Radius.circular(
                                                                    18),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    18),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    18),
                                                          ),
                                                          tablet:
                                                              BorderRadius.zero,
                                                          desktop:
                                                              BorderRadius.zero,
                                                        ),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                getValueForScreenType<
                                                                    BorderRadius>(
                                                              context: context,
                                                              mobile:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        24),
                                                                topRight: Radius
                                                                    .circular(
                                                                        24),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            0),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        0),
                                                              ),
                                                              tablet:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8),
                                                              ),
                                                              desktop:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8),
                                                              ),
                                                            ),
                                                            child:
                                                                Image.network(
                                                              'https://images.unsplash.com/photo-1505253716362-afaea1d3d1af?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
                                                              width:
                                                                  getValueForScreenType<
                                                                      double?>(
                                                                context:
                                                                    context,
                                                                mobile: 200,
                                                                tablet: double
                                                                    .maxFinite,
                                                                desktop: double
                                                                    .maxFinite,
                                                              ),
                                                              height: 150,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                left: 8,
                                                                top: 8,
                                                              ),
                                                              child: Text(
                                                                  'पेडा / बर्फी',
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
                                                                              .w600,
                                                                      fontSize:
                                                                          20,
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
                                                                  maxLines: 2)),
                                                          Padding(
                                                              padding: const EdgeInsets
                                                                  .only(
                                                                left: 8,
                                                                top: 4,
                                                                bottom: 8,
                                                              ),
                                                              child: Text(
                                                                  'रू. 700',
                                                                  style: GoogleFonts
                                                                      .poppins(
                                                                    textStyle:
                                                                        TextStyle(
                                                                      color: Color(
                                                                              0xFFFF0000)
                                                                          .withOpacity(
                                                                              1),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontSize:
                                                                          14,
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
                                                      ),
                                                    ),
                                                  )),
                                            ],
                                          ),
                                        ),
                                      )),
                                ],
                              )),
                        ),
                      ),
                      Padding(
                          padding: getValueForScreenType<EdgeInsets>(
                            context: context,
                            mobile: const EdgeInsets.only(
                              bottom: 10,
                            ),
                            tablet: const EdgeInsets.only(
                              top: 10,
                            ),
                            desktop: const EdgeInsets.only(
                              top: 10,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  '''स्थान: बीच बजार (जि.स.स. अगाडि) / NIBL बैंक भएको घर
फोन: 048-540216, 048-540668''',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Color(0xFF000000).withOpacity(1),
                                      fontWeight: FontWeight.w400,
                                      fontSize: getValueForScreenType<double>(
                                        context: context,
                                        mobile: 15,
                                        tablet: 16,
                                        desktop: 16,
                                      ),
                                      fontStyle: FontStyle.normal,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                  textAlign: TextAlign.left,
                                  textDirection: TextDirection.ltr,
                                  maxLines: 2),
                            ],
                          )),
                      Container(
                        margin: getValueForScreenType<EdgeInsets>(
                          context: context,
                          mobile: const EdgeInsets.only(
                            top: 10,
                          ),
                          tablet: EdgeInsets.zero,
                          desktop: EdgeInsets.zero,
                        ),
                        width: double.maxFinite,
                        height: getValueForScreenType<double?>(
                          context: context,
                          mobile: 280,
                          tablet: null,
                          desktop: null,
                        ),
                        decoration: BoxDecoration(
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
                            mobile: 300,
                            tablet: 150,
                            desktop: 150,
                          ),
                          child: Padding(
                              padding: getValueForScreenType<EdgeInsets>(
                                context: context,
                                mobile: EdgeInsets.zero,
                                tablet: const EdgeInsets.only(
                                  top: 15,
                                ),
                                desktop: const EdgeInsets.only(
                                  top: 15,
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
                                              child: Text('प्रति कप (रू.)',
                                                  style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                      color: BlocProvider.of<
                                                                  ThemeCubit>(
                                                              context)
                                                          .getColor(
                                                              'Text / Primary'),
                                                      fontWeight:
                                                          FontWeight.w700,
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
                                                  maxLines: 1)),
                                          Icon(
                                            MdiIcons.fromString('arrow-right'),
                                            size: 24,
                                            color: Color(0xFF000000)
                                                .withOpacity(1),
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                        top: 8,
                                      ),
                                      child: SizedBox(
                                        width: double.maxFinite,
                                        height: getValueForScreenType<double?>(
                                          context: context,
                                          mobile: 230,
                                          tablet: 150,
                                          desktop: 150,
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
                                                  padding:
                                                      getValueForScreenType<
                                                          EdgeInsets>(
                                                    context: context,
                                                    mobile: EdgeInsets.zero,
                                                    tablet:
                                                        const EdgeInsets.only(
                                                      right: 50,
                                                    ),
                                                    desktop:
                                                        const EdgeInsets.only(
                                                      right: 50,
                                                    ),
                                                  ),
                                                  child: Card(
                                                    elevation: 8,
                                                    color: Color(0xFFFFFFFF)
                                                        .withOpacity(1),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          getValueForScreenType<
                                                              BorderRadius>(
                                                        context: context,
                                                        mobile:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  22),
                                                          topRight:
                                                              Radius.circular(
                                                                  22),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  22),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  22),
                                                        ),
                                                        tablet:
                                                            BorderRadius.zero,
                                                        desktop:
                                                            BorderRadius.zero,
                                                      ),
                                                    ),
                                                    child: Container(
                                                      width:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: 140,
                                                        tablet:
                                                            double.maxFinite,
                                                        desktop:
                                                            double.maxFinite,
                                                      ),
                                                      height:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: 150,
                                                        tablet: null,
                                                        desktop: null,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: Color(0xFFFFFFFF)
                                                            .withOpacity(1),
                                                        borderRadius:
                                                            getValueForScreenType<
                                                                BorderRadius>(
                                                          context: context,
                                                          mobile:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    18),
                                                            topRight:
                                                                Radius.circular(
                                                                    18),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    18),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    18),
                                                          ),
                                                          tablet:
                                                              BorderRadius.zero,
                                                          desktop:
                                                              BorderRadius.zero,
                                                        ),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                getValueForScreenType<
                                                                    BorderRadius>(
                                                              context: context,
                                                              mobile:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        24),
                                                                topRight: Radius
                                                                    .circular(
                                                                        24),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            0),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        0),
                                                              ),
                                                              tablet:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8),
                                                              ),
                                                              desktop:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8),
                                                              ),
                                                            ),
                                                            child:
                                                                Image.network(
                                                              'https://images.unsplash.com/photo-1544787219-7f47ccb76574?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=421&q=80',
                                                              width:
                                                                  getValueForScreenType<
                                                                      double?>(
                                                                context:
                                                                    context,
                                                                mobile: 200,
                                                                tablet: double
                                                                    .maxFinite,
                                                                desktop: double
                                                                    .maxFinite,
                                                              ),
                                                              height: 150,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                left: 8,
                                                                top: 8,
                                                              ),
                                                              child: Text(
                                                                  'चिया',
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
                                                                              .w600,
                                                                      fontSize:
                                                                          20,
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
                                                                  maxLines: 2)),
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                left: 8,
                                                                top: 4,
                                                                bottom: 8,
                                                              ),
                                                              child: Text(
                                                                  'रू. 20',
                                                                  style: GoogleFonts
                                                                      .poppins(
                                                                    textStyle:
                                                                        TextStyle(
                                                                      color: Color(
                                                                              0xFFFF0000)
                                                                          .withOpacity(
                                                                              1),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontSize:
                                                                          14,
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
                                                      ),
                                                    ),
                                                  )),
                                              Padding(
                                                  padding:
                                                      getValueForScreenType<
                                                          EdgeInsets>(
                                                    context: context,
                                                    mobile: EdgeInsets.zero,
                                                    tablet:
                                                        const EdgeInsets.only(
                                                      right: 50,
                                                    ),
                                                    desktop:
                                                        const EdgeInsets.only(
                                                      right: 50,
                                                    ),
                                                  ),
                                                  child: Card(
                                                    elevation: 8,
                                                    color: Color(0xFFFFFFFF)
                                                        .withOpacity(1),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          getValueForScreenType<
                                                              BorderRadius>(
                                                        context: context,
                                                        mobile:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  22),
                                                          topRight:
                                                              Radius.circular(
                                                                  22),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  22),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  22),
                                                        ),
                                                        tablet:
                                                            BorderRadius.zero,
                                                        desktop:
                                                            BorderRadius.zero,
                                                      ),
                                                    ),
                                                    child: Container(
                                                      width:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: 140,
                                                        tablet:
                                                            double.maxFinite,
                                                        desktop:
                                                            double.maxFinite,
                                                      ),
                                                      height:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: 150,
                                                        tablet: null,
                                                        desktop: null,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: Color(0xFFFFFFFF)
                                                            .withOpacity(1),
                                                        borderRadius:
                                                            getValueForScreenType<
                                                                BorderRadius>(
                                                          context: context,
                                                          mobile:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    18),
                                                            topRight:
                                                                Radius.circular(
                                                                    18),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    18),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    18),
                                                          ),
                                                          tablet:
                                                              BorderRadius.zero,
                                                          desktop:
                                                              BorderRadius.zero,
                                                        ),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                getValueForScreenType<
                                                                    BorderRadius>(
                                                              context: context,
                                                              mobile:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        24),
                                                                topRight: Radius
                                                                    .circular(
                                                                        24),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            0),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        0),
                                                              ),
                                                              tablet:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8),
                                                              ),
                                                              desktop:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8),
                                                              ),
                                                            ),
                                                            child:
                                                                Image.network(
                                                              'https://images.unsplash.com/photo-1506372023823-741c83b836fe?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
                                                              width:
                                                                  getValueForScreenType<
                                                                      double?>(
                                                                context:
                                                                    context,
                                                                mobile: 200,
                                                                tablet: double
                                                                    .maxFinite,
                                                                desktop: double
                                                                    .maxFinite,
                                                              ),
                                                              height: 150,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                left: 8,
                                                                top: 8,
                                                              ),
                                                              child: Text('कफी',
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
                                                                              .w600,
                                                                      fontSize:
                                                                          20,
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
                                                                  maxLines: 2)),
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                left: 8,
                                                                top: 4,
                                                                bottom: 8,
                                                              ),
                                                              child: Text(
                                                                  'रू. 50',
                                                                  style: GoogleFonts
                                                                      .poppins(
                                                                    textStyle:
                                                                        TextStyle(
                                                                      color: Color(
                                                                              0xFFFF0000)
                                                                          .withOpacity(
                                                                              1),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontSize:
                                                                          14,
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
                                                      ),
                                                    ),
                                                  )),
                                              Padding(
                                                  padding:
                                                      getValueForScreenType<
                                                          EdgeInsets>(
                                                    context: context,
                                                    mobile: EdgeInsets.zero,
                                                    tablet:
                                                        const EdgeInsets.only(
                                                      right: 50,
                                                    ),
                                                    desktop:
                                                        const EdgeInsets.only(
                                                      right: 50,
                                                    ),
                                                  ),
                                                  child: Card(
                                                    elevation: 8,
                                                    color: Color(0xFFFFFFFF)
                                                        .withOpacity(1),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          getValueForScreenType<
                                                              BorderRadius>(
                                                        context: context,
                                                        mobile:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  22),
                                                          topRight:
                                                              Radius.circular(
                                                                  22),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  22),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  22),
                                                        ),
                                                        tablet:
                                                            BorderRadius.zero,
                                                        desktop:
                                                            BorderRadius.zero,
                                                      ),
                                                    ),
                                                    child: Container(
                                                      width:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: 140,
                                                        tablet:
                                                            double.maxFinite,
                                                        desktop:
                                                            double.maxFinite,
                                                      ),
                                                      height:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: 150,
                                                        tablet: null,
                                                        desktop: null,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: Color(0xFFFFFFFF)
                                                            .withOpacity(1),
                                                        borderRadius:
                                                            getValueForScreenType<
                                                                BorderRadius>(
                                                          context: context,
                                                          mobile:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    18),
                                                            topRight:
                                                                Radius.circular(
                                                                    18),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    18),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    18),
                                                          ),
                                                          tablet:
                                                              BorderRadius.zero,
                                                          desktop:
                                                              BorderRadius.zero,
                                                        ),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                getValueForScreenType<
                                                                    BorderRadius>(
                                                              context: context,
                                                              mobile:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        24),
                                                                topRight: Radius
                                                                    .circular(
                                                                        24),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            0),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        0),
                                                              ),
                                                              tablet:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8),
                                                              ),
                                                              desktop:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8),
                                                              ),
                                                            ),
                                                            child:
                                                                Image.network(
                                                              'https://images.unsplash.com/photo-1650265929240-fbf163e0d003?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
                                                              width:
                                                                  getValueForScreenType<
                                                                      double?>(
                                                                context:
                                                                    context,
                                                                mobile: 200,
                                                                tablet: double
                                                                    .maxFinite,
                                                                desktop: double
                                                                    .maxFinite,
                                                              ),
                                                              height: 150,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                left: 8,
                                                                top: 8,
                                                              ),
                                                              child: Text(
                                                                  'बनाना सेक',
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
                                                                              .w600,
                                                                      fontSize:
                                                                          20,
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
                                                                  maxLines: 2)),
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                left: 8,
                                                                top: 4,
                                                                bottom: 8,
                                                              ),
                                                              child: Text(
                                                                  'रू. 80',
                                                                  style: GoogleFonts
                                                                      .poppins(
                                                                    textStyle:
                                                                        TextStyle(
                                                                      color: Color(
                                                                              0xFFFF0000)
                                                                          .withOpacity(
                                                                              1),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontSize:
                                                                          14,
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
                                                      ),
                                                    ),
                                                  )),
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
                            top: 20,
                          ),
                          tablet: EdgeInsets.zero,
                          desktop: EdgeInsets.zero,
                        ),
                        width: double.maxFinite,
                        height: getValueForScreenType<double?>(
                          context: context,
                          mobile: 300,
                          tablet: null,
                          desktop: null,
                        ),
                        decoration: BoxDecoration(
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
                            mobile: 300,
                            tablet: 150,
                            desktop: 150,
                          ),
                          child: Padding(
                              padding: getValueForScreenType<EdgeInsets>(
                                context: context,
                                mobile: EdgeInsets.zero,
                                tablet: const EdgeInsets.only(
                                  top: 15,
                                ),
                                desktop: const EdgeInsets.only(
                                  top: 15,
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
                                              child: Text('प्रति गिलास (रू.)',
                                                  style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                      color: BlocProvider.of<
                                                                  ThemeCubit>(
                                                              context)
                                                          .getColor(
                                                              'Text / Primary'),
                                                      fontWeight:
                                                          FontWeight.w700,
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
                                                  maxLines: 1)),
                                          Icon(
                                            MdiIcons.fromString('arrow-right'),
                                            size: 24,
                                            color: Color(0xFF000000)
                                                .withOpacity(1),
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                        top: 8,
                                      ),
                                      child: SizedBox(
                                        width: double.maxFinite,
                                        height: getValueForScreenType<double?>(
                                          context: context,
                                          mobile: 230,
                                          tablet: 150,
                                          desktop: 150,
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
                                                  padding:
                                                      getValueForScreenType<
                                                          EdgeInsets>(
                                                    context: context,
                                                    mobile: EdgeInsets.zero,
                                                    tablet:
                                                        const EdgeInsets.only(
                                                      right: 50,
                                                    ),
                                                    desktop:
                                                        const EdgeInsets.only(
                                                      right: 50,
                                                    ),
                                                  ),
                                                  child: Card(
                                                    elevation: 8,
                                                    color: Color(0xFFFFFFFF)
                                                        .withOpacity(1),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          getValueForScreenType<
                                                              BorderRadius>(
                                                        context: context,
                                                        mobile:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  22),
                                                          topRight:
                                                              Radius.circular(
                                                                  22),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  22),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  22),
                                                        ),
                                                        tablet:
                                                            BorderRadius.zero,
                                                        desktop:
                                                            BorderRadius.zero,
                                                      ),
                                                    ),
                                                    child: Container(
                                                      width:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: 140,
                                                        tablet:
                                                            double.maxFinite,
                                                        desktop:
                                                            double.maxFinite,
                                                      ),
                                                      height:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: 150,
                                                        tablet: null,
                                                        desktop: null,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: Color(0xFFFFFFFF)
                                                            .withOpacity(1),
                                                        borderRadius:
                                                            getValueForScreenType<
                                                                BorderRadius>(
                                                          context: context,
                                                          mobile:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    18),
                                                            topRight:
                                                                Radius.circular(
                                                                    18),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    18),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    18),
                                                          ),
                                                          tablet:
                                                              BorderRadius.zero,
                                                          desktop:
                                                              BorderRadius.zero,
                                                        ),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                getValueForScreenType<
                                                                    BorderRadius>(
                                                              context: context,
                                                              mobile:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        24),
                                                                topRight: Radius
                                                                    .circular(
                                                                        24),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            0),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        0),
                                                              ),
                                                              tablet:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8),
                                                              ),
                                                              desktop:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8),
                                                              ),
                                                            ),
                                                            child:
                                                                Image.network(
                                                              'https://images.unsplash.com/photo-1615702392909-5e02456a4c27?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80',
                                                              width:
                                                                  getValueForScreenType<
                                                                      double?>(
                                                                context:
                                                                    context,
                                                                mobile: 200,
                                                                tablet: double
                                                                    .maxFinite,
                                                                desktop: double
                                                                    .maxFinite,
                                                              ),
                                                              height: 150,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                left: 8,
                                                                top: 8,
                                                              ),
                                                              child: Text('दुध',
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
                                                                              .w600,
                                                                      fontSize:
                                                                          20,
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
                                                                  maxLines: 2)),
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                left: 8,
                                                                top: 4,
                                                                bottom: 8,
                                                              ),
                                                              child: Text(
                                                                  'रू. 25',
                                                                  style: GoogleFonts
                                                                      .poppins(
                                                                    textStyle:
                                                                        TextStyle(
                                                                      color: Color(
                                                                              0xFFFF0000)
                                                                          .withOpacity(
                                                                              1),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontSize:
                                                                          14,
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
                                                      ),
                                                    ),
                                                  )),
                                              Padding(
                                                  padding:
                                                      getValueForScreenType<
                                                          EdgeInsets>(
                                                    context: context,
                                                    mobile: EdgeInsets.zero,
                                                    tablet:
                                                        const EdgeInsets.only(
                                                      right: 50,
                                                    ),
                                                    desktop:
                                                        const EdgeInsets.only(
                                                      right: 50,
                                                    ),
                                                  ),
                                                  child: Card(
                                                    elevation: 8,
                                                    color: Color(0xFFFFFFFF)
                                                        .withOpacity(1),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          getValueForScreenType<
                                                              BorderRadius>(
                                                        context: context,
                                                        mobile:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  22),
                                                          topRight:
                                                              Radius.circular(
                                                                  22),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  22),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  22),
                                                        ),
                                                        tablet:
                                                            BorderRadius.zero,
                                                        desktop:
                                                            BorderRadius.zero,
                                                      ),
                                                    ),
                                                    child: Container(
                                                      width:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: 140,
                                                        tablet:
                                                            double.maxFinite,
                                                        desktop:
                                                            double.maxFinite,
                                                      ),
                                                      height:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: 150,
                                                        tablet: null,
                                                        desktop: null,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: Color(0xFFFFFFFF)
                                                            .withOpacity(1),
                                                        borderRadius:
                                                            getValueForScreenType<
                                                                BorderRadius>(
                                                          context: context,
                                                          mobile:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    18),
                                                            topRight:
                                                                Radius.circular(
                                                                    18),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    18),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    18),
                                                          ),
                                                          tablet:
                                                              BorderRadius.zero,
                                                          desktop:
                                                              BorderRadius.zero,
                                                        ),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                getValueForScreenType<
                                                                    BorderRadius>(
                                                              context: context,
                                                              mobile:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        24),
                                                                topRight: Radius
                                                                    .circular(
                                                                        24),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            0),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        0),
                                                              ),
                                                              tablet:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8),
                                                              ),
                                                              desktop:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8),
                                                              ),
                                                            ),
                                                            child:
                                                                Image.network(
                                                              'https://images.unsplash.com/photo-1505253716362-afaea1d3d1af?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
                                                              width:
                                                                  getValueForScreenType<
                                                                      double?>(
                                                                context:
                                                                    context,
                                                                mobile: 200,
                                                                tablet: double
                                                                    .maxFinite,
                                                                desktop: double
                                                                    .maxFinite,
                                                              ),
                                                              height: 150,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                left: 8,
                                                                top: 8,
                                                              ),
                                                              child: Text('दहि',
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
                                                                              .w600,
                                                                      fontSize:
                                                                          20,
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
                                                                  maxLines: 2)),
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                left: 8,
                                                                top: 4,
                                                                bottom: 8,
                                                              ),
                                                              child: Text(
                                                                  'रू. 30',
                                                                  style: GoogleFonts
                                                                      .poppins(
                                                                    textStyle:
                                                                        TextStyle(
                                                                      color: Color(
                                                                              0xFFFF0000)
                                                                          .withOpacity(
                                                                              1),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontSize:
                                                                          14,
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
                                                      ),
                                                    ),
                                                  )),
                                              Padding(
                                                  padding:
                                                      getValueForScreenType<
                                                          EdgeInsets>(
                                                    context: context,
                                                    mobile: EdgeInsets.zero,
                                                    tablet:
                                                        const EdgeInsets.only(
                                                      right: 50,
                                                    ),
                                                    desktop:
                                                        const EdgeInsets.only(
                                                      right: 50,
                                                    ),
                                                  ),
                                                  child: Card(
                                                    elevation: 8,
                                                    color: Color(0xFFFFFFFF)
                                                        .withOpacity(1),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          getValueForScreenType<
                                                              BorderRadius>(
                                                        context: context,
                                                        mobile:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  22),
                                                          topRight:
                                                              Radius.circular(
                                                                  22),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  22),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  22),
                                                        ),
                                                        tablet:
                                                            BorderRadius.zero,
                                                        desktop:
                                                            BorderRadius.zero,
                                                      ),
                                                    ),
                                                    child: Container(
                                                      width:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: 140,
                                                        tablet:
                                                            double.maxFinite,
                                                        desktop:
                                                            double.maxFinite,
                                                      ),
                                                      height:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: 150,
                                                        tablet: null,
                                                        desktop: null,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: Color(0xFFFFFFFF)
                                                            .withOpacity(1),
                                                        borderRadius:
                                                            getValueForScreenType<
                                                                BorderRadius>(
                                                          context: context,
                                                          mobile:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    18),
                                                            topRight:
                                                                Radius.circular(
                                                                    18),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    18),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    18),
                                                          ),
                                                          tablet:
                                                              BorderRadius.zero,
                                                          desktop:
                                                              BorderRadius.zero,
                                                        ),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                getValueForScreenType<
                                                                    BorderRadius>(
                                                              context: context,
                                                              mobile:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        24),
                                                                topRight: Radius
                                                                    .circular(
                                                                        24),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            0),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        0),
                                                              ),
                                                              tablet:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8),
                                                              ),
                                                              desktop:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8),
                                                              ),
                                                            ),
                                                            child:
                                                                Image.network(
                                                              'https://images.unsplash.com/photo-1505253716362-afaea1d3d1af?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
                                                              width:
                                                                  getValueForScreenType<
                                                                      double?>(
                                                                context:
                                                                    context,
                                                                mobile: 200,
                                                                tablet: double
                                                                    .maxFinite,
                                                                desktop: double
                                                                    .maxFinite,
                                                              ),
                                                              height: 150,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                left: 8,
                                                                top: 8,
                                                              ),
                                                              child: Text(
                                                                  'मोही',
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
                                                                              .w600,
                                                                      fontSize:
                                                                          20,
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
                                                                  maxLines: 2)),
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                left: 8,
                                                                top: 4,
                                                                bottom: 8,
                                                              ),
                                                              child: Text(
                                                                  'रू. 20',
                                                                  style: GoogleFonts
                                                                      .poppins(
                                                                    textStyle:
                                                                        TextStyle(
                                                                      color: Color(
                                                                              0xFFFF0000)
                                                                          .withOpacity(
                                                                              1),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontSize:
                                                                          14,
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
                                                      ),
                                                    ),
                                                  )),
                                              Padding(
                                                  padding:
                                                      getValueForScreenType<
                                                          EdgeInsets>(
                                                    context: context,
                                                    mobile: EdgeInsets.zero,
                                                    tablet:
                                                        const EdgeInsets.only(
                                                      right: 50,
                                                    ),
                                                    desktop:
                                                        const EdgeInsets.only(
                                                      right: 50,
                                                    ),
                                                  ),
                                                  child: Card(
                                                    elevation: 8,
                                                    color: Color(0xFFFFFFFF)
                                                        .withOpacity(1),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          getValueForScreenType<
                                                              BorderRadius>(
                                                        context: context,
                                                        mobile:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  22),
                                                          topRight:
                                                              Radius.circular(
                                                                  22),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  22),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  22),
                                                        ),
                                                        tablet:
                                                            BorderRadius.zero,
                                                        desktop:
                                                            BorderRadius.zero,
                                                      ),
                                                    ),
                                                    child: Container(
                                                      width:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: 140,
                                                        tablet:
                                                            double.maxFinite,
                                                        desktop:
                                                            double.maxFinite,
                                                      ),
                                                      height:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: 150,
                                                        tablet: null,
                                                        desktop: null,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: Color(0xFFFFFFFF)
                                                            .withOpacity(1),
                                                        borderRadius:
                                                            getValueForScreenType<
                                                                BorderRadius>(
                                                          context: context,
                                                          mobile:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    18),
                                                            topRight:
                                                                Radius.circular(
                                                                    18),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    18),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    18),
                                                          ),
                                                          tablet:
                                                              BorderRadius.zero,
                                                          desktop:
                                                              BorderRadius.zero,
                                                        ),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                getValueForScreenType<
                                                                    BorderRadius>(
                                                              context: context,
                                                              mobile:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        24),
                                                                topRight: Radius
                                                                    .circular(
                                                                        24),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            0),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        0),
                                                              ),
                                                              tablet:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8),
                                                              ),
                                                              desktop:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8),
                                                              ),
                                                            ),
                                                            child:
                                                                Image.network(
                                                              'https://images.pexels.com/photos/4475024/pexels-photo-4475024.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                                                              width:
                                                                  getValueForScreenType<
                                                                      double?>(
                                                                context:
                                                                    context,
                                                                mobile: 200,
                                                                tablet: double
                                                                    .maxFinite,
                                                                desktop: double
                                                                    .maxFinite,
                                                              ),
                                                              height: 150,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                left: 8,
                                                                top: 8,
                                                              ),
                                                              child: Text(
                                                                  'लस्सी',
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
                                                                              .w600,
                                                                      fontSize:
                                                                          20,
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
                                                                  maxLines: 2)),
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                left: 8,
                                                                top: 4,
                                                                bottom: 8,
                                                              ),
                                                              child: Text(
                                                                  'रू. 40',
                                                                  style: GoogleFonts
                                                                      .poppins(
                                                                    textStyle:
                                                                        TextStyle(
                                                                      color: Color(
                                                                              0xFFFF0000)
                                                                          .withOpacity(
                                                                              1),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontSize:
                                                                          14,
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
                                                      ),
                                                    ),
                                                  )),
                                              Padding(
                                                  padding:
                                                      getValueForScreenType<
                                                          EdgeInsets>(
                                                    context: context,
                                                    mobile: EdgeInsets.zero,
                                                    tablet:
                                                        const EdgeInsets.only(
                                                      right: 50,
                                                    ),
                                                    desktop:
                                                        const EdgeInsets.only(
                                                      right: 50,
                                                    ),
                                                  ),
                                                  child: Card(
                                                    elevation: 8,
                                                    color: Color(0xFFFFFFFF)
                                                        .withOpacity(1),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          getValueForScreenType<
                                                              BorderRadius>(
                                                        context: context,
                                                        mobile:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  22),
                                                          topRight:
                                                              Radius.circular(
                                                                  22),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  22),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  22),
                                                        ),
                                                        tablet:
                                                            BorderRadius.zero,
                                                        desktop:
                                                            BorderRadius.zero,
                                                      ),
                                                    ),
                                                    child: Container(
                                                      width:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: 140,
                                                        tablet:
                                                            double.maxFinite,
                                                        desktop:
                                                            double.maxFinite,
                                                      ),
                                                      height:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: 150,
                                                        tablet: null,
                                                        desktop: null,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: Color(0xFFFFFFFF)
                                                            .withOpacity(1),
                                                        borderRadius:
                                                            getValueForScreenType<
                                                                BorderRadius>(
                                                          context: context,
                                                          mobile:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    18),
                                                            topRight:
                                                                Radius.circular(
                                                                    18),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    18),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    18),
                                                          ),
                                                          tablet:
                                                              BorderRadius.zero,
                                                          desktop:
                                                              BorderRadius.zero,
                                                        ),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                getValueForScreenType<
                                                                    BorderRadius>(
                                                              context: context,
                                                              mobile:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        24),
                                                                topRight: Radius
                                                                    .circular(
                                                                        24),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            0),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        0),
                                                              ),
                                                              tablet:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8),
                                                              ),
                                                              desktop:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8),
                                                              ),
                                                            ),
                                                            child:
                                                                Image.network(
                                                              'https://cdn.pixabay.com/photo/2014/11/21/15/20/coffee-540653_960_720.jpg',
                                                              width:
                                                                  getValueForScreenType<
                                                                      double?>(
                                                                context:
                                                                    context,
                                                                mobile: 200,
                                                                tablet: double
                                                                    .maxFinite,
                                                                desktop: double
                                                                    .maxFinite,
                                                              ),
                                                              height: 150,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                left: 8,
                                                                top: 8,
                                                              ),
                                                              child: Text(
                                                                  'मिल्क सेक',
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
                                                                              .w600,
                                                                      fontSize:
                                                                          20,
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
                                                                  maxLines: 2)),
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                left: 8,
                                                                top: 4,
                                                                bottom: 8,
                                                              ),
                                                              child: Text(
                                                                  'रू. 50',
                                                                  style: GoogleFonts
                                                                      .poppins(
                                                                    textStyle:
                                                                        TextStyle(
                                                                      color: Color(
                                                                              0xFFFF0000)
                                                                          .withOpacity(
                                                                              1),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontSize:
                                                                          14,
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
                                                      ),
                                                    ),
                                                  )),
                                              Padding(
                                                  padding:
                                                      getValueForScreenType<
                                                          EdgeInsets>(
                                                    context: context,
                                                    mobile: EdgeInsets.zero,
                                                    tablet:
                                                        const EdgeInsets.only(
                                                      right: 50,
                                                    ),
                                                    desktop:
                                                        const EdgeInsets.only(
                                                      right: 50,
                                                    ),
                                                  ),
                                                  child: Card(
                                                    elevation: 8,
                                                    color: Color(0xFFFFFFFF)
                                                        .withOpacity(1),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          getValueForScreenType<
                                                              BorderRadius>(
                                                        context: context,
                                                        mobile:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  22),
                                                          topRight:
                                                              Radius.circular(
                                                                  22),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  22),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  22),
                                                        ),
                                                        tablet:
                                                            BorderRadius.zero,
                                                        desktop:
                                                            BorderRadius.zero,
                                                      ),
                                                    ),
                                                    child: Container(
                                                      width:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: 140,
                                                        tablet:
                                                            double.maxFinite,
                                                        desktop:
                                                            double.maxFinite,
                                                      ),
                                                      height:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: 150,
                                                        tablet: null,
                                                        desktop: null,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: Color(0xFFFFFFFF)
                                                            .withOpacity(1),
                                                        borderRadius:
                                                            getValueForScreenType<
                                                                BorderRadius>(
                                                          context: context,
                                                          mobile:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    18),
                                                            topRight:
                                                                Radius.circular(
                                                                    18),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    18),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    18),
                                                          ),
                                                          tablet:
                                                              BorderRadius.zero,
                                                          desktop:
                                                              BorderRadius.zero,
                                                        ),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                getValueForScreenType<
                                                                    BorderRadius>(
                                                              context: context,
                                                              mobile:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        24),
                                                                topRight: Radius
                                                                    .circular(
                                                                        24),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            0),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        0),
                                                              ),
                                                              tablet:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8),
                                                              ),
                                                              desktop:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8),
                                                              ),
                                                            ),
                                                            child:
                                                                Image.network(
                                                              'https://images.unsplash.com/photo-1584286595398-a59f21d313f5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80',
                                                              width:
                                                                  getValueForScreenType<
                                                                      double?>(
                                                                context:
                                                                    context,
                                                                mobile: 200,
                                                                tablet: double
                                                                    .maxFinite,
                                                                desktop: double
                                                                    .maxFinite,
                                                              ),
                                                              height: 150,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                left: 8,
                                                                top: 8,
                                                              ),
                                                              child: Text(
                                                                  'कोल्ड कफी',
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
                                                                              .w600,
                                                                      fontSize:
                                                                          20,
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
                                                                  maxLines: 2)),
                                                          Padding(
                                                              padding: const EdgeInsets
                                                                  .only(
                                                                left: 8,
                                                                top: 4,
                                                                bottom: 8,
                                                              ),
                                                              child: Text(
                                                                  'रू. 100',
                                                                  style: GoogleFonts
                                                                      .poppins(
                                                                    textStyle:
                                                                        TextStyle(
                                                                      color: Color(
                                                                              0xFFFF0000)
                                                                          .withOpacity(
                                                                              1),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontSize:
                                                                          14,
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
                                                      ),
                                                    ),
                                                  )),
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
                            top: 10,
                          ),
                          tablet: EdgeInsets.zero,
                          desktop: EdgeInsets.zero,
                        ),
                        width: double.maxFinite,
                        height: getValueForScreenType<double?>(
                          context: context,
                          mobile: 280,
                          tablet: null,
                          desktop: null,
                        ),
                        decoration: BoxDecoration(
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
                            mobile: 300,
                            tablet: 150,
                            desktop: 150,
                          ),
                          child: Padding(
                              padding: getValueForScreenType<EdgeInsets>(
                                context: context,
                                mobile: EdgeInsets.zero,
                                tablet: const EdgeInsets.only(
                                  top: 15,
                                ),
                                desktop: const EdgeInsets.only(
                                  top: 15,
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
                                              child: Text(
                                                  'आइसक्रिम  प्रति स्कुप (रू.)',
                                                  style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                      color: BlocProvider.of<
                                                                  ThemeCubit>(
                                                              context)
                                                          .getColor(
                                                              'Text / Primary'),
                                                      fontWeight:
                                                          FontWeight.w700,
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
                                                  maxLines: 1)),
                                          Icon(
                                            MdiIcons.fromString('arrow-right'),
                                            size: 24,
                                            color: Color(0xFF000000)
                                                .withOpacity(1),
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                        top: 8,
                                      ),
                                      child: SizedBox(
                                        width: double.maxFinite,
                                        height: getValueForScreenType<double?>(
                                          context: context,
                                          mobile: 230,
                                          tablet: 150,
                                          desktop: 150,
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
                                                  padding:
                                                      getValueForScreenType<
                                                          EdgeInsets>(
                                                    context: context,
                                                    mobile: EdgeInsets.zero,
                                                    tablet:
                                                        const EdgeInsets.only(
                                                      right: 50,
                                                    ),
                                                    desktop:
                                                        const EdgeInsets.only(
                                                      right: 50,
                                                    ),
                                                  ),
                                                  child: Card(
                                                    elevation: 8,
                                                    color: Color(0xFFFFFFFF)
                                                        .withOpacity(1),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          getValueForScreenType<
                                                              BorderRadius>(
                                                        context: context,
                                                        mobile:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  22),
                                                          topRight:
                                                              Radius.circular(
                                                                  22),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  22),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  22),
                                                        ),
                                                        tablet:
                                                            BorderRadius.zero,
                                                        desktop:
                                                            BorderRadius.zero,
                                                      ),
                                                    ),
                                                    child: Container(
                                                      width:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: 140,
                                                        tablet:
                                                            double.maxFinite,
                                                        desktop:
                                                            double.maxFinite,
                                                      ),
                                                      height:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: 150,
                                                        tablet: null,
                                                        desktop: null,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: Color(0xFFFFFFFF)
                                                            .withOpacity(1),
                                                        borderRadius:
                                                            getValueForScreenType<
                                                                BorderRadius>(
                                                          context: context,
                                                          mobile:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    18),
                                                            topRight:
                                                                Radius.circular(
                                                                    18),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    18),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    18),
                                                          ),
                                                          tablet:
                                                              BorderRadius.zero,
                                                          desktop:
                                                              BorderRadius.zero,
                                                        ),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                getValueForScreenType<
                                                                    BorderRadius>(
                                                              context: context,
                                                              mobile:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        24),
                                                                topRight: Radius
                                                                    .circular(
                                                                        24),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            0),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        0),
                                                              ),
                                                              tablet:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8),
                                                              ),
                                                              desktop:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8),
                                                              ),
                                                            ),
                                                            child:
                                                                Image.network(
                                                              'https://images.pexels.com/photos/2333857/pexels-photo-2333857.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                                                              width:
                                                                  getValueForScreenType<
                                                                      double?>(
                                                                context:
                                                                    context,
                                                                mobile: 200,
                                                                tablet: double
                                                                    .maxFinite,
                                                                desktop: double
                                                                    .maxFinite,
                                                              ),
                                                              height: 150,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                left: 8,
                                                                top: 8,
                                                              ),
                                                              child: Text(
                                                                  'भेनिला',
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
                                                                              .w600,
                                                                      fontSize:
                                                                          20,
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
                                                                  maxLines: 2)),
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                left: 8,
                                                                top: 4,
                                                                bottom: 8,
                                                              ),
                                                              child: Text(
                                                                  'रू. 50',
                                                                  style: GoogleFonts
                                                                      .poppins(
                                                                    textStyle:
                                                                        TextStyle(
                                                                      color: Color(
                                                                              0xFFFF0000)
                                                                          .withOpacity(
                                                                              1),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontSize:
                                                                          14,
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
                                                      ),
                                                    ),
                                                  )),
                                              Padding(
                                                  padding:
                                                      getValueForScreenType<
                                                          EdgeInsets>(
                                                    context: context,
                                                    mobile: EdgeInsets.zero,
                                                    tablet:
                                                        const EdgeInsets.only(
                                                      right: 50,
                                                    ),
                                                    desktop:
                                                        const EdgeInsets.only(
                                                      right: 50,
                                                    ),
                                                  ),
                                                  child: Card(
                                                    elevation: 8,
                                                    color: Color(0xFFFFFFFF)
                                                        .withOpacity(1),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          getValueForScreenType<
                                                              BorderRadius>(
                                                        context: context,
                                                        mobile:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  22),
                                                          topRight:
                                                              Radius.circular(
                                                                  22),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  22),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  22),
                                                        ),
                                                        tablet:
                                                            BorderRadius.zero,
                                                        desktop:
                                                            BorderRadius.zero,
                                                      ),
                                                    ),
                                                    child: Container(
                                                      width:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: 140,
                                                        tablet:
                                                            double.maxFinite,
                                                        desktop:
                                                            double.maxFinite,
                                                      ),
                                                      height:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: 150,
                                                        tablet: null,
                                                        desktop: null,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: Color(0xFFFFFFFF)
                                                            .withOpacity(1),
                                                        borderRadius:
                                                            getValueForScreenType<
                                                                BorderRadius>(
                                                          context: context,
                                                          mobile:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    18),
                                                            topRight:
                                                                Radius.circular(
                                                                    18),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    18),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    18),
                                                          ),
                                                          tablet:
                                                              BorderRadius.zero,
                                                          desktop:
                                                              BorderRadius.zero,
                                                        ),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                getValueForScreenType<
                                                                    BorderRadius>(
                                                              context: context,
                                                              mobile:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        24),
                                                                topRight: Radius
                                                                    .circular(
                                                                        24),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            0),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        0),
                                                              ),
                                                              tablet:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8),
                                                              ),
                                                              desktop:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8),
                                                              ),
                                                            ),
                                                            child:
                                                                Image.network(
                                                              'https://images.pexels.com/photos/2708337/pexels-photo-2708337.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                                                              width:
                                                                  getValueForScreenType<
                                                                      double?>(
                                                                context:
                                                                    context,
                                                                mobile: 200,
                                                                tablet: double
                                                                    .maxFinite,
                                                                desktop: double
                                                                    .maxFinite,
                                                              ),
                                                              height: 150,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                left: 8,
                                                                top: 8,
                                                              ),
                                                              child: Text(
                                                                  'चकलेट',
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
                                                                              .w600,
                                                                      fontSize:
                                                                          20,
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
                                                                  maxLines: 2)),
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                left: 8,
                                                                top: 4,
                                                                bottom: 8,
                                                              ),
                                                              child: Text(
                                                                  'रू.60',
                                                                  style: GoogleFonts
                                                                      .poppins(
                                                                    textStyle:
                                                                        TextStyle(
                                                                      color: Color(
                                                                              0xFFFF0000)
                                                                          .withOpacity(
                                                                              1),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontSize:
                                                                          14,
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
                                                      ),
                                                    ),
                                                  )),
                                              Padding(
                                                  padding:
                                                      getValueForScreenType<
                                                          EdgeInsets>(
                                                    context: context,
                                                    mobile: EdgeInsets.zero,
                                                    tablet:
                                                        const EdgeInsets.only(
                                                      right: 50,
                                                    ),
                                                    desktop:
                                                        const EdgeInsets.only(
                                                      right: 50,
                                                    ),
                                                  ),
                                                  child: Card(
                                                    elevation: 8,
                                                    color: Color(0xFFFFFFFF)
                                                        .withOpacity(1),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          getValueForScreenType<
                                                              BorderRadius>(
                                                        context: context,
                                                        mobile:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  22),
                                                          topRight:
                                                              Radius.circular(
                                                                  22),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  22),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  22),
                                                        ),
                                                        tablet:
                                                            BorderRadius.zero,
                                                        desktop:
                                                            BorderRadius.zero,
                                                      ),
                                                    ),
                                                    child: Container(
                                                      width:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: 140,
                                                        tablet:
                                                            double.maxFinite,
                                                        desktop:
                                                            double.maxFinite,
                                                      ),
                                                      height:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: 150,
                                                        tablet: null,
                                                        desktop: null,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: Color(0xFFFFFFFF)
                                                            .withOpacity(1),
                                                        borderRadius:
                                                            getValueForScreenType<
                                                                BorderRadius>(
                                                          context: context,
                                                          mobile:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    18),
                                                            topRight:
                                                                Radius.circular(
                                                                    18),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    18),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    18),
                                                          ),
                                                          tablet:
                                                              BorderRadius.zero,
                                                          desktop:
                                                              BorderRadius.zero,
                                                        ),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                getValueForScreenType<
                                                                    BorderRadius>(
                                                              context: context,
                                                              mobile:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        24),
                                                                topRight: Radius
                                                                    .circular(
                                                                        24),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            0),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        0),
                                                              ),
                                                              tablet:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8),
                                                              ),
                                                              desktop:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8),
                                                              ),
                                                            ),
                                                            child:
                                                                Image.network(
                                                              'https://images.unsplash.com/photo-1505253716362-afaea1d3d1af?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
                                                              width:
                                                                  getValueForScreenType<
                                                                      double?>(
                                                                context:
                                                                    context,
                                                                mobile: 200,
                                                                tablet: double
                                                                    .maxFinite,
                                                                desktop: double
                                                                    .maxFinite,
                                                              ),
                                                              height: 150,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                left: 8,
                                                                top: 8,
                                                              ),
                                                              child: Text(
                                                                  'Strawberry 100 ml',
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
                                                                              .w600,
                                                                      fontSize:
                                                                          getValueForScreenType<
                                                                              double>(
                                                                        context:
                                                                            context,
                                                                        mobile:
                                                                            14,
                                                                        tablet:
                                                                            20,
                                                                        desktop:
                                                                            20,
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
                                                                          .left,
                                                                  textDirection:
                                                                      TextDirection
                                                                          .ltr,
                                                                  maxLines: 2)),
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                left: 8,
                                                                top: 4,
                                                                bottom: 8,
                                                              ),
                                                              child: Text(
                                                                  'रू. 60',
                                                                  style: GoogleFonts
                                                                      .poppins(
                                                                    textStyle:
                                                                        TextStyle(
                                                                      color: Color(
                                                                              0xFFFF0000)
                                                                          .withOpacity(
                                                                              1),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontSize:
                                                                          14,
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
                                                      ),
                                                    ),
                                                  )),
                                              Padding(
                                                  padding:
                                                      getValueForScreenType<
                                                          EdgeInsets>(
                                                    context: context,
                                                    mobile: EdgeInsets.zero,
                                                    tablet:
                                                        const EdgeInsets.only(
                                                      right: 50,
                                                    ),
                                                    desktop:
                                                        const EdgeInsets.only(
                                                      right: 50,
                                                    ),
                                                  ),
                                                  child: Card(
                                                    elevation: 8,
                                                    color: Color(0xFFFFFFFF)
                                                        .withOpacity(1),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          getValueForScreenType<
                                                              BorderRadius>(
                                                        context: context,
                                                        mobile:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  22),
                                                          topRight:
                                                              Radius.circular(
                                                                  22),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  22),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  22),
                                                        ),
                                                        tablet:
                                                            BorderRadius.zero,
                                                        desktop:
                                                            BorderRadius.zero,
                                                      ),
                                                    ),
                                                    child: Container(
                                                      width:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: 140,
                                                        tablet:
                                                            double.maxFinite,
                                                        desktop:
                                                            double.maxFinite,
                                                      ),
                                                      height:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: 150,
                                                        tablet: null,
                                                        desktop: null,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: Color(0xFFFFFFFF)
                                                            .withOpacity(1),
                                                        borderRadius:
                                                            getValueForScreenType<
                                                                BorderRadius>(
                                                          context: context,
                                                          mobile:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    18),
                                                            topRight:
                                                                Radius.circular(
                                                                    18),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    18),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    18),
                                                          ),
                                                          tablet:
                                                              BorderRadius.zero,
                                                          desktop:
                                                              BorderRadius.zero,
                                                        ),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                getValueForScreenType<
                                                                    BorderRadius>(
                                                              context: context,
                                                              mobile:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        24),
                                                                topRight: Radius
                                                                    .circular(
                                                                        24),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            0),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        0),
                                                              ),
                                                              tablet:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8),
                                                              ),
                                                              desktop:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8),
                                                              ),
                                                            ),
                                                            child:
                                                                Image.network(
                                                              'https://images.unsplash.com/photo-1505253716362-afaea1d3d1af?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
                                                              width:
                                                                  getValueForScreenType<
                                                                      double?>(
                                                                context:
                                                                    context,
                                                                mobile: 200,
                                                                tablet: double
                                                                    .maxFinite,
                                                                desktop: double
                                                                    .maxFinite,
                                                              ),
                                                              height: 150,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                left: 8,
                                                                top: 8,
                                                              ),
                                                              child: Text(
                                                                  '21st Love 500ml.',
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
                                                                              .w600,
                                                                      fontSize:
                                                                          getValueForScreenType<
                                                                              double>(
                                                                        context:
                                                                            context,
                                                                        mobile:
                                                                            14,
                                                                        tablet:
                                                                            20,
                                                                        desktop:
                                                                            20,
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
                                                                          .left,
                                                                  textDirection:
                                                                      TextDirection
                                                                          .ltr,
                                                                  maxLines: 2)),
                                                          Padding(
                                                              padding: const EdgeInsets
                                                                  .only(
                                                                left: 8,
                                                                top: 4,
                                                                bottom: 8,
                                                              ),
                                                              child: Text(
                                                                  'रू. 200',
                                                                  style: GoogleFonts
                                                                      .poppins(
                                                                    textStyle:
                                                                        TextStyle(
                                                                      color: Color(
                                                                              0xFFFF0000)
                                                                          .withOpacity(
                                                                              1),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontSize:
                                                                          14,
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
                                                      ),
                                                    ),
                                                  )),
                                              Padding(
                                                  padding:
                                                      getValueForScreenType<
                                                          EdgeInsets>(
                                                    context: context,
                                                    mobile: EdgeInsets.zero,
                                                    tablet:
                                                        const EdgeInsets.only(
                                                      right: 50,
                                                    ),
                                                    desktop:
                                                        const EdgeInsets.only(
                                                      right: 50,
                                                    ),
                                                  ),
                                                  child: Card(
                                                    elevation: 8,
                                                    color: Color(0xFFFFFFFF)
                                                        .withOpacity(1),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          getValueForScreenType<
                                                              BorderRadius>(
                                                        context: context,
                                                        mobile:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  22),
                                                          topRight:
                                                              Radius.circular(
                                                                  22),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  22),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  22),
                                                        ),
                                                        tablet:
                                                            BorderRadius.zero,
                                                        desktop:
                                                            BorderRadius.zero,
                                                      ),
                                                    ),
                                                    child: Container(
                                                      width:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: 140,
                                                        tablet:
                                                            double.maxFinite,
                                                        desktop:
                                                            double.maxFinite,
                                                      ),
                                                      height:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: 150,
                                                        tablet: null,
                                                        desktop: null,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: Color(0xFFFFFFFF)
                                                            .withOpacity(1),
                                                        borderRadius:
                                                            getValueForScreenType<
                                                                BorderRadius>(
                                                          context: context,
                                                          mobile:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    18),
                                                            topRight:
                                                                Radius.circular(
                                                                    18),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    18),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    18),
                                                          ),
                                                          tablet:
                                                              BorderRadius.zero,
                                                          desktop:
                                                              BorderRadius.zero,
                                                        ),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                getValueForScreenType<
                                                                    BorderRadius>(
                                                              context: context,
                                                              mobile:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        24),
                                                                topRight: Radius
                                                                    .circular(
                                                                        24),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            0),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        0),
                                                              ),
                                                              tablet:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8),
                                                              ),
                                                              desktop:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8),
                                                              ),
                                                            ),
                                                            child:
                                                                Image.network(
                                                              'https://images.unsplash.com/photo-1505253716362-afaea1d3d1af?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
                                                              width:
                                                                  getValueForScreenType<
                                                                      double?>(
                                                                context:
                                                                    context,
                                                                mobile: 200,
                                                                tablet: double
                                                                    .maxFinite,
                                                                desktop: double
                                                                    .maxFinite,
                                                              ),
                                                              height: 150,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                left: 8,
                                                                top: 8,
                                                              ),
                                                              child: Text(
                                                                  'कुल्फी',
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
                                                                              .w600,
                                                                      fontSize:
                                                                          20,
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
                                                                  maxLines: 2)),
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                left: 8,
                                                                top: 4,
                                                                bottom: 8,
                                                              ),
                                                              child: Text(
                                                                  'रू. 10',
                                                                  style: GoogleFonts
                                                                      .poppins(
                                                                    textStyle:
                                                                        TextStyle(
                                                                      color: Color(
                                                                              0xFFFF0000)
                                                                          .withOpacity(
                                                                              1),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontSize:
                                                                          14,
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
                                                      ),
                                                    ),
                                                  )),
                                              Padding(
                                                  padding:
                                                      getValueForScreenType<
                                                          EdgeInsets>(
                                                    context: context,
                                                    mobile: EdgeInsets.zero,
                                                    tablet:
                                                        const EdgeInsets.only(
                                                      right: 50,
                                                    ),
                                                    desktop:
                                                        const EdgeInsets.only(
                                                      right: 50,
                                                    ),
                                                  ),
                                                  child: Card(
                                                    elevation: 8,
                                                    color: Color(0xFFFFFFFF)
                                                        .withOpacity(1),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          getValueForScreenType<
                                                              BorderRadius>(
                                                        context: context,
                                                        mobile:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  22),
                                                          topRight:
                                                              Radius.circular(
                                                                  22),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  22),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  22),
                                                        ),
                                                        tablet:
                                                            BorderRadius.zero,
                                                        desktop:
                                                            BorderRadius.zero,
                                                      ),
                                                    ),
                                                    child: Container(
                                                      width:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: 140,
                                                        tablet:
                                                            double.maxFinite,
                                                        desktop:
                                                            double.maxFinite,
                                                      ),
                                                      height:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: 150,
                                                        tablet: null,
                                                        desktop: null,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: Color(0xFFFFFFFF)
                                                            .withOpacity(1),
                                                        borderRadius:
                                                            getValueForScreenType<
                                                                BorderRadius>(
                                                          context: context,
                                                          mobile:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    18),
                                                            topRight:
                                                                Radius.circular(
                                                                    18),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    18),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    18),
                                                          ),
                                                          tablet:
                                                              BorderRadius.zero,
                                                          desktop:
                                                              BorderRadius.zero,
                                                        ),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                getValueForScreenType<
                                                                    BorderRadius>(
                                                              context: context,
                                                              mobile:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        24),
                                                                topRight: Radius
                                                                    .circular(
                                                                        24),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            0),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        0),
                                                              ),
                                                              tablet:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8),
                                                              ),
                                                              desktop:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8),
                                                              ),
                                                            ),
                                                            child:
                                                                Image.network(
                                                              'https://images.unsplash.com/photo-1505253716362-afaea1d3d1af?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
                                                              width:
                                                                  getValueForScreenType<
                                                                      double?>(
                                                                context:
                                                                    context,
                                                                mobile: 200,
                                                                tablet: double
                                                                    .maxFinite,
                                                                desktop: double
                                                                    .maxFinite,
                                                              ),
                                                              height: 150,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Padding(
                                                              padding: const EdgeInsets
                                                                  .only(
                                                                left: 8,
                                                                top: 8,
                                                              ),
                                                              child: Text(
                                                                  'चोकोबार',
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
                                                                              .w600,
                                                                      fontSize:
                                                                          20,
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
                                                                  maxLines: 2)),
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                left: 8,
                                                                top: 4,
                                                                bottom: 8,
                                                              ),
                                                              child: Text(
                                                                  'रू. 70',
                                                                  style: GoogleFonts
                                                                      .poppins(
                                                                    textStyle:
                                                                        TextStyle(
                                                                      color: Color(
                                                                              0xFFFF0000)
                                                                          .withOpacity(
                                                                              1),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontSize:
                                                                          14,
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
                                                      ),
                                                    ),
                                                  )),
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
                            top: 10,
                          ),
                          tablet: EdgeInsets.zero,
                          desktop: EdgeInsets.zero,
                        ),
                        width: double.maxFinite,
                        height: getValueForScreenType<double?>(
                          context: context,
                          mobile: 280,
                          tablet: null,
                          desktop: null,
                        ),
                        decoration: BoxDecoration(
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
                            mobile: 300,
                            tablet: 150,
                            desktop: 150,
                          ),
                          child: Padding(
                              padding: getValueForScreenType<EdgeInsets>(
                                context: context,
                                mobile: EdgeInsets.zero,
                                tablet: const EdgeInsets.only(
                                  top: 15,
                                ),
                                desktop: const EdgeInsets.only(
                                  top: 15,
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
                                              child: Text(
                                                  'खाजा नास्ता प्रति प्लेट (रू.)',
                                                  style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                      color: BlocProvider.of<
                                                                  ThemeCubit>(
                                                              context)
                                                          .getColor(
                                                              'Text / Primary'),
                                                      fontWeight:
                                                          FontWeight.w700,
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
                                                  maxLines: 1)),
                                          Icon(
                                            MdiIcons.fromString('arrow-right'),
                                            size: 24,
                                            color: Color(0xFF000000)
                                                .withOpacity(1),
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                        top: 8,
                                      ),
                                      child: SizedBox(
                                        width: double.maxFinite,
                                        height: getValueForScreenType<double?>(
                                          context: context,
                                          mobile: 230,
                                          tablet: 150,
                                          desktop: 150,
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
                                                  padding:
                                                      getValueForScreenType<
                                                          EdgeInsets>(
                                                    context: context,
                                                    mobile: EdgeInsets.zero,
                                                    tablet:
                                                        const EdgeInsets.only(
                                                      right: 50,
                                                    ),
                                                    desktop:
                                                        const EdgeInsets.only(
                                                      right: 50,
                                                    ),
                                                  ),
                                                  child: Card(
                                                    elevation: 8,
                                                    color: Color(0xFFFFFFFF)
                                                        .withOpacity(1),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          getValueForScreenType<
                                                              BorderRadius>(
                                                        context: context,
                                                        mobile:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  22),
                                                          topRight:
                                                              Radius.circular(
                                                                  22),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  22),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  22),
                                                        ),
                                                        tablet:
                                                            BorderRadius.zero,
                                                        desktop:
                                                            BorderRadius.zero,
                                                      ),
                                                    ),
                                                    child: Container(
                                                      width:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: 140,
                                                        tablet:
                                                            double.maxFinite,
                                                        desktop:
                                                            double.maxFinite,
                                                      ),
                                                      height:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: 150,
                                                        tablet: null,
                                                        desktop: null,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: Color(0xFFFFFFFF)
                                                            .withOpacity(1),
                                                        borderRadius:
                                                            getValueForScreenType<
                                                                BorderRadius>(
                                                          context: context,
                                                          mobile:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    18),
                                                            topRight:
                                                                Radius.circular(
                                                                    18),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    18),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    18),
                                                          ),
                                                          tablet:
                                                              BorderRadius.zero,
                                                          desktop:
                                                              BorderRadius.zero,
                                                        ),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                getValueForScreenType<
                                                                    BorderRadius>(
                                                              context: context,
                                                              mobile:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        24),
                                                                topRight: Radius
                                                                    .circular(
                                                                        24),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            0),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        0),
                                                              ),
                                                              tablet:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8),
                                                              ),
                                                              desktop:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8),
                                                              ),
                                                            ),
                                                            child:
                                                                Image.network(
                                                              'https://images.unsplash.com/photo-1505253716362-afaea1d3d1af?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
                                                              width:
                                                                  getValueForScreenType<
                                                                      double?>(
                                                                context:
                                                                    context,
                                                                mobile: 200,
                                                                tablet: double
                                                                    .maxFinite,
                                                                desktop: double
                                                                    .maxFinite,
                                                              ),
                                                              height: 150,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                left: 8,
                                                                top: 8,
                                                              ),
                                                              child: Text(
                                                                  'दहि चिउरा केरा',
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
                                                                              .w600,
                                                                      fontSize:
                                                                          20,
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
                                                                  maxLines: 2)),
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                left: 8,
                                                                top: 4,
                                                                bottom: 8,
                                                              ),
                                                              child: Text(
                                                                  'रू. 60',
                                                                  style: GoogleFonts
                                                                      .poppins(
                                                                    textStyle:
                                                                        TextStyle(
                                                                      color: Color(
                                                                              0xFFFF0000)
                                                                          .withOpacity(
                                                                              1),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontSize:
                                                                          14,
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
                                                      ),
                                                    ),
                                                  )),
                                              Padding(
                                                  padding:
                                                      getValueForScreenType<
                                                          EdgeInsets>(
                                                    context: context,
                                                    mobile: EdgeInsets.zero,
                                                    tablet:
                                                        const EdgeInsets.only(
                                                      right: 50,
                                                    ),
                                                    desktop:
                                                        const EdgeInsets.only(
                                                      right: 50,
                                                    ),
                                                  ),
                                                  child: Card(
                                                    elevation: 8,
                                                    color: Color(0xFFFFFFFF)
                                                        .withOpacity(1),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          getValueForScreenType<
                                                              BorderRadius>(
                                                        context: context,
                                                        mobile:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  22),
                                                          topRight:
                                                              Radius.circular(
                                                                  22),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  22),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  22),
                                                        ),
                                                        tablet:
                                                            BorderRadius.zero,
                                                        desktop:
                                                            BorderRadius.zero,
                                                      ),
                                                    ),
                                                    child: Container(
                                                      width:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: 140,
                                                        tablet:
                                                            double.maxFinite,
                                                        desktop:
                                                            double.maxFinite,
                                                      ),
                                                      height:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: 150,
                                                        tablet: null,
                                                        desktop: null,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: Color(0xFFFFFFFF)
                                                            .withOpacity(1),
                                                        borderRadius:
                                                            getValueForScreenType<
                                                                BorderRadius>(
                                                          context: context,
                                                          mobile:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    18),
                                                            topRight:
                                                                Radius.circular(
                                                                    18),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    18),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    18),
                                                          ),
                                                          tablet:
                                                              BorderRadius.zero,
                                                          desktop:
                                                              BorderRadius.zero,
                                                        ),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                getValueForScreenType<
                                                                    BorderRadius>(
                                                              context: context,
                                                              mobile:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        24),
                                                                topRight: Radius
                                                                    .circular(
                                                                        24),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            0),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        0),
                                                              ),
                                                              tablet:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8),
                                                              ),
                                                              desktop:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8),
                                                              ),
                                                            ),
                                                            child:
                                                                Image.network(
                                                              'https://images.unsplash.com/photo-1505253716362-afaea1d3d1af?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
                                                              width:
                                                                  getValueForScreenType<
                                                                      double?>(
                                                                context:
                                                                    context,
                                                                mobile: 200,
                                                                tablet: double
                                                                    .maxFinite,
                                                                desktop: double
                                                                    .maxFinite,
                                                              ),
                                                              height: 150,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                left: 8,
                                                                top: 8,
                                                              ),
                                                              child: Text(
                                                                  'दुध चिउरा खुवा',
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
                                                                              .w600,
                                                                      fontSize:
                                                                          20,
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
                                                                  maxLines: 2)),
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                left: 8,
                                                                top: 4,
                                                                bottom: 8,
                                                              ),
                                                              child: Text(
                                                                  'रू. 80',
                                                                  style: GoogleFonts
                                                                      .poppins(
                                                                    textStyle:
                                                                        TextStyle(
                                                                      color: Color(
                                                                              0xFFFF0000)
                                                                          .withOpacity(
                                                                              1),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontSize:
                                                                          14,
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
                                                      ),
                                                    ),
                                                  )),
                                              Padding(
                                                  padding:
                                                      getValueForScreenType<
                                                          EdgeInsets>(
                                                    context: context,
                                                    mobile: EdgeInsets.zero,
                                                    tablet:
                                                        const EdgeInsets.only(
                                                      right: 50,
                                                    ),
                                                    desktop:
                                                        const EdgeInsets.only(
                                                      right: 50,
                                                    ),
                                                  ),
                                                  child: Card(
                                                    elevation: 8,
                                                    color: Color(0xFFFFFFFF)
                                                        .withOpacity(1),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          getValueForScreenType<
                                                              BorderRadius>(
                                                        context: context,
                                                        mobile:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  22),
                                                          topRight:
                                                              Radius.circular(
                                                                  22),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  22),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  22),
                                                        ),
                                                        tablet:
                                                            BorderRadius.zero,
                                                        desktop:
                                                            BorderRadius.zero,
                                                      ),
                                                    ),
                                                    child: Container(
                                                      width:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: 140,
                                                        tablet:
                                                            double.maxFinite,
                                                        desktop:
                                                            double.maxFinite,
                                                      ),
                                                      height:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: 150,
                                                        tablet: null,
                                                        desktop: null,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: Color(0xFFFFFFFF)
                                                            .withOpacity(1),
                                                        borderRadius:
                                                            getValueForScreenType<
                                                                BorderRadius>(
                                                          context: context,
                                                          mobile:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    18),
                                                            topRight:
                                                                Radius.circular(
                                                                    18),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    18),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    18),
                                                          ),
                                                          tablet:
                                                              BorderRadius.zero,
                                                          desktop:
                                                              BorderRadius.zero,
                                                        ),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                getValueForScreenType<
                                                                    BorderRadius>(
                                                              context: context,
                                                              mobile:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        24),
                                                                topRight: Radius
                                                                    .circular(
                                                                        24),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            0),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        0),
                                                              ),
                                                              tablet:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8),
                                                              ),
                                                              desktop:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8),
                                                              ),
                                                            ),
                                                            child:
                                                                Image.network(
                                                              'https://images.unsplash.com/photo-1519996529931-28324d5a630e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
                                                              width:
                                                                  getValueForScreenType<
                                                                      double?>(
                                                                context:
                                                                    context,
                                                                mobile: 200,
                                                                tablet: double
                                                                    .maxFinite,
                                                                desktop: double
                                                                    .maxFinite,
                                                              ),
                                                              height: 150,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                left: 8,
                                                                top: 8,
                                                              ),
                                                              child: Text(
                                                                  'मिक्स फ्रुट्स',
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
                                                                              .w600,
                                                                      fontSize:
                                                                          20,
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
                                                                  maxLines: 2)),
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                left: 8,
                                                                top: 4,
                                                                bottom: 8,
                                                              ),
                                                              child: Text(
                                                                  'रू. 80',
                                                                  style: GoogleFonts
                                                                      .poppins(
                                                                    textStyle:
                                                                        TextStyle(
                                                                      color: Color(
                                                                              0xFFFF0000)
                                                                          .withOpacity(
                                                                              1),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontSize:
                                                                          14,
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
                                                      ),
                                                    ),
                                                  )),
                                              Padding(
                                                  padding:
                                                      getValueForScreenType<
                                                          EdgeInsets>(
                                                    context: context,
                                                    mobile: EdgeInsets.zero,
                                                    tablet:
                                                        const EdgeInsets.only(
                                                      right: 50,
                                                    ),
                                                    desktop:
                                                        const EdgeInsets.only(
                                                      right: 50,
                                                    ),
                                                  ),
                                                  child: Card(
                                                    elevation: 8,
                                                    color: Color(0xFFFFFFFF)
                                                        .withOpacity(1),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          getValueForScreenType<
                                                              BorderRadius>(
                                                        context: context,
                                                        mobile:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  22),
                                                          topRight:
                                                              Radius.circular(
                                                                  22),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  22),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  22),
                                                        ),
                                                        tablet:
                                                            BorderRadius.zero,
                                                        desktop:
                                                            BorderRadius.zero,
                                                      ),
                                                    ),
                                                    child: Container(
                                                      width:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: 140,
                                                        tablet:
                                                            double.maxFinite,
                                                        desktop:
                                                            double.maxFinite,
                                                      ),
                                                      height:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: 150,
                                                        tablet: null,
                                                        desktop: null,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: Color(0xFFFFFFFF)
                                                            .withOpacity(1),
                                                        borderRadius:
                                                            getValueForScreenType<
                                                                BorderRadius>(
                                                          context: context,
                                                          mobile:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    18),
                                                            topRight:
                                                                Radius.circular(
                                                                    18),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    18),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    18),
                                                          ),
                                                          tablet:
                                                              BorderRadius.zero,
                                                          desktop:
                                                              BorderRadius.zero,
                                                        ),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                getValueForScreenType<
                                                                    BorderRadius>(
                                                              context: context,
                                                              mobile:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        24),
                                                                topRight: Radius
                                                                    .circular(
                                                                        24),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            0),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        0),
                                                              ),
                                                              tablet:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8),
                                                              ),
                                                              desktop:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8),
                                                              ),
                                                            ),
                                                            child:
                                                                Image.network(
                                                              'https://images.unsplash.com/photo-1505253716362-afaea1d3d1af?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
                                                              width:
                                                                  getValueForScreenType<
                                                                      double?>(
                                                                context:
                                                                    context,
                                                                mobile: 200,
                                                                tablet: double
                                                                    .maxFinite,
                                                                desktop: double
                                                                    .maxFinite,
                                                              ),
                                                              height: 150,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                left: 8,
                                                                top: 8,
                                                              ),
                                                              child: Text(
                                                                  'फ्रुट सलाद',
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
                                                                              .w600,
                                                                      fontSize:
                                                                          20,
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
                                                                  maxLines: 2)),
                                                          Padding(
                                                              padding: const EdgeInsets
                                                                  .only(
                                                                left: 8,
                                                                top: 4,
                                                                bottom: 8,
                                                              ),
                                                              child: Text(
                                                                  'रू. 100',
                                                                  style: GoogleFonts
                                                                      .poppins(
                                                                    textStyle:
                                                                        TextStyle(
                                                                      color: Color(
                                                                              0xFFFF0000)
                                                                          .withOpacity(
                                                                              1),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontSize:
                                                                          14,
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
                                                      ),
                                                    ),
                                                  )),
                                              Padding(
                                                  padding:
                                                      getValueForScreenType<
                                                          EdgeInsets>(
                                                    context: context,
                                                    mobile: EdgeInsets.zero,
                                                    tablet:
                                                        const EdgeInsets.only(
                                                      right: 50,
                                                    ),
                                                    desktop:
                                                        const EdgeInsets.only(
                                                      right: 50,
                                                    ),
                                                  ),
                                                  child: Card(
                                                    elevation: 8,
                                                    color: Color(0xFFFFFFFF)
                                                        .withOpacity(1),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          getValueForScreenType<
                                                              BorderRadius>(
                                                        context: context,
                                                        mobile:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  22),
                                                          topRight:
                                                              Radius.circular(
                                                                  22),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  22),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  22),
                                                        ),
                                                        tablet:
                                                            BorderRadius.zero,
                                                        desktop:
                                                            BorderRadius.zero,
                                                      ),
                                                    ),
                                                    child: Container(
                                                      width:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: 140,
                                                        tablet:
                                                            double.maxFinite,
                                                        desktop:
                                                            double.maxFinite,
                                                      ),
                                                      height:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: 150,
                                                        tablet: null,
                                                        desktop: null,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: Color(0xFFFFFFFF)
                                                            .withOpacity(1),
                                                        borderRadius:
                                                            getValueForScreenType<
                                                                BorderRadius>(
                                                          context: context,
                                                          mobile:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    18),
                                                            topRight:
                                                                Radius.circular(
                                                                    18),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    18),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    18),
                                                          ),
                                                          tablet:
                                                              BorderRadius.zero,
                                                          desktop:
                                                              BorderRadius.zero,
                                                        ),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                getValueForScreenType<
                                                                    BorderRadius>(
                                                              context: context,
                                                              mobile:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        24),
                                                                topRight: Radius
                                                                    .circular(
                                                                        24),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            0),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        0),
                                                              ),
                                                              tablet:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8),
                                                              ),
                                                              desktop:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8),
                                                              ),
                                                            ),
                                                            child:
                                                                Image.network(
                                                              'https://images.unsplash.com/photo-1505253716362-afaea1d3d1af?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
                                                              width:
                                                                  getValueForScreenType<
                                                                      double?>(
                                                                context:
                                                                    context,
                                                                mobile: 200,
                                                                tablet: double
                                                                    .maxFinite,
                                                                desktop: double
                                                                    .maxFinite,
                                                              ),
                                                              height: 150,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Padding(
                                                              padding: const EdgeInsets
                                                                  .only(
                                                                left: 8,
                                                                top: 8,
                                                              ),
                                                              child: Text(
                                                                  'खुवा वन',
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
                                                                              .w600,
                                                                      fontSize:
                                                                          20,
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
                                                                  maxLines: 2)),
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                left: 8,
                                                                top: 4,
                                                                bottom: 8,
                                                              ),
                                                              child: Text(
                                                                  'रू. 50',
                                                                  style: GoogleFonts
                                                                      .poppins(
                                                                    textStyle:
                                                                        TextStyle(
                                                                      color: Color(
                                                                              0xFFFF0000)
                                                                          .withOpacity(
                                                                              1),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontSize:
                                                                          14,
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
                                                      ),
                                                    ),
                                                  )),
                                              Padding(
                                                  padding:
                                                      getValueForScreenType<
                                                          EdgeInsets>(
                                                    context: context,
                                                    mobile: EdgeInsets.zero,
                                                    tablet:
                                                        const EdgeInsets.only(
                                                      right: 50,
                                                    ),
                                                    desktop:
                                                        const EdgeInsets.only(
                                                      right: 50,
                                                    ),
                                                  ),
                                                  child: Card(
                                                    elevation: 8,
                                                    color: Color(0xFFFFFFFF)
                                                        .withOpacity(1),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          getValueForScreenType<
                                                              BorderRadius>(
                                                        context: context,
                                                        mobile:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  22),
                                                          topRight:
                                                              Radius.circular(
                                                                  22),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  22),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  22),
                                                        ),
                                                        tablet:
                                                            BorderRadius.zero,
                                                        desktop:
                                                            BorderRadius.zero,
                                                      ),
                                                    ),
                                                    child: Container(
                                                      width:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: 140,
                                                        tablet:
                                                            double.maxFinite,
                                                        desktop:
                                                            double.maxFinite,
                                                      ),
                                                      height:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: 150,
                                                        tablet: null,
                                                        desktop: null,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: Color(0xFFFFFFFF)
                                                            .withOpacity(1),
                                                        borderRadius:
                                                            getValueForScreenType<
                                                                BorderRadius>(
                                                          context: context,
                                                          mobile:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    18),
                                                            topRight:
                                                                Radius.circular(
                                                                    18),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    18),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    18),
                                                          ),
                                                          tablet:
                                                              BorderRadius.zero,
                                                          desktop:
                                                              BorderRadius.zero,
                                                        ),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                getValueForScreenType<
                                                                    BorderRadius>(
                                                              context: context,
                                                              mobile:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        24),
                                                                topRight: Radius
                                                                    .circular(
                                                                        24),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            0),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        0),
                                                              ),
                                                              tablet:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8),
                                                              ),
                                                              desktop:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8),
                                                              ),
                                                            ),
                                                            child:
                                                                Image.network(
                                                              'https://images.unsplash.com/photo-1505253716362-afaea1d3d1af?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
                                                              width:
                                                                  getValueForScreenType<
                                                                      double?>(
                                                                context:
                                                                    context,
                                                                mobile: 200,
                                                                tablet: double
                                                                    .maxFinite,
                                                                desktop: double
                                                                    .maxFinite,
                                                              ),
                                                              height: 150,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                left: 8,
                                                                top: 8,
                                                              ),
                                                              child: Text(
                                                                  'पनिर म:म',
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
                                                                              .w600,
                                                                      fontSize:
                                                                          20,
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
                                                                  maxLines: 2)),
                                                          Padding(
                                                              padding: const EdgeInsets
                                                                  .only(
                                                                left: 8,
                                                                top: 4,
                                                                bottom: 8,
                                                              ),
                                                              child: Text(
                                                                  'रू. 100',
                                                                  style: GoogleFonts
                                                                      .poppins(
                                                                    textStyle:
                                                                        TextStyle(
                                                                      color: Color(
                                                                              0xFFFF0000)
                                                                          .withOpacity(
                                                                              1),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontSize:
                                                                          14,
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
                                                      ),
                                                    ),
                                                  )),
                                            ],
                                          ),
                                        ),
                                      )),
                                ],
                              )),
                        ),
                      ),
                      Container(
                        width: double.maxFinite,
                        height: getValueForScreenType<double?>(
                          context: context,
                          mobile: 280,
                          tablet: null,
                          desktop: null,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF).withOpacity(1),
                          borderRadius: BorderRadius.zero,
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
                                  left: 12,
                                ),
                                tablet: const EdgeInsets.only(
                                  left: 24,
                                  top: 24,
                                  right: 24,
                                  bottom: 24,
                                ),
                                desktop: const EdgeInsets.only(
                                  left: 24,
                                  top: 24,
                                  right: 24,
                                  bottom: 24,
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
                                          top: 10,
                                          bottom: 10,
                                        ),
                                        tablet: const EdgeInsets.only(
                                          top: 10,
                                        ),
                                        desktop: const EdgeInsets.only(
                                          top: 10,
                                        ),
                                      ),
                                      child: Text(
                                          'हाम्रो सेवाहरु निम्न स्थान मा पनि उपलब्ध छ',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: Color(0xFF000000)
                                                  .withOpacity(1),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16,
                                              fontStyle: FontStyle.normal,
                                              decoration: TextDecoration.none,
                                            ),
                                          ),
                                          textAlign: TextAlign.left,
                                          textDirection: TextDirection.ltr,
                                          maxLines: 1)),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            getValueForScreenType<BorderRadius>(
                                          context: context,
                                          mobile: BorderRadius.only(
                                            topLeft: Radius.circular(14),
                                            topRight: Radius.circular(14),
                                            bottomRight: Radius.circular(14),
                                            bottomLeft: Radius.circular(14),
                                          ),
                                          tablet: BorderRadius.zero,
                                          desktop: BorderRadius.zero,
                                        ),
                                        child: Image.network(
                                          'https://images.unsplash.com/photo-1469793032099-27d09c984b8b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
                                          width: getValueForScreenType<double?>(
                                            context: context,
                                            mobile: 50,
                                            tablet: double.maxFinite,
                                            desktop: double.maxFinite,
                                          ),
                                          height:
                                              getValueForScreenType<double?>(
                                            context: context,
                                            mobile: 50,
                                            tablet: 150,
                                            desktop: 150,
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                            left: 12,
                                          ),
                                          child: Text('''लक्ष्मी कोल्ड स्टोर
स्थान; बसपार्क, मन्थली   048-540123''',
                                              style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                  color: BlocProvider.of<
                                                          ThemeCubit>(context)
                                                      .getColor(
                                                          'Text / Primary'),
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 16,
                                                  fontStyle: FontStyle.normal,
                                                  decoration:
                                                      TextDecoration.none,
                                                ),
                                              ),
                                              textAlign: TextAlign.left,
                                              textDirection: TextDirection.ltr,
                                              maxLines: 2)),
                                    ],
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                        top: 10,
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius: getValueForScreenType<
                                                BorderRadius>(
                                              context: context,
                                              mobile: BorderRadius.only(
                                                topLeft: Radius.circular(14),
                                                topRight: Radius.circular(14),
                                                bottomRight:
                                                    Radius.circular(14),
                                                bottomLeft: Radius.circular(14),
                                              ),
                                              tablet: BorderRadius.zero,
                                              desktop: BorderRadius.zero,
                                            ),
                                            child: Image.network(
                                              'https://images.unsplash.com/photo-1469793032099-27d09c984b8b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
                                              width: getValueForScreenType<
                                                  double?>(
                                                context: context,
                                                mobile: 50,
                                                tablet: double.maxFinite,
                                                desktop: double.maxFinite,
                                              ),
                                              height: getValueForScreenType<
                                                  double?>(
                                                context: context,
                                                mobile: 50,
                                                tablet: 150,
                                                desktop: 150,
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                left: 12,
                                              ),
                                              child: Text(
                                                  '''गौरीशंकर कोल्ड स्टोर
स्थान; देवकोटा चोक, मन्थली   048-540123''',
                                                  style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                      color: BlocProvider.of<
                                                                  ThemeCubit>(
                                                              context)
                                                          .getColor(
                                                              'Text / Primary'),
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 16,
                                                      fontStyle:
                                                          FontStyle.normal,
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
                                  Padding(
                                      padding: const EdgeInsets.only(
                                        top: 10,
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius: getValueForScreenType<
                                                BorderRadius>(
                                              context: context,
                                              mobile: BorderRadius.only(
                                                topLeft: Radius.circular(14),
                                                topRight: Radius.circular(14),
                                                bottomRight:
                                                    Radius.circular(14),
                                                bottomLeft: Radius.circular(14),
                                              ),
                                              tablet: BorderRadius.zero,
                                              desktop: BorderRadius.zero,
                                            ),
                                            child: Image.network(
                                              'https://images.unsplash.com/photo-1469793032099-27d09c984b8b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
                                              width: getValueForScreenType<
                                                  double?>(
                                                context: context,
                                                mobile: 50,
                                                tablet: double.maxFinite,
                                                desktop: double.maxFinite,
                                              ),
                                              height: getValueForScreenType<
                                                  double?>(
                                                context: context,
                                                mobile: 50,
                                                tablet: 150,
                                                desktop: 150,
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                left: 12,
                                              ),
                                              child: Text('''सरस्वती कोल्ड स्टोर
स्थान; मदन भण्डारी चोक, मन्थली   048-540123''',
                                                  style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                      color: Color(0xFF000000)
                                                          .withOpacity(1),
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize:
                                                          getValueForScreenType<
                                                              double>(
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
                                                  textAlign: TextAlign.left,
                                                  textDirection:
                                                      TextDirection.ltr,
                                                  maxLines: 2)),
                                        ],
                                      )),
                                  Padding(
                                      padding:
                                          getValueForScreenType<EdgeInsets>(
                                        context: context,
                                        mobile: const EdgeInsets.only(
                                          top: 10,
                                          bottom: 10,
                                        ),
                                        tablet: const EdgeInsets.only(
                                          top: 10,
                                        ),
                                        desktop: const EdgeInsets.only(
                                          top: 10,
                                        ),
                                      ),
                                      child: Text(
                                          'साथै हाम्रो सेवाहरु किर्ने बजार, रामेछाप बजार मा पनि उपलब्ध छ',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: Color(0xFF000000)
                                                  .withOpacity(1),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16,
                                              fontStyle: FontStyle.normal,
                                              decoration: TextDecoration.none,
                                            ),
                                          ),
                                          textAlign: TextAlign.left,
                                          textDirection: TextDirection.ltr,
                                          maxLines: 3)),
                                ],
                              )),
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
