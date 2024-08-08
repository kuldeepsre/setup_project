import 'dart:async';
import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:setup_project/bloc/post_data/post_bloc.dart';
import 'package:setup_project/repositry/UserRepository.dart';
import 'package:setup_project/repositry/form_repository/form_repository.dart';
import 'package:setup_project/repositry/form_repository/login_repo.dart';

import 'AppLocalizations.dart';
import 'package:http/http.dart' as http;
import 'Routes/route_generator.dart';
import 'api/api_services.dart';
import 'bloc/dashboard/dashboard_bloc.dart';
import 'bloc/form_post/form_bloc.dart';
import 'bloc/login/login_bloc.dart';
import 'bloc/map/map_bloc.dart';
import 'bloc/product/product_bloc.dart';
import 'bloc/them/ThemeCubit.dart';
import 'bloc/user/user_bloc.dart';
import 'common_button/LocalizationKeys.dart';
import 'notification/firebaseApi.dart';
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      name: "Dream APP",
      options: const FirebaseOptions(
        appId: "1:1039174444499:android:cf800ebbb4f1365bfa7b26",
        messagingSenderId: "927744815392 ",
        projectId: "setup-41124",
        apiKey: "AIzaSyDChpRkU11LVLPuh_l12O7O1r_lFoFOlNQ",
      ));
    await FirebaseApi().initNotification();

/*  await _handleInitialMessage();*/
  runApp(MyApp());
}

Future<void> _handleInitialMessage() async {
  final RemoteMessage? message = await FirebaseMessaging.instance.getInitialMessage();
  if (message != null) {
    final payload = message.data;
    navigatorKey.currentState?.pushNamed(
      RoutePaths.NotificationScreen,
      arguments: {
        'payload': jsonEncode(payload),
        'notificationCount': 0, // Update as necessary
      },
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()),
        BlocProvider<LanguageCubit>(create: (context) => LanguageCubit()),
        BlocProvider<MapBloc>(create: (context) => MapBloc()),
        BlocProvider<BottomNavigationBloc>(
            create: (context) => BottomNavigationBloc()),
        BlocProvider<UserBloc>(
            create: (context) => UserBloc(UserRepositoryImpl(ApiService()))),
        BlocProvider<ProductBloc>(
            create: (context) => ProductBloc(UserRepositoryImpl(ApiService()))),
        BlocProvider<LoginBloc>(
            create: (context) =>
                LoginBloc(LoginPostRepositoryImpl(ApiService()))),
        BlocProvider<PostBloc>(
            create: (context) => PostBloc(PostRepositoryImpl(ApiService()))),
        BlocProvider<FormBloc>(
            create: (context) =>
                FormBloc(FormPostRepositoryImpl(ApiService()))),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (themeContext, themeState) {
          return BlocBuilder<LanguageCubit, LanguageState>(
            builder: (languageContext, languageState) {
              return MaterialApp(
                navigatorKey: navigatorKey,
                title: 'Day Night Mode Example',
                theme: themeState.themeData,
                locale: languageState.locale,
                localizationsDelegates: [
                  AppLocalizationsDelegate(languageState.locale),
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                supportedLocales: const [
                  Locale('en', 'US'),
                  Locale('hi', 'IN'),
                  Locale('de', 'DE'),
                ],
                initialRoute: RoutePaths.splashScreen,
                onGenerateRoute: RouteGenerator.generateRoute,
                debugShowCheckedModeBanner: false,
                // home: MyHomePage(),
              );
            },
          );
        },
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), _navigateToHome);
  }

  void _navigateToHome() {
    Navigator.of(context).pushReplacementNamed(RoutePaths.dashboard);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return const Scaffold(
      body: Center(
        child: Text(
          'Splash Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
