import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petshop/controller/homecontroller/itemscontroller.dart';
import 'package:petshop/core/constants/colors.dart';
import 'package:petshop/core/functions/translatedb.dart';
import 'package:petshop/model/itemsmodel.dart';

import '../../../../api_links.dart';

class CustomItemCar extends GetView<itemSControllerImp> {
  final ItemsModel itemsModel;

  const CustomItemCar({Key? key, required this.itemsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){controller.goToProd(itemsModel);
     
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: CachedNetworkImage(
                  imageUrl: '${AppLink.imageItems}/${itemsModel.itemImage}',
                  fit: BoxFit.fitHeight,
                  width: double.infinity,
                  height: 200,
                
                ),
              ),
              
              Text(
                translateDatabase(itemsModel.itemNameAr,  itemsModel.itemNameEng!) , 
               
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 1),
              Text(
                '${translateDatabase(itemsModel.categoryNameAr, itemsModel.categoryNameEng)}',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 1),
              Text(
                '${itemsModel.itemPrice!}\$',
                style: TextStyle(color: AppColors.defaultRed , fontWeight: FontWeight.w800),
                textAlign: TextAlign.center,
                
              ),
              const SizedBox(height: 2), 
            ],
          ),
        ),
      ),
    );
  }
}
