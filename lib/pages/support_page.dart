import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../l10n/app_strings.dart';
import '../theme/app_theme.dart';
import '../widgets/faq_tile.dart';
import '../widgets/lang_switch.dart';
import '../widgets/screenshot_gallery.dart';
import '../widgets/section_header.dart';

class SupportPage extends StatelessWidget {
  SupportPage({required this.locale, required this.onLocaleChanged, super.key});

  final AppLocale locale;
  final ValueChanged<AppLocale> onLocaleChanged;

  final _aboutKey = GlobalKey();
  final _screenshotsKey = GlobalKey();
  final _faqKey = GlobalKey();
  final _contactsKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final strings = AppStrings.of(locale);

    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppTheme.primary, AppTheme.surface],
          ),
        ),
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: _Header(
                  strings: strings,
                  locale: locale,
                  onLocaleChanged: onLocaleChanged,
                  onAboutTap: () => _scrollTo(_aboutKey),
                  onScreenshotsTap: () => _scrollTo(_screenshotsKey),
                  onFaqTap: () => _scrollTo(_faqKey),
                  onContactsTap: () => _scrollTo(_contactsKey),
                ),
              ),
              SliverToBoxAdapter(child: _Hero(strings: strings)),
              SliverToBoxAdapter(
                child: _PageSection(
                  key: _aboutKey,
                  child: _AboutSection(strings: strings),
                ),
              ),
              SliverToBoxAdapter(
                child: _PageSection(
                  key: _screenshotsKey,
                  child: _ScreenshotsSection(strings: strings),
                ),
              ),
              SliverToBoxAdapter(
                child: _PageSection(
                  key: _faqKey,
                  child: _FaqSection(strings: strings),
                ),
              ),
              SliverToBoxAdapter(
                child: _PageSection(
                  key: _contactsKey,
                  child: _PrivacyAndContactSection(strings: strings),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _scrollTo(GlobalKey key) {
    final context = key.currentContext;
    if (context == null) {
      return;
    }

    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 420),
      curve: Curves.easeOutCubic,
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    required this.strings,
    required this.locale,
    required this.onLocaleChanged,
    required this.onAboutTap,
    required this.onScreenshotsTap,
    required this.onFaqTap,
    required this.onContactsTap,
  });

  final AppStrings strings;
  final AppLocale locale;
  final ValueChanged<AppLocale> onLocaleChanged;
  final VoidCallback onAboutTap;
  final VoidCallback onScreenshotsTap;
  final VoidCallback onFaqTap;
  final VoidCallback onContactsTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1100),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 18, 20, 8),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isCompact = constraints.maxWidth < 820;
              final nav = Wrap(
                spacing: 6,
                runSpacing: 4,
                children: [
                  _NavButton(label: strings.navAbout, onTap: onAboutTap),
                  _NavButton(
                    label: strings.navScreenshots,
                    onTap: onScreenshotsTap,
                  ),
                  _NavButton(label: strings.navFaq, onTap: onFaqTap),
                  _NavButton(label: strings.navContacts, onTap: onContactsTap),
                ],
              );

              final logo = Image.asset(
                'assets/images/comatu_mahjong.png',
                height: 54,
                semanticLabel: strings.appTitle,
              );

              if (isCompact) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(child: logo),
                        LangSwitch(locale: locale, onChanged: onLocaleChanged),
                      ],
                    ),
                    const SizedBox(height: 14),
                    nav,
                  ],
                );
              }

              return Row(
                children: [
                  SizedBox(width: 230, child: logo),
                  const Spacer(),
                  nav,
                  const SizedBox(width: 18),
                  LangSwitch(locale: locale, onChanged: onLocaleChanged),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  const _NavButton({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onTap, child: Text(label));
  }
}

class _Hero extends StatelessWidget {
  const _Hero({required this.strings});

  final AppStrings strings;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1100),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 42, 20, 54),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isCompact = constraints.maxWidth < 780;
              final text = _HeroText(strings: strings);
              final preview = _HeroPreview(strings: strings);

              if (isCompact) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text,
                    const SizedBox(height: 28),
                    Center(child: preview),
                  ],
                );
              }

              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(flex: 6, child: text),
                  const SizedBox(width: 40),
                  Expanded(flex: 4, child: preview),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _HeroText extends StatelessWidget {
  const _HeroText({required this.strings});

  final AppStrings strings;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(strings.support, style: theme.textTheme.titleLarge),
        const SizedBox(height: 14),
        Text(strings.heroTitle, style: theme.textTheme.displayLarge),
        const SizedBox(height: 18),
        Text(strings.heroSubtitle, style: theme.textTheme.bodyLarge),
        const SizedBox(height: 26),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            FilledButton.icon(
              onPressed: () => _openUrl(AppStrings.rustoreUrl),
              icon: const Icon(Icons.download_rounded),
              label: Text(strings.download),
            ),
            OutlinedButton.icon(
              onPressed: () => _openMail(strings),
              icon: const Icon(Icons.mail_outline_rounded),
              label: Text(AppStrings.contactEmail),
            ),
          ],
        ),
      ],
    );
  }
}

class _HeroPreview extends StatelessWidget {
  const _HeroPreview({required this.strings});

  final AppStrings strings;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.46),
        borderRadius: BorderRadius.circular(34),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: AspectRatio(
          aspectRatio: 9 / 16,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(28),
            child: Image.asset(
              strings.screenshotAssets.first,
              fit: BoxFit.cover,
              semanticLabel: strings.screenshotsTitle,
            ),
          ),
        ),
      ),
    );
  }
}

class _PageSection extends StatelessWidget {
  const _PageSection({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1100),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 26, 20, 34),
          child: child,
        ),
      ),
    );
  }
}

class _AboutSection extends StatelessWidget {
  const _AboutSection({required this.strings});

  final AppStrings strings;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: strings.aboutTitle),
        const SizedBox(height: 18),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: strings.infoBlocks.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery.sizeOf(context).width < 760 ? 1 : 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            mainAxisExtent: 178,
          ),
          itemBuilder: (context, index) {
            final block = strings.infoBlocks[index];
            return _InfoCard(block: block);
          },
        ),
      ],
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({required this.block});

  final InfoBlock block;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(block.title, style: theme.textTheme.titleLarge),
            const SizedBox(height: 12),
            Expanded(
              child: Text(block.body, style: theme.textTheme.bodyMedium),
            ),
          ],
        ),
      ),
    );
  }
}

class _ScreenshotsSection extends StatelessWidget {
  const _ScreenshotsSection({required this.strings});

  final AppStrings strings;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: strings.screenshotsTitle,
          subtitle: strings.screenshotsHint,
        ),
        const SizedBox(height: 18),
        ScreenshotGallery(assets: strings.screenshotAssets),
      ],
    );
  }
}

class _FaqSection extends StatelessWidget {
  const _FaqSection({required this.strings});

  final AppStrings strings;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: strings.faqTitle),
        const SizedBox(height: 18),
        for (final item in strings.faqItems) FaqTile(item: item),
      ],
    );
  }
}

class _PrivacyAndContactSection extends StatelessWidget {
  const _PrivacyAndContactSection({required this.strings});

  final AppStrings strings;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionHeader(
                  title: strings.privacyTitle,
                  subtitle: strings.privacyText,
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    OutlinedButton(
                      onPressed: () => _openUrl(AppStrings.privacyRuUrl),
                      child: Text(strings.privacyRu),
                    ),
                    OutlinedButton(
                      onPressed: () => _openUrl(AppStrings.privacyEnUrl),
                      child: Text(strings.privacyEn),
                    ),
                  ],
                ),
                const Divider(height: 42),
                SectionHeader(
                  title: strings.contactTitle,
                  subtitle: strings.contactText,
                ),
                const SizedBox(height: 16),
                FilledButton.icon(
                  onPressed: () => _openMail(strings),
                  icon: const Icon(Icons.mail_outline_rounded),
                  label: Text(strings.emailButton),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        Center(
          child: Text(
            strings.copyright,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}

Future<void> _openUrl(String url) async {
  final uri = Uri.parse(url);
  await launchUrl(uri, webOnlyWindowName: '_blank');
}

Future<void> _openMail(AppStrings strings) async {
  final uri = Uri(
    scheme: 'mailto',
    path: AppStrings.contactEmail,
    queryParameters: {'subject': strings.pageTitle},
  );
  await launchUrl(uri);
}
