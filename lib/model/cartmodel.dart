class CartModel {
  double? itemprice;
  int? itemCount;
  int? cartId;
  String? cartUserEmail;
  int? cartItemId;
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

  CartModel(
      {this.itemprice,
      this.itemCount,
      this.cartId,
      this.cartUserEmail,
      this.cartItemId,
      this.itemId,
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
      this.itemCat});

  CartModel.fromJson(Map<String, dynamic> json) {
    itemprice = json['itemprice'];
    itemCount = json['itemCount'];
    cartId = json['cart_id'];
    cartUserEmail = json['cart_userEmail'];
    cartItemId = json['cart_itemId'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemprice'] = this.itemprice;
    data['itemCount'] = this.itemCount;
    data['cart_id'] = this.cartId;
    data['cart_userEmail'] = this.cartUserEmail;
    data['cart_itemId'] = this.cartItemId;
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
    return data;
  }
}