import 'package:flutter/cupertino.dart';
import 'package:xertain/utils/routes/routes_name.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 1500), () {
      Navigator.of(context).pushNamed(MyRoutes.imageGenerator);
    });
  }

  @override
  Widget build(BuildContext context) {
    return  CupertinoPageScaffold(
      backgroundColor: CupertinoColors.placeholderText,
      child: Center(child: Image.asset('assets/logo.png')),
    );
  }
}
