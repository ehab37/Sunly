import 'package:flutter/material.dart';
import 'package:go_transitions/go_transitions.dart';
import 'core/utils/app_router.dart';

void main() {
  runApp(const Sunly());
}

class Sunly extends StatelessWidget {
  const Sunly({super.key});

  @override
  Widget build(BuildContext context) {
    GoTransition.defaultCurve = Curves.easeInOut;
    GoTransition.defaultDuration = Duration(milliseconds: 400);
    return MaterialApp.router(
      theme: ThemeData(
        fontFamily: "Poppins",
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
