import 'package:flutter/material.dart';
import 'package:myapp/const/theme.dart';
import 'package:myapp/provider/darkTheme.dart';
import 'package:myapp/screens/bottom_bar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  DarkThemeProvider darkThemeProvider = DarkThemeProvider();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return darkThemeProvider;
        }),
      ],
      builder: (context, child) =>
          Consumer<DarkThemeProvider>(builder: (context, themeData, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Flutter Demo App",
          theme: Styles.themeData(darkThemeProvider.darkTheme, context),
          home: BottomBar(),
        );
      }),
    );
  }
}
