import 'package:mybar/model/bar_model.dart';
import 'package:mybar/model/product_model.dart';

List barList = [
  {
    "barName": "New Town Bar",
    "barImage": "assets/images/barhorizonal.png",
    "barkm": "2.8Km",
    "barIocation": "Odeon Towers Extension, Rooftop, Singapore",
    "status": "Open",
  },
  {
    "barName": "New Town Bar",
    "barImage": "assets/images/barhorizonal.png",
    "barkm": "2.8Km",
    "barIocation": "Odeon Towers Extension Rooftop, Singapore",
    "status": "Open",
  },
  {
    "barName": "New Town Bar",
    "barImage": "assets/images/barhorizonal.png",
    "barkm": "2.8Km",
    "barIocation": "Odeon Towers Extension Rooftop, Singapore",
    "status": "Open",
  },
  {
    "barName": "New Town Bar",
    "barImage": "assets/images/barhorizonal.png",
    "barkm": "2.8Km",
    "barIocation": "Odeon Towers Extension Rooftop, Singapore",
    "status": "Open",
  },
];

// List cartList = [
//   {
//     "cartName": "Chivas Rigal 12",
//     "cartImage": "assets/images/products/product3.png",
//     "cartDes": "Blended 350ml",
//     "price": "\$99",
//   },
//   {
//     "cartName": "Adrianna Vineyard",
//     "cartImage": "assets/images/products/product1.png",
//     "cartDes": "100 glass of 30 ml",
//     "price": "\$99",
//   },
//   {
//     "cartName": "Havana Club",
//     "cartImage": "assets/images/products/product5.png",
//     "cartDes": "Aged 350ml",
//     "price": "\$199",
//   },
// ];

List addedMoreItems = [
  {
    "cartName": "Bud Lite",
    "cartImage": "assets/images/products/product7.png",
    "cartDes": "Available Qty: 150 ml",
    "date": "Valid until: 20 Jun 2021",
  },
  {
    "cartName": "Havana Club",
    "cartImage": "assets/images/products/product1.png",
    "cartDes": "Available Qty: 150 ml",
    "date": "Valid until: 20 Jun 2021",
  },
  {
    "cartName": "Adrianna Vineyard",
    "cartImage": "assets/images/products/product5.png",
    "cartDes": "Available Qty: 150 ml",
    "date": "Valid until: 20 Jun 2021",
  },
  {
    "cartName": "Diplomatico",
    "cartImage": "assets/images/products/product4.png",
    "cartDes": "Available Qty: 150 ml",
    "date": "Valid until: 20 Jun 2021",
  },
];
List drawerList = [
  {
    "drawerName": "Home",
    "Image": "assets/icons/homeicon.png",
  },
  {
    "drawerName": "My Profile",
    "Image": "assets/icons/profile.png",
  },
  {
    "drawerName": "Change Password",
    "Image": "assets/icons/Key.png",
  },
  {
    "drawerName": "Order History",
    "Image": "assets/icons/order.png",
  },
  {
    "drawerName": "Help & Support",
    "Image": "assets/icons/help.png",
  },
  {
    "drawerName": "About",
    "Image": "assets/icons/About.png",
  },
  {
    "drawerName": "Sign out",
    "Image": "assets/icons/signout.png",
  }
];
List mixturelist = [
  {"Name": "Choose Mixer 1"},
  {"Name": "Choose Mixer 2"},
  {"Name": "Choose Mixer 3"},
];
List categorylist = [
  {"Name": "Account"},
  {"Name": "Payment"},
  {"Name": "Order"},
];
List<CartProducts> addedToCart = [];
List<ProductModel> products = [
  ProductModel(
    productDescription: "Blended 350ml",
    productImage: "assets/images/products/product3.png",
    productName: "Chivas Rigal 12",
    productPrice: 99,
    validDate: "Valid until: 20 Jun 2021",
    type: "Blended",
    quantity: "Available Qty: 150 ml",
    category: "Whisky",
    topColor: "FF9D42",
    bottomColor: "FD6E30",
  ),
  ProductModel(
    productDescription: "Adrianna Vineyard",
    productImage: "assets/images/products/product1.png",
    productName: "Adrianna Vineyard",
    productPrice: 99,
    validDate: "Valid until: 20 Jun 2021",
    type: "Aged",
    quantity: "Available Qty: 150 ml",
    category: "Whisky",
    topColor: "6760AA",
    bottomColor: "3D3593",
  ),
  ProductModel(
    productDescription: "Blended 350ml",
    productImage: "assets/images/products/product5.png",
    productName: "Havana Club",
    productPrice: 199,
    validDate: "Valid until: 20 Jun 2021",
    type: "Blended",
    quantity: "Available Qty: 150 ml",
    category: "Whisky",
    topColor: "F44A4A",
    bottomColor: "B90000",
  ),
  ProductModel(
    productDescription: "Aged 200ml",
    productImage: "assets/images/products/product6.png",
    productName: "Diplomatico",
    productPrice: 199,
    validDate: "Valid until: 20 Jun 2021",
    type: "Blended",
    quantity: "Available Qty: 150 ml",
    category: "Whisky",
    topColor: "FF9D42",
    bottomColor: "FD6E30",
  ),
  ProductModel(
    productDescription: "100 glass of 30 ml",
    productImage: "assets/images/products/product1.png",
    productName: "Adrianna Vineyard",
    productPrice: 99,
    validDate: "Valid until: 20 Jun 2021",
    type: "Blended",
    quantity: "Available Qty: 150 ml",
    category: "Whisky",
    topColor: "FF9D42",
    bottomColor: "FD6E30",
  ),
  ProductModel(
    productDescription: "Chardonny 450ml",
    productImage: "assets/images/products/product2.png",
    productName: "Grgich Hills Estate",
    productPrice: 199,
    validDate: "Valid until: 20 Jun 2021",
    type: "Blended",
    quantity: "Available Qty: 150 ml",
    category: "Whisky",
    topColor: "FF9D42",
    bottomColor: "FD6E30",
  ),
  ProductModel(
    productDescription: "Blended 250ml",
    productImage: "assets/images/products/product4.png",
    productName: "Hibiki",
    productPrice: 199,
    validDate: "Valid until: 20 Jun 2021",
    type: "Blended",
    quantity: "Available Qty: 150 ml",
    category: "Whisky",
    topColor: "FF9D42",
    bottomColor: "FD6E30",
  ),
  ProductModel(
    productDescription: "Blended 250ml",
    productImage: "assets/images/products/product4.png",
    productName: "Gibiki",
    productPrice: 199,
    validDate: "Valid until: 20 Jun 2021",
    type: "Blended",
    quantity: "Available Qty: 150 ml",
    category: "Wine",
    topColor: "FF9D42",
    bottomColor: "FD6E30",
  ),
  ProductModel(
    productDescription: "Chardonny 450ml",
    productImage: "assets/images/products/product2.png",
    productName: "Grgich Hills Estate",
    productPrice: 199,
    validDate: "Valid until: 20 Jun 2021",
    type: "Blended",
    quantity: "Available Qty: 150 ml",
    category: "Beer",
    topColor: "FF9D42",
    bottomColor: "FD6E30",
  ),
  ProductModel(
    productDescription: "100 glass of 30 ml",
    productImage: "assets/images/products/product1.png",
    productName: "Adrianna Vineyard",
    productPrice: 99,
    validDate: "Valid until: 20 Jun 2021",
    type: "Blended",
    quantity: "Available Qty: 150 ml",
    category: "Coctails",
    topColor: "FF9D42",
    bottomColor: "FD6E30",
  ),
  ProductModel(
    productDescription: "Aged 200ml",
    productImage: "assets/images/products/product6.png",
    productName: "Diplomatico",
    productPrice: 199,
    validDate: "Valid until: 20 Jun 2021",
    type: "Blended",
    quantity: "Available Qty: 150 ml",
    category: "Vodka",
    topColor: "FF9D42",
    bottomColor: "FD6E30",
  ),
  ProductModel(
    productDescription: "Blended 350ml",
    productImage: "assets/images/products/product3.png",
    productName: "Chivas Rigal 12",
    productPrice: 99,
    validDate: "Valid until: 20 Jun 2021",
    type: "Blended",
    quantity: "Available Qty: 150 ml",
    category: "Wine",
    topColor: "FF9D42",
    bottomColor: "FD6E30",
  ),
  ProductModel(
    productDescription: "Adrianna Vineyard",
    productImage: "assets/images/products/product1.png",
    productName: "Chivas Rigal 12",
    productPrice: 99,
    validDate: "Valid until: 20 Jun 2021",
    type: "Aged",
    quantity: "Available Qty: 150 ml",
    category: "Gin",
    topColor: "FF9D42",
    bottomColor: "FD6E30",
  ),
  ProductModel(
    productDescription: "Blended 350ml",
    productImage: "assets/images/products/product5.png",
    productName: "Havana Club",
    productPrice: 199,
    validDate: "Valid until: 20 Jun 2021",
    type: "Blended",
    quantity: "Available Qty: 150 ml",
    category: "Rum",
    topColor: "FF9D42",
    bottomColor: "FD6E30",
  ),
];

List<BarModel> bars = [
  BarModel(
    barName: "Charlie's Bar",
    barStatus: "Open",
    barAddress: "Odeon Towers Extension, Rooftop, Singapore",
    barDistance: "3.7Km",
    barImage: "assets/images/barhorizonal.png",
  ),
  BarModel(
    barName: "New Town Bar",
    barStatus: "Close",
    barAddress: "Odeon Towers Extension, Rooftop, Singapore",
    barDistance: "15km",
    barImage: "assets/images/barhorizonal.png",
  ),
  BarModel(
    barName: "New Town Bar",
    barStatus: "Open",
    barAddress: "Odeon Towers Extension, Rooftop, Singapore",
    barDistance: "5km",
    barImage: "assets/images/barhorizonal.png",
  ),
  BarModel(
    barName: "New Town Bar",
    barStatus: "Close",
    barAddress: "Odeon Towers Extension, Rooftop, Singapore",
    barDistance: "4.9km",
    barImage: "assets/images/barhorizonal.png",
  )
];
