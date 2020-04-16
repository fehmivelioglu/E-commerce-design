import 'package:e_commerce/assets/constants.dart';
import 'package:e_commerce/screens/product_detail.dart';
import 'package:flutter/material.dart';

class Routes{
  static final routes = <String,WidgetBuilder>{
    Constants.ROUTE_PRODUCT_DETAIL:(BuildContext context)=>ProductDetail()
  };
}