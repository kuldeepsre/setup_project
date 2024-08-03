import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:setup_project/ui_design/post_list.dart';
import 'package:setup_project/ui_design/user_list.dart';

import '../dialog/custom_dialog.dart';
import '../utils/date_format_utils.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Default Format: ${DateFormatUtils.formatDefault(now)}'),
          Text('Full Format: ${DateFormatUtils.formatFull(now)}'),
          Text('Short Format: ${DateFormatUtils.formatShort(now)}'),
          Text('Custom Format: ${DateFormatUtils.formatCustom(now)}'),
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
              showCustomSnackbar(context);
            },
            child: Text('Show Success Dialog'),
          ),
        ],
      ),
    );
  }
}
