class ItemsModel {
  int? itemId;
  String? itemNameEng;
  String? itemNameAr;
  String? itemDescriptionEng;
  String? itemDescriptionAr;
  String? itemImage;
  int? itemQuantity;
  int? itemActive;
  double? itemPrice;
  int? itemDiscount;
  String? itemDate;
  int? itemCat;
  int? categoryId;
  String? categoryNameEng;
  String? categoryNameAr;
  String? categoryDate;
  String? categoryImage;

  ItemsModel(
      {this.itemId,
        this.itemNameEng,
        this.itemNameAr,
        this.itemDescriptionEng,
        this.itemDescriptionAr,
        this.itemImage,
        this.itemQuantity,
        this.itemActive,
        this.itemPrice,
        this.itemDiscount,
        this.itemDate,
        this.itemCat,
        this.categoryId,
        this.categoryNameEng,
        this.categoryNameAr,
        this.categoryDate,
        this.categoryImage});

  ItemsModel.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    itemNameEng = json['item_name_eng'];
    itemNameAr = json['item_name_ar'];
    itemDescriptionEng = json['item_description_eng'];
    itemDescriptionAr = json['item_description_ar'];
    itemImage = json['item_image'];
    itemQuantity = json['item_quantity'];
    itemActive = json['item_active'];
    itemPrice = json['item_price']; 
    itemDiscount = json['item_discount'];
    itemDate = json['item_date'];
    itemCat = json['item_cat'];
    categoryId = json['category_id'];
    categoryNameEng = json['category_name_eng'];
    categoryNameAr = json['category_name_ar'];
    categoryDate = json['category_date'];
    categoryImage = json['category_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item_id'] = this.itemId;
    data['item_name_eng'] = this.itemNameEng;
    data['item_name_ar'] = this.itemNameAr;
    data['item_description_eng'] = this.itemDescriptionEng;
    data['item_description_ar'] = this.itemDescriptionAr;
    data['item_image'] = this.itemImage;
    data['item_quantity'] = this.itemQuantity;
    data['item_active'] = this.itemActive;
    data['item_price'] = this.itemPrice;
    data['item_discount'] = this.itemDiscount;
    data['item_date'] = this.itemDate;
    data['item_cat'] = this.itemCat;
    data['category_id'] = this.categoryId;
    data['category_name_eng'] = this.categoryNameEng;
    data['category_name_ar'] = this.categoryNameAr;
    data['category_date'] = this.categoryDate;
    data['category_image'] = this.categoryImage;
    return data;
  }
}