import 'package:flutter/material.dart';

import 'l10n/app_strings.dart';
import 'pages/support_page.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const MahjongSupportApp());
}

class MahjongSupportApp extends StatefulWidget {
  const MahjongSupportApp({super.key});

  @override
  State<MahjongSupportApp> createState() => _MahjongSupportAppState();
}

class _MahjongSupportAppState extends State<MahjongSupportApp> {
  final _locale = ValueNotifier(AppLocale.ru);

  @override
  void dispose() {
    _locale.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AppLocale>(
      valueListenable: _locale,
      builder: (context, locale, _) {
        final strings = AppStrings.of(locale);

        return MaterialApp(
          title: strings.pageTitle,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light(),
          home: SupportPage(
            locale: locale,
            onLocaleChanged: (value) => _locale.value = value,
          ),
        );
      },
    );
  }
}
