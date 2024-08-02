
import 'package:flutter/cupertino.dart';

import 'common_button/LocalizationKeys.dart';


class AppLocalizations {
  final Locale locale;
  AppLocalizations(this.locale);

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      LocalizationKeys.title: 'Day Night Mode Example',
      LocalizationKeys.welcomeMessage: 'Welcome to your app!',
      LocalizationKeys.toggleTheme: 'Toggle Theme',
      LocalizationKeys.toggleLanguage: 'Toggle Language',
      LocalizationKeys.sHeader: 'Welcome to Dreambiztech \n Software Technology',
      LocalizationKeys.shippingAddress: 'Shipping Address',
      LocalizationKeys.productTitle: 'Product Title',
      LocalizationKeys.productDescription: 'Product Description',
      LocalizationKeys.addToCart: 'Add To Cart',
      LocalizationKeys.buyNow: 'Buy Now',
      LocalizationKeys.viewCart: 'View Cart',
      LocalizationKeys.checkout: 'Check Out',
      LocalizationKeys.paymentMethod: 'Payment Method',
      LocalizationKeys.firstName: 'First Name',
      LocalizationKeys.lastName: 'Last Name',
      LocalizationKeys.email: 'Email',
      LocalizationKeys.password: 'Password',
      LocalizationKeys.city: 'city',
      LocalizationKeys.state: 'State',
      LocalizationKeys.country: 'Country',
      LocalizationKeys.pinCode: 'Pin Code',
      LocalizationKeys.address: 'Address',
      LocalizationKeys.phoneNumber: 'Phone Number',
      LocalizationKeys.dateOfBirth: 'Date Of Birth',
      LocalizationKeys.loginNow: 'Login Now',
      LocalizationKeys.forgotPassword: 'Forgot Password',
      LocalizationKeys.resetPassword: 'Reset Password',
      LocalizationKeys.sent: 'Sent',
      LocalizationKeys.signUp: 'Sign Up',
    },
    'hi': {
      LocalizationKeys.title: 'डे नाइट मोड उदाहरण',
      LocalizationKeys.welcomeMessage: 'अपने ऐप्लिकेशन में आपका स्वागत है!',
      LocalizationKeys.toggleTheme: 'थीम बदलें',
      LocalizationKeys.toggleLanguage: 'भाषा बदलें',
      LocalizationKeys.sHeader: 'ड्रीमबिजटेक \n सॉफ्टवेयर टेक्नोलॉजी में आपका स्वागत है',
    },
    'de': {
      LocalizationKeys.title: 'Tag Nacht Modus Beispiel',
      LocalizationKeys.welcomeMessage: 'Willkommen in Ihrer App!',
      LocalizationKeys.toggleTheme: 'Thema wechseln',
      LocalizationKeys.toggleLanguage: 'Sprache wechseln',
      LocalizationKeys.sHeader: 'Willkommen bei Dreambiztech \n Software technologie'
    },
  };

  String translate(String key) {
    return _localizedValues[locale.languageCode]![key] ?? '';
  }
}
class AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  final Locale overriddenLocale;

  const AppLocalizationsDelegate(this.overriddenLocale);

  @override
  bool isSupported(Locale locale) => ['en', 'hi','de'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    return Future.value(AppLocalizations(overriddenLocale));
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) =>
      false;
}