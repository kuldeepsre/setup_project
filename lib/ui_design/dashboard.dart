import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:setup_project/ui_design/pagination_scrren.dart';
import 'package:setup_project/ui_design/product_screen.dart';


import '../bloc/dashboard/bottom_navigation_event.dart';
import '../bloc/dashboard/bottom_navigation_state.dart';
import '../bloc/dashboard/dashboard_bloc.dart';
import '../bloc/product_bloc/cart/cart_bloc.dart';
import '../custom_drawer.dart';

import 'CartScreen.dart';
import 'form/login_form.dart';
import 'home_page.dart';



class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool _isDrawerOpen = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleDrawer() {
    if (_isDrawerOpen) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
    setState(() {
      _isDrawerOpen = !_isDrawerOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('home'),
        actions: [
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              int cartCount = 0;
              if (state is CartLoaded) {
                cartCount = state.cartItems.length;
              }
              return IconButton(
                icon: Stack(
                  children: [
                    const Icon(Icons.shopping_cart,color: Colors.green,),
                    if (cartCount > 0)
                      Positioned(
                        right: 0,
                        child: CircleAvatar(
                          radius: 5,
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          child: Text(
                            cartCount.toString(),
                            style: const TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartScreen(),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
      drawer: CustomDrawer(animationController: _animationController), // Use drawer to open from the left
      body: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
        builder: (context, state) {
          return IndexedStack(
            index: state.selectedIndex,
            children: [
              HomeScreen(),
           //   MapScreen(),
            //  LoginForm(),
              ProductListScreen(),
              UserList()
            //  CheckboxListScreen()
            ],
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Page 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Page 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Page 3',
          ),
        ],
        currentIndex: context.watch<BottomNavigationBloc>().state.selectedIndex,
        onTap: (index) {
          context.read<BottomNavigationBloc>().add(PageChanged(index));
        },
      ),
    );
  }
}
