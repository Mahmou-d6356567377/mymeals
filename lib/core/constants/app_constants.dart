import 'dart:ui';

class AppConstants {
  static const String appName = 'My App';
  static const List<Locale> supportedLocales = [Locale('en'), Locale('ar')];
  static const String localeKey = 'app_locale';
  static const String themeKey = 'app_theme';
  static const String kbackpic = 'assets/images/backpic.svg';
  static const String ktst = 'assets/images/test.svg';

  static const String kheadline1 = 'Save Your Meals Ingredient';
  static const String kheadline2 = 'Use Our App The Best Choice';
  static const String kheadline3 = ' Our App Your Ultimate Choice';

  static const String ksidedline1 =
      'Add Your Meals and its Ingredients and we will save it for you';
  static const String ksidedline2 =
      'the best choice for your kitchen do not hesitate';
  static const String ksidedline3 =
      'All the best restaurants and their top menus are ready for you';

  static  Color kprimary = Color(0xfffe920b).withValues(alpha: 0.8);
}
