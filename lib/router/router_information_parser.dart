import 'package:flutter/material.dart';
import 'package:navigator2/router/router_path.dart';

class MyRouteInformationParser extends RouteInformationParser<MyRoutePath> {
  @override
  Future<MyRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location ?? "");

    if (uri.pathSegments.length >= 2 &&
        uri.pathSegments[0] == 'product-detail') {
      return MyRoutePath.productDetail(int.tryParse(uri.pathSegments[1]) ?? 0);
    } else {
      return MyRoutePath.dashboard();
    }
  }

  @override
  RouteInformation restoreRouteInformation(MyRoutePath path) {
    if (path.isDashboard) {
      return const RouteInformation(location: '/dashboard');
    }
    if (path.isProductDetail) {
      return RouteInformation(location: '/product-detail/${path.productId}');
    }
    return const RouteInformation(location: '/dashboard');
  }
}
