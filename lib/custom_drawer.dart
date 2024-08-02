import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/dashboard/bottom_navigation_event.dart';
import 'bloc/dashboard/dashboard_bloc.dart';

class CustomDrawer extends StatelessWidget {
  final AnimationController animationController;

  CustomDrawer({required this.animationController});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.002) // Perspective
            ..rotateY(animationController.value * 0.5), // Rotation for 3D effect
          alignment: Alignment.centerRight,
          child: Container(
            width: 250.0,
            color: Colors.blue,
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                const DrawerHeader(
                  child: Text('3D Drawer Header', style: TextStyle(color: Colors.white)),
                  decoration: BoxDecoration(color: Colors.blueAccent),
                ),
                ListTile(
                  title: const Text('Page 1', style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.pop(context);
                    context.read<BottomNavigationBloc>().add(PageChanged(0));
                  },
                ),
                ListTile(
                  title: const Text('Page 2', style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.pop(context);
                    context.read<BottomNavigationBloc>().add(PageChanged(1));
                  },
                ),
                ListTile(
                  title: const Text('Page 3', style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.pop(context);
                    context.read<BottomNavigationBloc>().add(PageChanged(2));
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

