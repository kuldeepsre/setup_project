import 'package:flutter/material.dart';

import '../../../utils/app_values.dart';
import '../../../utils/colors.dart';


class CircleDot extends StatelessWidget {
  const CircleDot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p6),
      child: Container(
        width: AppSize.s6,
        height: AppSize.s6,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: circleDotColor,
        ),
      ),
    );
  }
}
