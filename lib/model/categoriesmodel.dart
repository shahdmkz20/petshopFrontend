class CategoriesModel {
  int? categoryId;
  String? categoryNameEng;
  String? categoryNameAr;
  String? categoryDescrptionEng;
  String? categoryDescriptionAr;
  String? categoryDate;
  String? categoryImage;

  CategoriesModel(
      {this.categoryId,
        this.categoryNameEng,
        this.categoryNameAr,
        this.categoryDescrptionEng,
        this.categoryDescriptionAr,
        this.categoryDate,
        this.categoryImage});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryNameEng = json['category_name_eng'];
    categoryNameAr = json['category_name_ar'];
    categoryDescrptionEng = json['category_descrption_eng'];
    categoryDescriptionAr = json['category_description_ar'];
    categoryDate = json['category_date'];
    categoryImage = json['category_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['category_name_eng'] = this.categoryNameEng;
    data['category_name_ar'] = this.categoryNameAr;
    data['category_descrption_eng'] = this.categoryDescrptionEng;
    data['category_description_ar'] = this.categoryDescriptionAr;
    data['category_date'] = this.categoryDate;
    data['category_image'] = this.categoryImage;
    return data;
  }
}