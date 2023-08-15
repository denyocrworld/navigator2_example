class MyRoutePath {
  final bool isDashboard;
  final bool isProductDetail;
  final int productId;

  MyRoutePath.dashboard()
      : isDashboard = true,
        isProductDetail = false,
        productId = 1;

  MyRoutePath.productDetail(this.productId)
      : isDashboard = false,
        isProductDetail = true;
}
