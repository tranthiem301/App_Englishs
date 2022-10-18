import 'package:flutter/material.dart';
// ignore: unused_import, unnecessary_import
import 'package:flutter/services.dart';
import 'package:tu_dien/values/app_assets.dart';
import 'package:tu_dien/values/app_colors.dart';
import 'package:tu_dien/values/app_styles.dart';

import 'home_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text("Welcome to", style: AppStyles.h3))),
            Expanded(
                child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'English',
                    style: AppStyles.h2.copyWith(
                        color: color.blackGray, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Text(
                      'Qoutes"',
                      style: AppStyles.h4.copyWith(height: 0.5),
                      textAlign: TextAlign.right,
                    ),
                  )
                ],
              ),
            )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 70),
                child: RawMaterialButton(
                    shape: const CircleBorder(),
                    fillColor: color.lighBlue,
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => HomePage()), (route) => false);
                    },
                    // child: Image.asset(AppAssets.imagePath)
                    child: const Icon(Icons.navigate_next_outlined,)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
