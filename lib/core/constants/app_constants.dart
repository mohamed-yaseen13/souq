enum Role {
  customer,
  deliveryMan,
  seller;

  String get name {
    switch (this) {
      case Role.customer:
        return 'customer';
      case Role.deliveryMan:
        return 'delivery man';
      case Role.seller:
        return 'seller';
    }
  }

  String get imagePath {
    switch (this) {
      case Role.customer:
        return 'assets/images/shop.png';
      case Role.deliveryMan:
        return 'assets/images/deliver.png';
      case Role.seller:
        return 'assets/images/sell.png';
    }
  }

  String get desc {
    switch (this) {
      case Role.customer:
        return 'Shop';
      case Role.deliveryMan:
        return 'Deliver';
      case Role.seller:
        return 'Sell';
    }
  }
}
