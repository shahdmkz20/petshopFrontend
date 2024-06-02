import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../controller/onboardingcontroller.dart';
import '../../../data/datasource/static/static.dart';

class onBoardingPageViewBuilder extends GetView<OnBoardingControllerImp> {
  const onBoardingPageViewBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageCont,
        onPageChanged: (val) {
          controller.onPageChanged(val);
        },
        itemCount: onBoardingModelList.length,
        itemBuilder: (context, i) => Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      clipBehavior: Clip.hardEdge,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                spreadRadius: 5,
                                color: Colors.grey)
                          ]),
                      child: SvgPicture.asset(
                        onBoardingModelList[i].imageUrl!,
                        width: 150,
                        height: 300,
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    onBoardingModelList[i].title!,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text(onBoardingModelList[i].body!,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyLarge)),
                ],
              ),
            ));
  }
}
