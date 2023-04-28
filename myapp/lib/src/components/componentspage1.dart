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

class PageComponentspageA1 extends StatefulWidget {
  const PageComponentspageA1({
    Key? key,
    this.manthali1 = '''Manthali 1''',
    this.manthali2 = '''Manthali 2''',
    this.imageParama = '''Image''',
  }) : super(key: key);

  final String manthali1;
  final String manthali2;
  final String imageParama;

  @override
  _StateComponentspageA1 createState() => _StateComponentspageA1();
}

class _StateComponentspageA1 extends State<PageComponentspageA1> {
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
        'name': "ComponentspageA1",
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              child: Image.network(
                'https://source.unsplash.com/random',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            Text('''${widget.manthali1}''',
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
          ],
        ),
        Card(
          elevation: double.tryParse('${widget.imageParama}') ?? 1,
          color: Color(0xFF000000).withOpacity(1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                child: Image.network(
                  '''${widget.imageParama}''',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              Text('''${widget.imageParama}''',
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
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: double.tryParse('${widget.imageParama}') ?? 1,
              color: Color(0xFF000000).withOpacity(1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              child: const SizedBox(),
            ),
          ],
        ),
      ],
    );
  }
}
