import 'package:adaptive_user_interface_app/screens/ZomatoHomeScreen.dart';
import 'package:adaptive_user_interface_app/screens/ZomatoRestaurantScreen.dart';
import 'package:adaptive_user_interface_app/viewModel/ColoursViewModel.dart';
import 'package:adaptive_user_interface_app/themes/theme_values.dart';
import 'package:adaptive_user_interface_app/viewModel/AdaptiveWidgetsViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<CustomColoursViewModel>(
            create: (_) => CustomColoursViewModel(blueTheme)),
        ChangeNotifierProvider<AdaptiveWidgetsViewModel>(
          create: (_) => AdaptiveWidgetsViewModel(),
        ),
        // Provider(create: (context) => SomeOtherClass()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<CustomColoursViewModel>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Zomato",
      theme: themeNotifier.getTheme,
      home: ZomatoHomeScreen(),
      routes: {
        ZomatoHomeScreen.routeName: (ctx) => ZomatoHomeScreen(),
        ZomatoRestaurantScreen.routeName: (ctx) => ZomatoRestaurantScreen(),
      },
    );
  }
}
