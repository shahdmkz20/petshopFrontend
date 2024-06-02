import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petshop/api_links.dart';
import 'package:petshop/controller/cart/cartcontroller.dart';

import '../../../core/constants/colors.dart';


class CustomCartCard extends StatelessWidget {
   final String name;
   final String price;
   final String itemQuantity;
   final String imageName;
   final void Function()? onAdd;
   final void Function()? onRemove;
  const CustomCartCard({super.key, required this.name, required this.price, required this.itemQuantity, required this.imageName,required this.onAdd,required this.onRemove , });

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<CartControllerImp>(
      builder: (controller) {
        return Container(
             margin: const EdgeInsets.symmetric(horizontal: 7),
                child: Card(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: CachedNetworkImage(imageUrl: "${AppLink.imageItems}/$imageName"),
                            ),
                             Expanded(
                              flex: 3,
                              child: ListTile(
                                title: Padding(
                                  padding: const EdgeInsets.only(bottom: 5.0),
                                  child: Text(
                                    name,
                                    style:const  TextStyle(fontSize: 18),
                                  ),
                                ),
                                
                                subtitle: Text('$price\$' , style:const TextStyle(
                                  fontSize: 20 , 
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.defaultRed,
                                ),),
                              ),
                            ),
                            Expanded(
                                flex: 1,
                                child: Container(
                                  margin: const EdgeInsets.all(5),
                                  decoration : BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: AppColors.defaultWhite.withOpacity(0.5)
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 45,
                                        child: IconButton(
                                            onPressed:onAdd,
                                            icon: const Icon(Icons.add)),
                                      ),
                                       Text(itemQuantity),
                                      SizedBox(
                                        height: 35,
                                        child: IconButton(
                                            onPressed:onRemove,
                                            icon: const Icon(Icons.remove)),
                                      ),
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
      }
    );
  }
}