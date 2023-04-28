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

class PageRomeFree extends StatefulWidget {
  const PageRomeFree({
    Key? key,
  }) : super(key: key);

  @override
  _StateRomeFree createState() => _StateRomeFree();
}

class _StateRomeFree extends State<PageRomeFree> {
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
        'name': "RomeFree",
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
                                    child: Text('कोठा खालि छ',
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
                                  'https://blogger.googleusercontent.com/img/a/AVvXsEhz0AvyYuI7T6syZnqeYaMF26i4G2qnI67PMwSRrj25TwlLWLgpkocpSZJid_6hIVEYAbbu-Dr6zpHhHDRxG4vP9XAfM1SxVEXc0aKYMxKIs6F0PdXgeMJgcOAVTJqAumniEzzT2Jl0se1dg2X0PrPgD3RUJEmUzkofyzfYQQsb2HOAYKjFSWgU0OhcZg=w640-h360',
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
                                    mobile: 155,
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
                                  child: Padding(
                                      padding:
                                          getValueForScreenType<EdgeInsets>(
                                        context: context,
                                        mobile: const EdgeInsets.only(
                                          left: 18,
                                          top: 18,
                                        ),
                                        tablet: const EdgeInsets.only(
                                          left: 18,
                                        ),
                                        desktop: const EdgeInsets.only(
                                          left: 18,
                                        ),
                                      ),
                                      child: Text('''कोठा: 1 वटा 
स्थान: बीच बजार 
कोठा भाडा: Ra. 2,500
सम्पर्क: 9863023274 मन्थली बजार 
( पानि को राम्रो सुविधा भएको  )''',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: BlocProvider.of<
                                                      ThemeCubit>(context)
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
                                )),
                              ),
                            ],
                          )),
                      Padding(
                          padding: getValueForScreenType<EdgeInsets>(
                            context: context,
                            mobile: const EdgeInsets.only(
                              top: 20,
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
                                  'https://1.bp.blogspot.com/-C4PZV5KLcQA/YEbgInAFgkI/AAAAAAAA3mw/SQDF-fyY3hID360mfeV2PZL7cimOtHNSACPcBGAYYCw/w640-h480/Post2.jpg',
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
                                  child: Padding(
                                      padding:
                                          getValueForScreenType<EdgeInsets>(
                                        context: context,
                                        mobile: const EdgeInsets.only(
                                          left: 18,
                                          top: 18,
                                        ),
                                        tablet: const EdgeInsets.only(
                                          left: 18,
                                        ),
                                        desktop: const EdgeInsets.only(
                                          left: 18,
                                        ),
                                      ),
                                      child: Text('''कोठा: 3 वटा 
स्थान: भैसेशोर 
कोठा भाडा: Ra. 2,500
सम्पर्क: 9863023274  
( विद्यार्थी, नया अफिस को लागि सुहाउदो साथै पानी को राम्रो सुविधा भएको )''',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: BlocProvider.of<
                                                      ThemeCubit>(context)
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
                                )),
                              ),
                            ],
                          )),
                      Padding(
                          padding: getValueForScreenType<EdgeInsets>(
                            context: context,
                            mobile: const EdgeInsets.only(
                              top: 20,
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
                                  'https://1.bp.blogspot.com/-6T2uCOpJSZ8/YFYFKWTEVtI/AAAAAAAA3ow/gaMGKYW5IUAOTP15HOrCkK-dpff1mZXZQCLcBGAsYHQ/w640-h480/Room%2B1.jpg',
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
                                    mobile: 155,
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
                                  child: Padding(
                                      padding:
                                          getValueForScreenType<EdgeInsets>(
                                        context: context,
                                        mobile: const EdgeInsets.only(
                                          left: 18,
                                          top: 18,
                                        ),
                                        tablet: const EdgeInsets.only(
                                          left: 18,
                                        ),
                                        desktop: const EdgeInsets.only(
                                          left: 18,
                                        ),
                                      ),
                                      child: Text('''कोठा: 2 वटा 
स्थान: बसपार्क  
कोठा भाडा: Ra. 3,000
सम्पर्क: 9754203172
( पानी को राम्रो सुविधा भएको )''',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: BlocProvider.of<
                                                      ThemeCubit>(context)
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
