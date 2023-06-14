import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/data/models/products/products.dart';
import 'package:magdsoft_flutter_structure/presentation/view/help/help.dart';
import 'package:magdsoft_flutter_structure/presentation/view/product_details/product_details.dart';

import '../screens/login_screen.dart';
import '../screens/verification_screen.dart';
import '../screens/shared/splash_screen.dart';
import '../screens/shared/store_layout/store_layout.dart';
import '../view/search_result.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/verify':
        return MaterialPageRoute(builder: (_) => VerificationScreen());
      case '/help':
        return MaterialPageRoute(builder: (_) => const HelpScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => const StoreLayout());
      case '/details':
        return MaterialPageRoute(builder: (_) =>  ProductDetails(product: settings.arguments as Products));
        case '/search':
        return MaterialPageRoute(builder: (_) =>  SearchResult(products: settings.arguments as List<Products>));
      default:
        return null;
    }
  }
}
