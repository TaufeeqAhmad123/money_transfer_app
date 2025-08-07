import 'package:flutter/material.dart';
import 'package:money_transfer/provider/bottom_nav_bar.dart';
import 'package:money_transfer/widget/bottom.nav_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) => MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => BottomBarProvider())],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: BottomNavBar(),
        ),
      ),
    );
  }
}
