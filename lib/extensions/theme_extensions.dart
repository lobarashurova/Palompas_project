import 'package:flutter/cupertino.dart';
import 'package:palomaps_project/di/injection.dart';
import 'package:palomaps_project/extensions/color/default_theme_colors.dart';

extension ThemeContextExtensions on BuildContext {
  DefaultThemeColors get colors => getIt<DefaultThemeColors>();
}
