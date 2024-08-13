import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../AppLocalizations.dart';
import '../bloc/them/ThemeCubit.dart';


class HomeButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  const HomeButton({required this.onPressed, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        AppLocalizations(context.read<LanguageCubit>().state.locale)
            .translate(buttonText),
      ),
    );
  }
}