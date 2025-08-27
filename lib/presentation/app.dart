import 'package:flutter/material.dart';

import '../common/contant.dart';
import 'routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigator,
        initialRoute: RouteList.loginScreen,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
