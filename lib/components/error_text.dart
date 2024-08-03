import 'package:flutter/material.dart';

import '../../../utils/app_strings.dart';

class ErrorText extends StatelessWidget {
  const ErrorText({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
         oops,
          style: textTheme.titleMedium,
        ),
        Text(
            errorMessage,
          style: textTheme.bodyLarge,
        ),
        Text(
           tryAgainLater,
          style: textTheme.bodyLarge,
        ),
      ],
    );
  }
}
