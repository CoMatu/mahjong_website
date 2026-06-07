import 'package:flutter/material.dart';

import '../l10n/app_strings.dart';
import '../theme/app_theme.dart';

class FaqTile extends StatelessWidget {
  const FaqTile({required this.item, super.key});

  final FaqItem item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        childrenPadding: const EdgeInsets.fromLTRB(20, 0, 20, 18),
        iconColor: AppTheme.primaryDark,
        collapsedIconColor: AppTheme.primaryDark,
        title: Text(item.question, style: theme.textTheme.titleLarge),
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(item.answer, style: theme.textTheme.bodyLarge),
          ),
        ],
      ),
    );
  }
}
