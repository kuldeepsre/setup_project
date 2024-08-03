import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:setup_project/ui_design/post_list.dart';
import 'package:setup_project/ui_design/user_list.dart';

import '../dialog/custom_dialog.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  UserListPage()),
              );
            },
            child: const Text('View Users'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  PostListPage()),
              );
            },
            child: const Text('View Posts'),
          ),

          ElevatedButton(
            onPressed: () {
              showCardDialog(context);
            },
            child: Text('Show Success Dialog'),
          ),
        ],
      ),
    );
  }
}
