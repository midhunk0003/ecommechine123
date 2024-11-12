import 'package:flutter/material.dart';
import 'package:globalecomersmachinetesting/domain/dependence_injection/injectable.dart';
import 'package:globalecomersmachinetesting/presentation/provider/loginregisterprovider/loginandregisterprovider.dart';
import 'package:globalecomersmachinetesting/presentation/screen/authscreen/loginscreen.dart';
import 'package:globalecomersmachinetesting/presentation/screen/authscreen/registerscreen.dart';
import 'package:globalecomersmachinetesting/presentation/screen/homescreen/homescreen.dart';
import 'package:globalecomersmachinetesting/presentation/screen/splashscreen/splashscreen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configurationInjection();
  runApp(
    MyApp(
      initialRoute: '/',
    ),
  );
}

class MyApp extends StatelessWidget {
  final String? initialRoute;
  const MyApp({super.key, required this.initialRoute});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => getIt<Loginandregisterprovider>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ecommerce',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: initialRoute,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              return MaterialPageRoute(
                builder: (_) => Splashscreen(),
              );
            case '/bottomNavbar':
              return MaterialPageRoute(
                builder: (_) => BottomAppBar(),
              );
            case '/loginscreen':
              return MaterialPageRoute(
                builder: (_) => Loginscreen(),
              );
            case '/registerAccount':
              return MaterialPageRoute(
                builder: (_) => Registerscreen(),
              );
            case '/homescreen':
              return MaterialPageRoute(
                builder: (_) => Homescreen(),
              );
            default:
          }
          return null;
        },
        // home: Splashscreen(),
      ),
    );
  }
}
