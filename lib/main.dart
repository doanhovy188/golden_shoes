import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golden_shoes/src/ui/product_screen/product_screen.dart';
import 'package:golden_shoes/src/utils/color.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: GoogleFonts.rubik().fontFamily,
        backgroundColor: whiteColor,
        primarySwatch: Colors.blue,
      ),
      home: ProductScreen(),
    );
  }
}
