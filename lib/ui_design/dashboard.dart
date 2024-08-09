import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:setup_project/ui_design/pagination_scrren.dart';
import 'package:setup_project/ui_design/setting%20scrren.dart';

import '../bloc/dashboard/bottom_navigation_event.dart';
import '../bloc/dashboard/bottom_navigation_state.dart';
import '../bloc/dashboard/dashboard_bloc.dart';
import '../custom_drawer.dart';
import 'CheckboxListScreen.dart';
import 'form/login_form.dart';
import 'home_page.dart';
import 'map_screen.dart';
import 'notification_screen.dart';


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
        title: const Text('Bottom Navigation & 3D Drawer with BLoC'),
        leading: null
      ),
      drawer: CustomDrawer(animationController: _animationController), // Use drawer to open from the left
      body: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
        builder: (context, state) {
          return IndexedStack(
            index: state.selectedIndex,
            children: [
              HomeScreen(),
           //   MapScreen(),
              LoginForm(),
            //  UserList()
              CheckboxListScreen()
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
