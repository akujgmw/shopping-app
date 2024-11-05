import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_app/screens/account_page.dart';
import 'package:shopping_app/screens/cart_page.dart';
import 'package:shopping_app/screens/detail_page.dart';
import 'package:shopping_app/screens/home_page.dart';
import 'package:shopping_app/screens/login_page.dart';
import 'package:shopping_app/screens/register_page.dart';
import 'package:shopping_app/screens/settings_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<bool> _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('token');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _checkLoginStatus(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          initialRoute: snapshot.data == true ? '/home' : '/login',
          routes: {
            '/login': (context) => LoginPage(),
            '/register': (context) => RegisterPage(),
            '/home': (context) => HomePage(),
            '/detail': (context) => const DetailPage(),
            '/account': (context) => AccountPage(),
            '/settings': (context) => SettingsPage(),
            '/cart': (context) => CartPage(),
          },
          onGenerateRoute: (settings) {
            if (settings.name == '/detail') {
              final item = settings.arguments as Map<String, dynamic>;
              return MaterialPageRoute(
                builder: (context) => DetailPage(),
                settings: RouteSettings(arguments: item),
              );
            }
            return null;
          },
        );
      },
    );
  }
}
