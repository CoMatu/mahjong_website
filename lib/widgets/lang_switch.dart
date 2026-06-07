import 'package:flutter/material.dart';

import '../l10n/app_strings.dart';
import '../theme/app_theme.dart';

class LangSwitch extends StatelessWidget {
  const LangSwitch({required this.locale, required this.onChanged, super.key});

  final AppLocale locale;
  final ValueChanged<AppLocale> onChanged;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<AppLocale>(
      segments: const [
        ButtonSegment(value: AppLocale.ru, label: Text('RU')),
        ButtonSegment(value: AppLocale.en, label: Text('EN')),
      ],
      selected: {locale},
      showSelectedIcon: false,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppTheme.primaryDark;
          }
          return Colors.white.withValues(alpha: 0.7);
        }),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return Colors.white;
          }
          return AppTheme.text;
        }),
      ),
      onSelectionChanged: (selection) => onChanged(selection.first),
    );
  }
}
