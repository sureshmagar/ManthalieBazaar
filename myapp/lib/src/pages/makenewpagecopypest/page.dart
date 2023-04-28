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

class PageMakenewpagecopypest extends StatefulWidget {
  const PageMakenewpagecopypest({
    Key? key,
  }) : super(key: key);

  @override
  _StateMakenewpagecopypest createState() => _StateMakenewpagecopypest();
}

class _StateMakenewpagecopypest extends State<PageMakenewpagecopypest> {
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
        'name': "Makenewpagecopypest",
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
        child: SizedBox(
          width: double.maxFinite,
          height: getValueForScreenType<double?>(
            context: context,
            mobile: 90,
            tablet: 150,
            desktop: 150,
          ),
          child: Container(
            width: double.maxFinite,
            height: getValueForScreenType<double?>(
              context: context,
              mobile: 90,
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
              top: true,
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
                    Icon(
                      MdiIcons.fromString('menu'),
                      size: getValueForScreenType<double?>(
                        context: context,
                        mobile: 30,
                        tablet: 24,
                        desktop: 24,
                      ),
                      color: Color(0xFF000000).withOpacity(1),
                    ),
                    Padding(
                      padding: getValueForScreenType<EdgeInsets>(
                        context: context,
                        mobile: const EdgeInsets.only(),
                        tablet: EdgeInsets.zero,
                        desktop: EdgeInsets.zero,
                      ),
                      child: Text('मन्थली बजार',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: BlocProvider.of<ThemeCubit>(context)
                                  .getColor('Text / Primary'),
                              fontWeight: FontWeight.w700,
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
                    ),
                    BouncingWidget(
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
                      child: Icon(
                        MdiIcons.fromString('share-outline'),
                        size: getValueForScreenType<double?>(
                          context: context,
                          mobile: 30,
                          tablet: 24,
                          desktop: 24,
                        ),
                        color: Color(0xFF000000).withOpacity(1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
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
                    Color(0xFF00709A).withOpacity(1)
                  ],
                  stops: [0, 1],
                ),
                borderRadius: BorderRadius.zero,
              ),
              child: AnimationConfiguration.staggeredList(
                position: 1,
                duration: Duration(
                  milliseconds: 800,
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
                          SafeArea(
                            left: false,
                            top: true,
                            right: false,
                            bottom: false,
                            child: Padding(
                              padding: getValueForScreenType<EdgeInsets>(
                                context: context,
                                mobile: const EdgeInsets.only(
                                  left: 150,
                                ),
                                tablet: EdgeInsets.zero,
                                desktop: EdgeInsets.zero,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.zero,
                                child: Image.network(
                                  'https://images.unsplash.com/photo-1505765050516-f72dcac9c60e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80',
                                  width: double.maxFinite,
                                  height: 150,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: double.maxFinite,
                                height: getValueForScreenType<double?>(
                                  context: context,
                                  mobile: MediaQuery.of(context).size.height *
                                      100 /
                                      22,
                                  tablet: 150,
                                  desktop: 150,
                                ),
                                child: Padding(
                                  padding: getValueForScreenType<EdgeInsets>(
                                    context: context,
                                    mobile: const EdgeInsets.only(
                                      left: 24,
                                      top: 64,
                                    ),
                                    tablet: EdgeInsets.zero,
                                    desktop: EdgeInsets.zero,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Your',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: Color(0xFF000000)
                                                  .withOpacity(1),
                                              fontWeight: FontWeight.w600,
                                              fontSize:
                                                  getValueForScreenType<double>(
                                                context: context,
                                                mobile: 32,
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
                                      Text('Travel List',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: Color(0xFF000000)
                                                  .withOpacity(1),
                                              fontWeight: FontWeight.w400,
                                              fontSize:
                                                  getValueForScreenType<double>(
                                                context: context,
                                                mobile: 32,
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
                                ),
                              ),
                              SizedBox(
                                width: double.maxFinite,
                                height: getValueForScreenType<double?>(
                                  context: context,
                                  mobile: MediaQuery.of(context).size.height *
                                      100 /
                                      8,
                                  tablet: 150,
                                  desktop: 150,
                                ),
                                child: Container(
                                  margin: const EdgeInsets.only(
                                    left: 16,
                                    top: 8,
                                    right: 16,
                                    bottom: 8,
                                  ),
                                  width: double.maxFinite,
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
                                    border: null,
                                  ),
                                  child: TextField(
                                    onChanged: (String value) async {},
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor:
                                          Color(0xFFFFFFFF).withOpacity(1),
                                      counterStyle: TextStyle(
                                        color: Color(0xFFFFFFFF).withOpacity(1),
                                      ),
                                      border: OutlineInputBorder(
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
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1),
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
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1),
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
                                      hintText: 'Search',
                                      hintStyle: TextStyle(
                                        color: Color(0xFF000000).withOpacity(1),
                                      ),
                                      contentPadding: const EdgeInsets.only(
                                        left: 16,
                                      ),
                                    ),
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
                                    minLines: 1,
                                    showCursor: true,
                                    autocorrect: false,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        width: double.maxFinite,
                        height: getValueForScreenType<double?>(
                          context: context,
                          mobile: MediaQuery.of(context).size.height * 100 / 50,
                          tablet: 150,
                          desktop: 150,
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
                              Text('Best Place',
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
                              Icon(
                                MdiIcons.fromString('reload'),
                                size: getValueForScreenType<double?>(
                                  context: context,
                                  mobile: 15,
                                  tablet: 24,
                                  desktop: 24,
                                ),
                                color: Color(0xFF984747).withOpacity(1),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                            left: 24,
                          ),
                          child: SizedBox(
                            width: double.maxFinite,
                            height: getValueForScreenType<double?>(
                              context: context,
                              mobile: MediaQuery.of(context).size.height *
                                  100 /
                                  200,
                              tablet: 150,
                              desktop: 150,
                            ),
                            child: Text('''Hello Helloo Hello hello lhelo
lhelo lshdoi eodk jo doik do 
sd osdk so doif lsdi  
dli fosd osdi 
 dosiddf 
sd fosdif 
sdfi  ''',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: BlocProvider.of<ThemeCubit>(context)
                                        .getColor('Text / Primary'),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    fontStyle: FontStyle.normal,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                textAlign: TextAlign.left,
                                textDirection: TextDirection.ltr,
                                maxLines: 7),
                          )),
                      SizedBox(
                        width: double.maxFinite,
                        height: getValueForScreenType<double?>(
                          context: context,
                          mobile:
                              MediaQuery.of(context).size.height * 100 / 300,
                          tablet: 150,
                          desktop: 150,
                        ),
                        child: AnimationConfiguration.staggeredList(
                          position: 1,
                          duration: Duration(
                            milliseconds: 800,
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
                                Padding(
                                  padding: getValueForScreenType<EdgeInsets>(
                                    context: context,
                                    mobile: const EdgeInsets.only(
                                      left: 24,
                                    ),
                                    tablet: EdgeInsets.zero,
                                    desktop: EdgeInsets.zero,
                                  ),
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
                                    child: Stack(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  getValueForScreenType<
                                                      BorderRadius>(
                                                context: context,
                                                mobile: BorderRadius.only(
                                                  topLeft: Radius.circular(32),
                                                  topRight: Radius.circular(32),
                                                  bottomRight:
                                                      Radius.circular(32),
                                                  bottomLeft:
                                                      Radius.circular(32),
                                                ),
                                                tablet: BorderRadius.zero,
                                                desktop: BorderRadius.zero,
                                              ),
                                              child: Image.network(
                                                'https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80',
                                                width: getValueForScreenType<
                                                    double?>(
                                                  context: context,
                                                  mobile: 150,
                                                  tablet: double.maxFinite,
                                                  desktop: double.maxFinite,
                                                ),
                                                height: 150,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Padding(
                                              padding: getValueForScreenType<
                                                  EdgeInsets>(
                                                context: context,
                                                mobile: const EdgeInsets.only(
                                                  top: 4,
                                                  bottom: 4,
                                                ),
                                                tablet: EdgeInsets.zero,
                                                desktop: EdgeInsets.zero,
                                              ),
                                              child: Text('Nurina',
                                                  style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                      color: Color(0xFFFFFFFF)
                                                          .withOpacity(1),
                                                      fontWeight:
                                                          FontWeight.w700,
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
                                                  maxLines: 1),
                                            ),
                                            Text('''The Legend Persion
i Have Meet in
My Life''',
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    color: Color(0xFFFFFFFF)
                                                        .withOpacity(1),
                                                    fontWeight: FontWeight.w500,
                                                    fontSize:
                                                        getValueForScreenType<
                                                            double>(
                                                      context: context,
                                                      mobile: 14,
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
                                                maxLines: 3),
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
                                      left: 24,
                                    ),
                                    tablet: EdgeInsets.zero,
                                    desktop: EdgeInsets.zero,
                                  ),
                                  child: AnimationConfiguration.staggeredList(
                                    position: 1,
                                    duration: Duration(
                                      milliseconds: 800,
                                    ),
                                    child: FadeInAnimation(
                                      child: SlideAnimation(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  getValueForScreenType<
                                                      BorderRadius>(
                                                context: context,
                                                mobile: BorderRadius.only(
                                                  topLeft: Radius.circular(32),
                                                  topRight: Radius.circular(32),
                                                  bottomRight:
                                                      Radius.circular(32),
                                                  bottomLeft:
                                                      Radius.circular(32),
                                                ),
                                                tablet: BorderRadius.zero,
                                                desktop: BorderRadius.zero,
                                              ),
                                              child: Image.network(
                                                'https://images.unsplash.com/photo-1612333112094-f7cd05ddca73?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
                                                width: getValueForScreenType<
                                                    double?>(
                                                  context: context,
                                                  mobile: 150,
                                                  tablet: double.maxFinite,
                                                  desktop: double.maxFinite,
                                                ),
                                                height: 150,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Padding(
                                              padding: getValueForScreenType<
                                                  EdgeInsets>(
                                                context: context,
                                                mobile: const EdgeInsets.only(
                                                  top: 4,
                                                  bottom: 4,
                                                ),
                                                tablet: EdgeInsets.zero,
                                                desktop: EdgeInsets.zero,
                                              ),
                                              child: Text('Ciana Mochi',
                                                  style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                      color: Color(0xFFFFFFFF)
                                                          .withOpacity(1),
                                                      fontWeight:
                                                          FontWeight.w700,
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
                                                  maxLines: 1),
                                            ),
                                            Text('''Mest Friend Ever
I meet In My
Life World''',
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    color: Color(0xFFFFFFFF)
                                                        .withOpacity(1),
                                                    fontWeight: FontWeight.w500,
                                                    fontSize:
                                                        getValueForScreenType<
                                                            double>(
                                                      context: context,
                                                      mobile: 14,
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
                                                maxLines: 3),
                                          ],
                                        ),
                                      ),
                                    ),
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
                                  child: AnimationConfiguration.staggeredList(
                                    position: 1,
                                    duration: Duration(
                                      milliseconds: 800,
                                    ),
                                    child: FadeInAnimation(
                                      child: SlideAnimation(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  getValueForScreenType<
                                                      BorderRadius>(
                                                context: context,
                                                mobile: BorderRadius.only(
                                                  topLeft: Radius.circular(32),
                                                  topRight: Radius.circular(32),
                                                  bottomRight:
                                                      Radius.circular(32),
                                                  bottomLeft:
                                                      Radius.circular(32),
                                                ),
                                                tablet: BorderRadius.zero,
                                                desktop: BorderRadius.zero,
                                              ),
                                              child: Image.network(
                                                'https://images.unsplash.com/photo-1633607880355-4967b76c6d15?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
                                                width: getValueForScreenType<
                                                    double?>(
                                                  context: context,
                                                  mobile: 150,
                                                  tablet: double.maxFinite,
                                                  desktop: double.maxFinite,
                                                ),
                                                height: 150,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Padding(
                                              padding: getValueForScreenType<
                                                  EdgeInsets>(
                                                context: context,
                                                mobile: const EdgeInsets.only(
                                                  top: 4,
                                                  bottom: 4,
                                                ),
                                                tablet: EdgeInsets.zero,
                                                desktop: EdgeInsets.zero,
                                              ),
                                              child: Text('Moui Island',
                                                  style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                      color: Color(0xFFFFFFFF)
                                                          .withOpacity(1),
                                                      fontWeight:
                                                          FontWeight.w700,
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
                                                  maxLines: 1),
                                            ),
                                            Text('''Mouis is the second
Largest on the
Hawaii Island''',
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    color: Color(0xFFFFFFFF)
                                                        .withOpacity(1),
                                                    fontWeight: FontWeight.w500,
                                                    fontSize:
                                                        getValueForScreenType<
                                                            double>(
                                                      context: context,
                                                      mobile: 14,
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
                                                maxLines: 3),
                                          ],
                                        ),
                                      ),
                                    ),
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
                                  child: AnimationConfiguration.staggeredList(
                                    position: 1,
                                    duration: Duration(
                                      milliseconds: 800,
                                    ),
                                    child: FadeInAnimation(
                                      child: SlideAnimation(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  getValueForScreenType<
                                                      BorderRadius>(
                                                context: context,
                                                mobile: BorderRadius.only(
                                                  topLeft: Radius.circular(32),
                                                  topRight: Radius.circular(32),
                                                  bottomRight:
                                                      Radius.circular(32),
                                                  bottomLeft:
                                                      Radius.circular(32),
                                                ),
                                                tablet: BorderRadius.zero,
                                                desktop: BorderRadius.zero,
                                              ),
                                              child: Image.network(
                                                'https://images.unsplash.com/photo-1612571840309-0734f3b20406?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
                                                width: getValueForScreenType<
                                                    double?>(
                                                  context: context,
                                                  mobile: 150,
                                                  tablet: double.maxFinite,
                                                  desktop: double.maxFinite,
                                                ),
                                                height: 150,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Padding(
                                              padding: getValueForScreenType<
                                                  EdgeInsets>(
                                                context: context,
                                                mobile: const EdgeInsets.only(
                                                  bottom: 4,
                                                ),
                                                tablet: EdgeInsets.zero,
                                                desktop: EdgeInsets.zero,
                                              ),
                                              child: Text('Moui Island',
                                                  style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                      color: Color(0xFFFFFFFF)
                                                          .withOpacity(1),
                                                      fontWeight:
                                                          FontWeight.w700,
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
                                                  maxLines: 1),
                                            ),
                                            Text('''Mouis is the second
Largest on the
Hawaii Island''',
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    color: Color(0xFFFFFFFF)
                                                        .withOpacity(1),
                                                    fontWeight: FontWeight.w500,
                                                    fontSize:
                                                        getValueForScreenType<
                                                            double>(
                                                      context: context,
                                                      mobile: 14,
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
                                                maxLines: 3),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.maxFinite,
                        height: getValueForScreenType<double?>(
                          context: context,
                          mobile: MediaQuery.of(context).size.height * 100 / 30,
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
                              Padding(
                                padding: getValueForScreenType<EdgeInsets>(
                                  context: context,
                                  mobile: const EdgeInsets.only(
                                    left: 24,
                                  ),
                                  tablet: EdgeInsets.zero,
                                  desktop: EdgeInsets.zero,
                                ),
                                child: BouncingWidget(
                                  onPressed: () async {
                                    await Navigator.push<void>(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            PageMakeNewpagecopypestA2(),
                                      ),
                                    );
                                  },
                                  duration: const Duration(milliseconds: 100),
                                  scaleFactor: 1.5,
                                  child: Stack(
                                    children: [
                                      ClipRRect(
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
                                          'https://images.unsplash.com/photo-1604537466158-719b1972feb8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1169&q=80',
                                          width: getValueForScreenType<double?>(
                                            context: context,
                                            mobile: 350,
                                            tablet: double.maxFinite,
                                            desktop: double.maxFinite,
                                          ),
                                          height:
                                              getValueForScreenType<double?>(
                                            context: context,
                                            mobile: 200,
                                            tablet: 150,
                                            desktop: 150,
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Container(
                                        padding:
                                            getValueForScreenType<EdgeInsets>(
                                          context: context,
                                          mobile: const EdgeInsets.only(
                                            left: 24,
                                            top: 24,
                                            right: 24,
                                            bottom: 24,
                                          ),
                                          tablet: EdgeInsets.zero,
                                          desktop: EdgeInsets.zero,
                                        ),
                                        width: getValueForScreenType<double?>(
                                          context: context,
                                          mobile: 330,
                                          tablet: double.maxFinite,
                                          desktop: double.maxFinite,
                                        ),
                                        height: getValueForScreenType<double?>(
                                          context: context,
                                          mobile: 200,
                                          tablet: null,
                                          desktop: null,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.zero,
                                        ),
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('Himalay',
                                                  style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                      color: BlocProvider.of<
                                                                  ThemeCubit>(
                                                              context)
                                                          .getColor(
                                                              'Text / Primary'),
                                                      fontWeight:
                                                          FontWeight.w500,
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
                                              Row(
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
                                                        right: 4,
                                                      ),
                                                      tablet: EdgeInsets.zero,
                                                      desktop: EdgeInsets.zero,
                                                    ),
                                                    child: Icon(
                                                      MdiIcons.fromString(
                                                          'crosshairs-gps'),
                                                      size:
                                                          getValueForScreenType<
                                                              double?>(
                                                        context: context,
                                                        mobile: 14,
                                                        tablet: 24,
                                                        desktop: 24,
                                                      ),
                                                      color: Color(0xFF000000)
                                                          .withOpacity(1),
                                                    ),
                                                  ),
                                                  Text('Tempal',
                                                      style:
                                                          GoogleFonts.poppins(
                                                        textStyle: TextStyle(
                                                          color: BlocProvider
                                                                  .of<ThemeCubit>(
                                                                      context)
                                                              .getColor(
                                                                  'Text / Primary'),
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize:
                                                              getValueForScreenType<
                                                                  double>(
                                                            context: context,
                                                            mobile: 12,
                                                            tablet: 16,
                                                            desktop: 16,
                                                          ),
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          decoration:
                                                              TextDecoration
                                                                  .none,
                                                        ),
                                                      ),
                                                      textAlign: TextAlign.left,
                                                      textDirection:
                                                          TextDirection.ltr,
                                                      maxLines: 1),
                                                ],
                                              ),
                                              Container(
                                                width: getValueForScreenType<
                                                    double?>(
                                                  context: context,
                                                  mobile: 24,
                                                  tablet: double.maxFinite,
                                                  desktop: double.maxFinite,
                                                ),
                                                height: getValueForScreenType<
                                                    double?>(
                                                  context: context,
                                                  mobile: 24,
                                                  tablet: null,
                                                  desktop: null,
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.zero,
                                                ),
                                                child: Icon(
                                                  MdiIcons.fromString(
                                                      'star-outline'),
                                                  size: getValueForScreenType<
                                                      double?>(
                                                    context: context,
                                                    mobile: 18,
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
                                      ),
                                    ],
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
                          MdiIcons.fromString('image-area'),
                          size: getValueForScreenType<double?>(
                            context: context,
                            mobile: 20,
                            tablet: 24,
                            desktop: 24,
                          ),
                          color: Color(0xFF000000).withOpacity(1),
                        ),
                        Icon(
                          MdiIcons.fromString('video'),
                          size: getValueForScreenType<double?>(
                            context: context,
                            mobile: 20,
                            tablet: 24,
                            desktop: 24,
                          ),
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
                          MdiIcons.fromString('cards-heart'),
                          size: 24,
                          color: Color(0xFF000000).withOpacity(1),
                        ),
                        Icon(
                          MdiIcons.fromString('phone'),
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
