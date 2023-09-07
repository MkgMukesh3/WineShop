class CategoryModel {
  bool? status;
  String? message;
  Data? data;

  CategoryModel({this.status, this.message, this.data});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Categorys>? categorys;

  Data({this.categorys});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['categorys'] != null) {
      categorys = <Categorys>[];
      json['categorys'].forEach((v) {
        categorys!.add(new Categorys.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categorys != null) {
      data['categorys'] = this.categorys!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categorys {
  String? ecomAaCategoryId;
  String? ecomAaCategoryName;
  String? ecomAaCategoryType;
  String? ecomAaMaincategoryId;
  String? ecomAaCategoryStatus;
  String? ecomAaCategoryOrdering;
  String? ecomAaCategoryLink;
  String? ecomAaCategoryImage;
  String? ecomAaCategoryContent;
  String? ecomAaCategoryCombo;

  Categorys(
      {this.ecomAaCategoryId,
      this.ecomAaCategoryName,
      this.ecomAaCategoryType,
      this.ecomAaMaincategoryId,
      this.ecomAaCategoryStatus,
      this.ecomAaCategoryOrdering,
      this.ecomAaCategoryLink,
      this.ecomAaCategoryImage,
      this.ecomAaCategoryContent,
      this.ecomAaCategoryCombo});

  Categorys.fromJson(Map<String, dynamic> json) {
    ecomAaCategoryId = json['ecom_aa_category_id'];
    ecomAaCategoryName = json['ecom_aa_category_name'];
    ecomAaCategoryType = json['ecom_aa_category_type'];
    ecomAaMaincategoryId = json['ecom_aa_maincategory_id'];
    ecomAaCategoryStatus = json['ecom_aa_category_status'];
    ecomAaCategoryOrdering = json['ecom_aa_category_ordering'];
    ecomAaCategoryLink = json['ecom_aa_category_link'];
    ecomAaCategoryImage = json['ecom_aa_category_image'];
    ecomAaCategoryContent = json['ecom_aa_category_content'];
    ecomAaCategoryCombo = json['ecom_aa_category_combo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ecom_aa_category_id'] = this.ecomAaCategoryId;
    data['ecom_aa_category_name'] = this.ecomAaCategoryName;
    data['ecom_aa_category_type'] = this.ecomAaCategoryType;
    data['ecom_aa_maincategory_id'] = this.ecomAaMaincategoryId;
    data['ecom_aa_category_status'] = this.ecomAaCategoryStatus;
    data['ecom_aa_category_ordering'] = this.ecomAaCategoryOrdering;
    data['ecom_aa_category_link'] = this.ecomAaCategoryLink;
    data['ecom_aa_category_image'] = this.ecomAaCategoryImage;
    data['ecom_aa_category_content'] = this.ecomAaCategoryContent;
    data['ecom_aa_category_combo'] = this.ecomAaCategoryCombo;
    return data;
  }
}
