import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/onboardingcontroller.dart';
import '../widget/onboardingwidgets/custombutton.dart';
import '../widget/onboardingwidgets/pagecontroller.dart';
import '../widget/onboardingwidgets/pageviewbuilder.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return const Scaffold(
      body: SafeArea(
        child: Center(
          // Center the content vertically
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Center the content horizontally
            children: [
              Expanded(
                flex: 4,
                child: onBoardingPageViewBuilder(),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    controllerOnBoarding(),
                    SizedBox(
                        height: 16), // Added space for better visual separation
                    CustomButtonOnBoarding(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
