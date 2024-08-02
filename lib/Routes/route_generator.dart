

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';
class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case RoutePaths.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      // case RoutePaths.homePage:
      //   return MaterialPageRoute(builder: (_) =>  LoginForm());
      // case RoutePaths.dashboard:
      //   return MaterialPageRoute(builder: (_) =>  DashboardPage());
      //   case RoutePaths.HomeBody:
      //   return MaterialPageRoute(builder: (_) =>  HomeBody());
      //   case RoutePaths.UserScreen:
      //   return MaterialPageRoute(builder: (_) =>  UserPostScreen());
      //
      //   case RoutePaths.PaginationPage:
      //   return MaterialPageRoute(builder: (_) =>  PaginationPage());
/*        case RoutePaths.MultiApiScreen:
        return MaterialPageRoute(builder: (_) =>  MultiApiScreen());*/
      // case RoutePaths.categoryPage:
      //   return MaterialPageRoute(
      //       builder: (_) => CategoryPage(
      //           products: args as List<Product>, categoryName: args as String));
      // case RoutePaths.productPage:
      //   return MaterialPageRoute(
      //       builder: (_) => ProductPage(
      //           product: args as Product, pageColor: args as Color));
      // case RoutePaths.AddTaskScreen:
      //   return MaterialPageRoute(builder: (_) => AddTaskScreen());
      // case RoutePaths.TaskScreen:
      //   return MaterialPageRoute(builder: (_) => TaskScreen());
      // case RoutePaths.HomeBody:
      //   return MaterialPageRoute(builder: (_) => const HomeBody());
      //
      //   case RoutePaths.TreeView:
      //   return MaterialPageRoute(builder: (_) => TreeView());
      //   case RoutePaths.LoginForm:
      //   return MaterialPageRoute(builder: (_) => const LoginPage(title: 'Login',));
      //   case RoutePaths.LoginPage1:
      //   return MaterialPageRoute(builder: (_) => LoginPage1());
      //   case RoutePaths.LoginPage2:
      //   return MaterialPageRoute(builder: (_) => LoginPage2());
      //   case RoutePaths.SignupPage:
      //   return MaterialPageRoute(builder: (_) => SignupPage());
      //   case RoutePaths.RojarPayment:
      //   return MaterialPageRoute(builder: (_) => RojarPayment());
      //   case RoutePaths.MerchantApp:
      //   return MaterialPageRoute(builder: (_) => const MerchantApp());
      //   case RoutePaths.LoginApp:
      //   return MaterialPageRoute(builder: (_) =>  LoginPage());
      //   case RoutePaths.ChatScreen:
      //   return MaterialPageRoute(builder: (_) => ChatScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
class RoutePaths {
  static const String splashScreen = '/';
  static const String homePage = '/home';
  static const String dashboard = '/dashboard';
  static const String categoryPage = '/category';
  static const String productPage = '/product';
  static const String cartPage = '/cart';
  static const String AddTaskScreen = '/addTask';
  static const String TaskScreen = '/taskScreen';
  static const String HomeBody = '/homeBody';
  static const String ReminderScreen = '/daily_remainder';
  static const String TreeView = '/treeview';
  static const String LoginForm = '/LoginForm';
  static const String LoginPage1 = '/LoginPage1';
  static const String LoginPage2 = '/LoginPage2';
  static const String LoginPage3 = '/LoginPage3';
  static const String SignupPage = '/signup';
  static const String RojarPayment = '/payment_page';
  static const String MerchantApp = '/phone_pay';
  static const String LoginApp = '/LoginApp';
  static const String ChatScreen = '/ChatScreen';
  static const String UserScreen = '/UserScreen';
  static const String MultiApiScreen = '/MultiApiScreen';
  static const String PaginationPage = '/PaginationPage';
}
