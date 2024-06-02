import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../controller/cart/cartcontroller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/functions/translatedb.dart';
import '../../widget/cart/customcartbutton.dart';
import '../../widget/cart/customcartcard.dart';
import '../../widget/cart/customtotalrow.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    CartControllerImp controller = Get.put(CartControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text('84'.tr),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: GetBuilder<CartControllerImp>(builder: (controller) {
        return Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Divider(),
                CustomTotalRow(
                  totalPrice: controller.totalPrice.toStringAsFixed(1),
                ),
                const SizedBox(height: 10),
                CustomCartButton(
                  text: 'Place order',
                  onTap: () {
                    controller.goToPlaceOrder(); 
                  },
                ),
              ],
            ));
      }),
      body: GetBuilder<CartControllerImp>(builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView(
            children: [
              ...List.generate(
                  controller.data.length,
                  (index) => CustomCartCard(
                        name: translateDatabase(
                            controller.data[index].itemNameAr!,
                            controller.data[index].itemNameEng!),
                        price:((controller.data[index].itemPrice ?? 0) * (controller.data[index].itemCount ?? 0).toDouble() ).toStringAsFixed(1)
,
                        itemQuantity:
                            controller.data[index].itemCount.toString(),
                        imageName: controller.data[index].itemImage!,
                        onRemove: () async {
                          await controller
                              .delete("${controller.data[index].itemId!}");
                          controller.refreshUi();
                        },
                        onAdd: () async {
                          await controller
                              .add("${controller.data[index].itemId!}");
                          controller.refreshUi();
                        },
                      ))
            ],
          ),
        );
      }),
    );
  }
}
