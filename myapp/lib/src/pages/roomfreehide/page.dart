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

class PageRoomFreeHide extends StatefulWidget {
  const PageRoomFreeHide({
    Key? key,
  }) : super(key: key);

  @override
  _StateRoomFreeHide createState() => _StateRoomFreeHide();
}

class _StateRoomFreeHide extends State<PageRoomFreeHide> {
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
        'name': "RoomFreeHide",
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
                    child: Text('कोठा खाली छ',
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
                        mobile: 350,
                        tablet: null,
                        desktop: null,
                      ),
                      decoration: BoxDecoration(
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
                                    Container(
                                      padding:
                                          getValueForScreenType<EdgeInsets>(
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
                                          'https://blogger.googleusercontent.com/img/a/AVvXsEhz0AvyYuI7T6syZnqeYaMF26i4G2qnI67PMwSRrj25TwlLWLgpkocpSZJid_6hIVEYAbbu-Dr6zpHhHDRxG4vP9XAfM1SxVEXc0aKYMxKIs6F0PdXgeMJgcOAVTJqAumniEzzT2Jl0se1dg2X0PrPgD3RUJEmUzkofyzfYQQsb2HOAYKjFSWgU0OhcZg=w640-h360',
                                          width: getValueForScreenType<double?>(
                                            context: context,
                                            mobile: 370,
                                            tablet: double.maxFinite,
                                            desktop: double.maxFinite,
                                          ),
                                          height:
                                              getValueForScreenType<double?>(
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
                                      padding:
                                          getValueForScreenType<EdgeInsets>(
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
                                          'https://1.bp.blogspot.com/-C4PZV5KLcQA/YEbgInAFgkI/AAAAAAAA3mw/SQDF-fyY3hID360mfeV2PZL7cimOtHNSACPcBGAYYCw/w640-h480/Post2.jpg',
                                          width: getValueForScreenType<double?>(
                                            context: context,
                                            mobile: 370,
                                            tablet: double.maxFinite,
                                            desktop: double.maxFinite,
                                          ),
                                          height:
                                              getValueForScreenType<double?>(
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
                                      padding:
                                          getValueForScreenType<EdgeInsets>(
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
                                          'https://1.bp.blogspot.com/-C4PZV5KLcQA/YEbgInAFgkI/AAAAAAAA3mw/SQDF-fyY3hID360mfeV2PZL7cimOtHNSACPcBGAYYCw/w640-h480/Post2.jpg',
                                          width: getValueForScreenType<double?>(
                                            context: context,
                                            mobile: 370,
                                            tablet: double.maxFinite,
                                            desktop: double.maxFinite,
                                          ),
                                          height:
                                              getValueForScreenType<double?>(
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
                              padding: const EdgeInsets.only(
                                left: 18,
                              ),
                              child: Text('''कोठा: 1 वटा 
स्थान: बीच बजार 
कोठा भाडा: Ra. 2,500
सम्पर्क: 9863023274 मन्थली बजार 
( पानि को राम्रो सुविधा भएको  )''',
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
                                  maxLines: 5)),
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
                        mobile: 370,
                        tablet: null,
                        desktop: null,
                      ),
                      decoration: BoxDecoration(
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
                                    Container(
                                      padding:
                                          getValueForScreenType<EdgeInsets>(
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
                                          'https://1.bp.blogspot.com/-6T2uCOpJSZ8/YFYFKWTEVtI/AAAAAAAA3ow/gaMGKYW5IUAOTP15HOrCkK-dpff1mZXZQCLcBGAsYHQ/w640-h480/Room%2B1.jpg',
                                          width: getValueForScreenType<double?>(
                                            context: context,
                                            mobile: 370,
                                            tablet: double.maxFinite,
                                            desktop: double.maxFinite,
                                          ),
                                          height:
                                              getValueForScreenType<double?>(
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
                                      padding:
                                          getValueForScreenType<EdgeInsets>(
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
                                          'https://1.bp.blogspot.com/-8UeZHciNIRo/YFYFVMFyGfI/AAAAAAAA3o0/KAaYVkfNZL0tG5dDPFnsGthsvXGIdSbswCLcBGAsYHQ/w640-h480/Room%2B2.jpg',
                                          width: getValueForScreenType<double?>(
                                            context: context,
                                            mobile: 370,
                                            tablet: double.maxFinite,
                                            desktop: double.maxFinite,
                                          ),
                                          height:
                                              getValueForScreenType<double?>(
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
                                      padding:
                                          getValueForScreenType<EdgeInsets>(
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
                                          'https://1.bp.blogspot.com/-C4PZV5KLcQA/YEbgInAFgkI/AAAAAAAA3mw/SQDF-fyY3hID360mfeV2PZL7cimOtHNSACPcBGAYYCw/w640-h480/Post2.jpg',
                                          width: getValueForScreenType<double?>(
                                            context: context,
                                            mobile: 370,
                                            tablet: double.maxFinite,
                                            desktop: double.maxFinite,
                                          ),
                                          height:
                                              getValueForScreenType<double?>(
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
                              padding: const EdgeInsets.only(
                                left: 18,
                              ),
                              child: Text('''कोठा: 3 वटा 
स्थान: भैसेशोर 
कोठा भाडा: Ra. 2,500
सम्पर्क: 9863023274  
( विद्यार्थी, नया अफिस को लागि सुहाउदो साथै पानी को राम्रो सुविधा भएको )''',
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
                        mobile: 350,
                        tablet: null,
                        desktop: null,
                      ),
                      decoration: BoxDecoration(
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
                                    Container(
                                      padding:
                                          getValueForScreenType<EdgeInsets>(
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
                                          'https://1.bp.blogspot.com/-6T2uCOpJSZ8/YFYFKWTEVtI/AAAAAAAA3ow/gaMGKYW5IUAOTP15HOrCkK-dpff1mZXZQCLcBGAsYHQ/w640-h480/Room%2B1.jpg',
                                          width: getValueForScreenType<double?>(
                                            context: context,
                                            mobile: 370,
                                            tablet: double.maxFinite,
                                            desktop: double.maxFinite,
                                          ),
                                          height:
                                              getValueForScreenType<double?>(
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
                                      padding:
                                          getValueForScreenType<EdgeInsets>(
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
                                          'https://1.bp.blogspot.com/-8UeZHciNIRo/YFYFVMFyGfI/AAAAAAAA3o0/KAaYVkfNZL0tG5dDPFnsGthsvXGIdSbswCLcBGAsYHQ/w640-h480/Room%2B2.jpg',
                                          width: getValueForScreenType<double?>(
                                            context: context,
                                            mobile: 370,
                                            tablet: double.maxFinite,
                                            desktop: double.maxFinite,
                                          ),
                                          height:
                                              getValueForScreenType<double?>(
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
                                      padding:
                                          getValueForScreenType<EdgeInsets>(
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
                                          'https://1.bp.blogspot.com/-C4PZV5KLcQA/YEbgInAFgkI/AAAAAAAA3mw/SQDF-fyY3hID360mfeV2PZL7cimOtHNSACPcBGAYYCw/w640-h480/Post2.jpg',
                                          width: getValueForScreenType<double?>(
                                            context: context,
                                            mobile: 370,
                                            tablet: double.maxFinite,
                                            desktop: double.maxFinite,
                                          ),
                                          height:
                                              getValueForScreenType<double?>(
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
                              padding: const EdgeInsets.only(
                                left: 18,
                              ),
                              child: Text('''कोठा: 2 वटा 
स्थान: बसपार्क  
कोठा भाडा: Ra. 3,000
सम्पर्क: 9754203172
( पानी को राम्रो सुविधा भएको )''',
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
                                  maxLines: 5)),
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
