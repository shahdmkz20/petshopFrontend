
import 'package:flutter/material.dart';

import 'package:get/get.dart';




import '../../../controller/order/myorderscontroller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../model/ordersmodel.dart';
import '../../widget/orders/customtextfield.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    myOrdersImp controller = Get.put(myOrdersImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders '),
        automaticallyImplyLeading: false,
      ),
      body: GetBuilder<myOrdersImp>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
             margin: const EdgeInsets.all(15),
                child: GetBuilder<myOrdersImp>(builder: (controller) =>
                ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (context , index) => MyOrdersList( ordermodel: controller.data[index]))
                ),
                ),
          );
        }
      ));
  }
}

class MyOrdersList extends StatelessWidget {
   final ordersmodel ordermodel;
  const MyOrdersList({super.key, required this.ordermodel});

  @override
  Widget build(BuildContext context) {
  
    return  Card(
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CustomTextField(data:"${'88'.tr}      :") , 
          const Spacer(),
         Text("${ordermodel.ordersId}"),
          ],
        ),
        const SizedBox(height: 8), // Add spacing between text widgets
        Row(
          children: [
             CustomTextField(data:"${'89'.tr}  :") , 
             
            const Spacer(),
             Text('${ordermodel.ordersTime}'),
          ],
        ),
        const SizedBox(height: 8), // Add spacing between text widgets
         Row(
          children: [
              CustomTextField(data:"${'90'.tr}  :") , 
              
         
            const Spacer(),
             Text('${ordermodel.ordersPrice}'),
          ],
        ),
      ],
    ),
  ),
)
;
  }
}
