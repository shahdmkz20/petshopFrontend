import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../controller/order/orderaddress.dart';
import '../../reusable/button.dart';
import '../../reusable/largebodytext.dart';
import '../../widget/auth/customformfield.dart';
import '../../widget/orders/addressdesc.dart';

class OrderAddress extends StatelessWidget {
  const OrderAddress({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderAddressImp());
    return Scaffold(
      body: GetBuilder<OrderAddressImp>(builder: (controller) {
        return Form(
          key: controller.formStateKey,
          child: Stack(
            children: [
         
              Positioned(
                top: -35.0,
                right: -25.0,
                child: Container(
                  width: 200.0,
                  height: 200.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.orange.withOpacity(0.1),
                  ),
                ),
              ),
              Center(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 35),
                          LargeBodyText(text: '75'.tr),
                          const SizedBox(height: 15),

                          CustomFormField(
                            fieldName: "76".tr,
                            hintTxt: "76".tr,
                            txtController: controller.addressCity,
                          ),
                          CustomFormField(
                            txtController: controller.addressStreet,
                            fieldName: "77".tr,
                            hintTxt: "77".tr,
                          ),

                          CustomFormField(
                          
                            txtController: controller.addressPhone,
                            fieldName: "78".tr,
                            hintTxt: "78".tr,
                          ),
                          const SizedBox(height: 10),
                          
                              CustomDescriptionField(hintTxt: '83'.tr,
                              fieldName: '82'.tr,
                              txtController: controller.addressDesc,),
                          CustomButton(
                            btnTxt: '87'.tr,
                            onPressed: () {
                              controller.verifyAddress();
                            },
                          ),
                          const SizedBox(height: 5,) , 
                          controller.showConfirm ? 
                            CustomButton(
                            btnTxt: '80'.tr,
                            onPressed: () async {
                              await controller.confirmOrder();
                              controller.toOrders();
                            },
                          )  : Container() ,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
