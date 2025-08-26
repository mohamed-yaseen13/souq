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

class AppConstants {
  static const String usersCollections = 'users';

  static const String emailsCollections = 'emails';

  static const List<String> categories = [
    'Electronics',
    'Fashion',
    'Home & Garden',
    'Sports',
  ];

  static const List<String> conditions = ['New', 'Like New', 'Good', 'Fair'];

  static const List<String> availableColors = [
    'Red',
    'Blue',
    'Black',
    'White',
    'Green',
  ];

  static const List<String> availableSizes = ['XS', 'S', 'M', 'L', 'XL', 'XXL'];
}

enum NavigationBarEnum { orders, chat, home, profile, settings }
