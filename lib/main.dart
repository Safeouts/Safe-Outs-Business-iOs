import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safeouts_business/providers/product_provider.dart';
import 'package:safeouts_business/screens/splashscreen.dart';
import 'package:safeouts_business/services/firestore_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());

}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  final firestoreService = FirestoreService();

  final ThemeData _theme = _buildTheme();


  return MultiProvider(
      providers: [
      ChangeNotifierProvider(create: (context) => ProductProvider()),
    StreamProvider(create: (context)=> firestoreService.getProducts()),
    ],
    child: MaterialApp(
      title: 'Flutter Demo',
      theme: _theme,
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    ),
    );
  }
}

ThemeData _buildTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    primaryColor: Colors.white,
    primaryColorBrightness: Brightness.light,
    primaryTextTheme: Typography.blackMountainView,
    primaryIconTheme: const IconThemeData(
      color: Colors.grey,
    ),
    accentColor: Colors.green[800],
    buttonTheme: base.buttonTheme.copyWith(
      buttonColor: Colors.green[800],
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    ),
    scaffoldBackgroundColor: Colors.white,
  );
}