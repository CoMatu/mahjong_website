import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class ScreenshotGallery extends StatelessWidget {
  const ScreenshotGallery({required this.assets, super.key});

  final List<String> assets;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 560,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: assets.length,
        separatorBuilder: (_, _) => const SizedBox(width: 18),
        itemBuilder: (context, index) {
          return _ScreenshotCard(
            asset: assets[index],
            semanticLabel: 'Comatu Mahjong screenshot ${index + 1}',
          );
        },
      ),
    );
  }
}

class _ScreenshotCard extends StatelessWidget {
  const _ScreenshotCard({required this.asset, required this.semanticLabel});

  final String asset;
  final String semanticLabel;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 9 / 16,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(
              color: AppTheme.primaryDark.withValues(alpha: 0.18),
              blurRadius: 24,
              offset: const Offset(0, 16),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(32),
          child: Image.asset(
            asset,
            fit: BoxFit.cover,
            semanticLabel: semanticLabel,
          ),
        ),
      ),
    );
  }
}
