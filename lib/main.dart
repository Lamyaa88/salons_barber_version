import 'package:almezynbarber/barbers_app/screens/auth/login_screen.dart';
import 'package:almezynbarber/utils/file_export.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'barbers_app/screens/app_tab/appForBarber.dart';
import 'network/cache_helper.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await translator.init(
    localeDefault: LocalizationDefaultType.asDefined,
    languagesList: <String>['en', 'ar'],
    assetsDirectory: 'assets/langs/',
  );
  DioHelper.init();
  await CacheHelper.init();
  /// get token when saved or not.
  token  = CacheHelper.getStringData(key: 'token');
  print(token);
  runApp(
    LocalizedApp(

      child: Docto(dtoken: token  ,),
    ),
  );



//  SystemChrome.setSystemUIOverlayStyle(
//      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
//  runApp(Phoenix(child: Docto(token: token,)));
}

class Docto extends StatelessWidget {
  final String dtoken;

  Docto({
    this.dtoken,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData( accentColor: Colors.white ,fontFamily: "Almarai"),
      debugShowCheckedModeBanner: false ,
      home: token != null  ? AppTabForBarber() : LoginScreen(),
      localizationsDelegates:
      translator.delegates, // Android + iOS Delegates
      locale: translator.locale, // Active locale
      supportedLocales: translator.locals(),
    );
  }
}