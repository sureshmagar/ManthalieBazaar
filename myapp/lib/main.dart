  import 'package:myapp/src/teta_files/imports.dart';

  
  import 'package:purchases_flutter/purchases_flutter.dart';
  import 'package:flutter_stripe/flutter_stripe.dart';
  import 'package:google_mobile_ads/google_mobile_ads.dart';
  
  import 'package:mixpanel_flutter/mixpanel_flutter.dart';
  import 'package:myapp/cubit/airtable_cubit.dart';
  import 'package:hive/hive.dart';
  import 'package:hive_flutter/hive_flutter.dart';
  import 'package:firebase_core/firebase_core.dart';
  import 'package:firebase_analytics/firebase_analytics.dart';
  import 'package:firebase_messaging/firebase_messaging.dart';
  import 'package:flutter_local_notifications/flutter_local_notifications.dart';

  void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    TetaCMS.initialize(
      token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNtdHYyMTAwQGdtYWlsLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJwcm9qZWN0cyI6WzQ0NTgyLDE2MDM2NiwxNTAzODJdLCJpbWFnZSI6Imh0dHBzOi8vbGgzLmdvb2dsZXVzZXJjb250ZW50LmNvbS9hL0FHTm15eFpoQTVqajVjLUd2S0gwaDdLX3lZU2lfYWoyV3FyV2hBSlExdWlrU1U0PXM5Ni1jIiwibmFtZSI6IlN1cmVzaCBNYWdhciIsImVtaXR0ZXIiOiJUZXRhLUF1dGgiLCJpYXQiOjE2Nzc0MjI3ODgsImV4cCI6NDgzMzE4Mjc4OH0.9NX6QodxkSOjkaSNRz8fBALUnEzSElcgnwwJa-RMcJc',
      prjId: 150382,
    );
        if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
          apiKey: "",
          authDomain: "",
          projectId: "",
          storageBucket: "",
         messagingSenderId: "",
          appId: "",
          measurementId: "",
    ),
      );
  } else {
    await Firebase.initializeApp();
  }
      await FirebaseMessagingInit.init();
  LocalNotificaionServices.initialize();

      await MobileAds.instance.initialize();
  
    
        if (UniversalPlatform.isAndroid) {
      await Purchases.setup('');
    } else if (UniversalPlatform.isIOS) {
      await Purchases.setup('');
    }
        
    
    MixpanelService.instance.client = await Mixpanel.init(
  '',
  trackAutomaticEvents: false,
);


    await Hive.initFlutter();
await Hive.openBox<dynamic>('datasets');
      AirtableInstance.initialize(apiKey: "", projectBase: "");
  
    runApp(
      MyApp()
    );
  }

  class MyApp extends StatefulWidget {
    @override
    _MyAppState createState() => _MyAppState();
  }

  class _MyAppState extends State<MyApp> {
    @override
    void initState() {
      TranslatorGenerator.instance.init(
        mapLocales: [
          MapLocale('en', AppLocale.en),MapLocale('ne', AppLocale.ne),
        ],
        initLanguageCode: 'ne',
      );
      TranslatorGenerator.instance.onTranslatedLanguage = _onTranslatedLanguage;
      super.initState();
    }

    void _onTranslatedLanguage(final Locale? locale) {
      setState(() {});
    }

    @override
    Widget build(BuildContext context) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(
            lazy: false,
            create: (final context) => ThemeCubit(),
          ),
        ],
        child: Sizer(
          builder: (
            final context,
            final orientation,
            final deviceType,
          ) => MaterialApp(
            title: 'Manthali eBazaar',
            supportedLocales: TranslatorGenerator.instance.supportedLocales,
            localizationsDelegates: TranslatorGenerator.instance.localizationsDelegates,
            home: SplashScreenView(
              navigateRoute: PageEntryPoint(
                key: ValueKey('PageEntryPoint ${TranslatorGenerator.instance.getLanguageName()}'),
              ),
              duration: 2200,
              imageSize: 80,
              imageSrc: 'assets/teta-app.png',
              text: '',
              textType: TextType.NormalText,
              textStyle: TextStyle(
                fontSize: 30.0,
              ),
              backgroundColor: Colors.black,
            ),
          ),
        ), 
      );
    }
  }
  
  