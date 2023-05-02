import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:xertain/utils/multiprovider_list.dart';
import 'package:xertain/utils/routes/route.dart';

import 'module/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) async {
    runApp(const MyApp());
  });
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      /// [List of provider] used in the project
      providers: multiProviderList,
      child: const  CupertinoApp(
        debugShowCheckedModeBanner: false,
        theme: CupertinoThemeData(brightness: Brightness.light),
        home: SplashPage(),
        onGenerateRoute: Routes.generateRoutes,
      ),
    );
  }
}
