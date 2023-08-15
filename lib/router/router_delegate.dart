import 'package:flutter/material.dart';
import 'package:navigator2/router/router_path.dart';

import '../module/dashboard_view.dart';
import '../module/product_detail_view.dart';

class MyRouterDelegate extends RouterDelegate<MyRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<MyRoutePath> {
  @override
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  MyRoutePath _currentPath = MyRoutePath.dashboard();

  @override
  MyRoutePath get currentConfiguration => _currentPath;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        if (_currentPath.isDashboard)
          MaterialPage(
              child: DashboardView(onNavigate: navigateToProductDetail)),
        if (_currentPath.isProductDetail)
          MaterialPage(child: ProductDetailView(_currentPath.productId)),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        _currentPath = MyRoutePath.dashboard();
        notifyListeners();
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(MyRoutePath path) async {
    _currentPath = path;
    notifyListeners();
  }

  void navigateToProductDetail(int id) {
    _currentPath = MyRoutePath.productDetail(id);
    notifyListeners();
  }
}
