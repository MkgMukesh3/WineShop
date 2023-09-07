class CartProducts {
  ProductModel? productModel;
  int? length;
  CartProducts({this.length, this.productModel});
}

class ProductModel {
  String? productName;
  String? productImage;
  int? productPrice;
  String? productDescription;
  String? validDate;
  String? type;
  String? quantity;
  String? category;
  String? topColor;
  String? bottomColor;

  ProductModel(
      {this.productDescription,
      this.productName,
      this.productImage,
      this.productPrice,
      this.validDate,
      this.type,
      this.quantity,
      this.category,
      this.topColor,
      this.bottomColor});
}
