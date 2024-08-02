import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../AppLocalizations.dart';
import '../bloc/them/ThemeCubit.dart';
import 'LocalizationKeys.dart';


class HomeText extends StatelessWidget {
  const HomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppLocalizations(context.read<LanguageCubit>().state.locale)
          .translate(LocalizationKeys.welcomeMessage),
           style: Theme.of(context).textTheme.headline5,
    );
  }
}