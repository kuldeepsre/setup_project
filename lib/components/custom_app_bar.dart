import 'package:flutter/material.dart';

import '../../../utils/app_values.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.visible,
  });

  final String title;
  final bool visible;


  @override
  Size get preferredSize => const Size.fromHeight(AppSize.s60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle:false,
        automaticallyImplyLeading: false,
        title: Text(title),

        leading:Visibility(
          visible: visible,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: AppSize.s20,
            ),
          ),
        )
    );
  }
}
