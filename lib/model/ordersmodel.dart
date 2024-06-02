class ordersmodel {
  int? ordersId;
  String? ordersUserEmail;
  int? ordersAddress;
  int? ordersPrice;
  String? ordersTime;

  ordersmodel(
      {this.ordersId,
      this.ordersUserEmail,
      this.ordersAddress,
      this.ordersPrice,
      this.ordersTime});

  ordersmodel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersUserEmail = json['orders_userEmail'];
    ordersAddress = json['orders_address'];
    ordersPrice = json['orders_price'];
    ordersTime = json['orders_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orders_id'] = this.ordersId;
    data['orders_userEmail'] = this.ordersUserEmail;
    data['orders_address'] = this.ordersAddress;
    data['orders_price'] = this.ordersPrice;
    data['orders_time'] = this.ordersTime;
    return data;
  }
}