import 'package:flutter/material.dart';
import 'package:movies_app/providers/movies_provider.dart';
import 'package:movies_app/screens/details_screen.dart';
import 'package:movies_app/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => MoviesProvider(), lazy: false)],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Puchy Movies',
      initialRoute: 'home',
      routes: {'home': (_) => HomeScreen(), 'detalles': (_) => DetailsScreen()},
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(color: Colors.blue.shade600),
      ),
    );
  }
}
