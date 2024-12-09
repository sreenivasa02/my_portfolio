import 'package:flutter/material.dart';
import 'package:myportfolio/providers/scroll_provider.dart';
import 'package:myportfolio/screens/home_screen.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ScrollProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
      ),
    ),
  );
}