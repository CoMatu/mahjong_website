enum AppLocale { ru, en }

class AppStrings {
  const AppStrings._(this.locale);

  final AppLocale locale;

  static const rustoreUrl =
      'https://www.rustore.ru/catalog/app/ru.matusevichvv.comatu_mahjong';
  static const privacyRuUrl =
      'https://github.com/CoMatu/tonometer-privacy/blob/main/privacy_mahjong.md';
  static const privacyEnUrl =
      'https://github.com/CoMatu/tonometer-privacy/blob/main/privacy_mahjong_en.md';
  static const contactEmail = 'matu1@mail.ru';

  static AppStrings of(AppLocale locale) {
    return AppStrings._(locale);
  }

  bool get isRu => locale == AppLocale.ru;

  String get languageCode => isRu ? 'ru' : 'en';

  String get appTitle => 'Comatu Mahjong';
  String get pageTitle =>
      isRu ? 'Поддержка Comatu Mahjong' : 'Comatu Mahjong Support';
  String get navAbout => isRu ? 'Описание' : 'About';
  String get navScreenshots => isRu ? 'Скриншоты' : 'Screenshots';
  String get navFaq => 'FAQ';
  String get navContacts => isRu ? 'Контакты' : 'Contacts';
  String get download => isRu ? 'Скачать в RuStore' : 'Download on RuStore';
  String get support => isRu ? 'Поддержка игры' : 'Game support';
  String get heroTitle =>
      isRu ? 'Маджонг с понятными правилами' : 'Mahjong with clear rules';
  String get heroSubtitle => isRu
      ? 'Находите одинаковые плитки, сдвигайте их по ряду или столбцу и проходите этап за этапом. Прогресс сохраняется на устройстве автоматически.'
      : 'Find matching tiles, slide them along rows or columns, and clear stage after stage. Game progress is saved locally on your device.';
  String get aboutTitle => isRu ? 'Об игре' : 'About the game';
  String get screenshotsTitle => isRu ? 'Скриншоты' : 'Screenshots';
  String get faqTitle =>
      isRu ? 'Часто задаваемые вопросы' : 'Frequently asked questions';
  String get privacyTitle =>
      isRu ? 'Политика конфиденциальности' : 'Privacy policy';
  String get privacyText => isRu
      ? 'Полный текст политики доступен по ссылкам:'
      : 'The full privacy policy is available here:';
  String get privacyRu =>
      isRu ? 'Политика на русском' : 'Privacy policy in Russian';
  String get privacyEn =>
      isRu ? 'Политика на английском' : 'Privacy policy in English';
  String get contactTitle =>
      isRu ? 'Связаться с поддержкой' : 'Contact support';
  String get contactText => isRu
      ? 'Если у вас есть вопрос, ошибка или предложение по игре, напишите на почту.'
      : 'For questions, bug reports, or suggestions about the game, send an email.';
  String get emailButton => isRu ? 'Написать письмо' : 'Send email';
  String get screenshotsHint => isRu
      ? 'Интерфейс приложения в русской локализации.'
      : 'App interface in English localization.';
  String get copyright => isRu
      ? 'Comatu Mahjong. Данные игры хранятся только на вашем устройстве.'
      : 'Comatu Mahjong. Game data is stored only on your device.';

  List<InfoBlock> get infoBlocks => isRu ? _infoBlocksRu : _infoBlocksEn;
  List<FaqItem> get faqItems => isRu ? _faqRu : _faqEn;
  List<String> get screenshotAssets => isRu ? _screenshotsRu : _screenshotsEn;

  static const _screenshotsRu = [
    'assets/images/mahjong_ru_ios_1.png',
    'assets/images/mahjong_ru_ios_2.png',
    'assets/images/mahjong_ru_ios_3.png',
    'assets/images/mahjong_ru_ios_4.png',
  ];

  static const _screenshotsEn = [
    'assets/images/mahjong_en_ios_1.png',
    'assets/images/mahjong_en_ios_2.png',
    'assets/images/mahjong_en_ios_3.png',
    'assets/images/mahjong_en_ios_4.png',
  ];

  static const _infoBlocksRu = [
    InfoBlock(
      title: 'Как играть',
      body:
          'Найдите две одинаковые плитки, которые видят друг друга по прямой линии. Сдвиньте плитку пальцем вдоль ряда или столбца, чтобы собрать пару.',
    ),
    InfoBlock(
      title: 'Три уровня сложности',
      body:
          'Легкий режим подходит для знакомства, нормальный дает сбалансированный вызов, а эксперт предлагает большое поле для опытных игроков.',
    ),
    InfoBlock(
      title: 'Прогресс и очки',
      body:
          'Проходите серию этапов, набирайте очки за ходы и завершенные уровни. Незавершенную игру можно продолжить с главного экрана.',
    ),
    InfoBlock(
      title: 'Подсказки и помощь',
      body:
          'Подсказка покажет возможный ход. Если ходов больше нет, доступно перемешивание плиток.',
    ),
    InfoBlock(
      title: 'Удобство',
      body:
          'Игра не требует регистрации. Интернет нужен только для рекламы, а звук можно отключить в настройках.',
    ),
  ];

  static const _infoBlocksEn = [
    InfoBlock(
      title: 'How to play',
      body:
          'Find two matching tiles that can see each other in a straight line. Slide a tile along a row or column to make a pair.',
    ),
    InfoBlock(
      title: 'Three difficulty levels',
      body:
          'Easy mode is great for learning, Normal offers a balanced challenge, and Expert gives experienced players a larger board.',
    ),
    InfoBlock(
      title: 'Progress and score',
      body:
          'Clear a sequence of stages and earn points for successful moves and completed levels. An unfinished game can be resumed from the main screen.',
    ),
    InfoBlock(
      title: 'Hints and help',
      body:
          'Hints show an available move. If there are no moves left, you can shuffle the tiles.',
    ),
    InfoBlock(
      title: 'Convenience',
      body:
          'No account is required. Internet access is needed only for ads, and sound can be disabled in settings.',
    ),
  ];

  static const _faqRu = [
    FaqItem(
      question: 'Приложение зависло — что делать?',
      answer:
          'Закройте игру и запустите ее снова. Если проблема повторяется, проверьте обновление в RuStore и напишите в поддержку с описанием устройства и момента зависания.',
    ),
    FaqItem(
      question: 'Пропал прогресс — можно ли восстановить?',
      answer:
          'Прогресс хранится только на вашем устройстве. После удаления приложения, очистки данных или сброса устройства восстановить его обычно нельзя.',
    ),
    FaqItem(
      question: 'Нужен ли интернет для игры?',
      answer:
          'Для самой игры интернет не нужен. Подключение требуется только для загрузки рекламы и просмотра видео за подсказки или перемешивание.',
    ),
    FaqItem(
      question: 'Как получить подсказки?',
      answer:
          'Подсказки можно получать за игровые очки или за просмотр короткой рекламы по вашему выбору.',
    ),
    FaqItem(
      question: 'Как отключить звук?',
      answer: 'Откройте настройки приложения и выключите звук.',
    ),
    FaqItem(
      question: 'Почему показывается реклама?',
      answer:
          'Игра бесплатна. В пользовательской версии могут показываться баннеры, а просмотр видео запускается только по вашему выбору.',
    ),
  ];

  static const _faqEn = [
    FaqItem(
      question: 'App freezes — what should I do?',
      answer:
          'Close the game and launch it again. If the issue repeats, check for an update in RuStore and contact support with your device model and what happened before the freeze.',
    ),
    FaqItem(
      question: 'I lost my progress. Can it be restored?',
      answer:
          'Progress is stored only on your device. If you delete the app, clear its data, or reset the device, it usually cannot be restored.',
    ),
    FaqItem(
      question: 'Is internet access required?',
      answer:
          'Internet access is not required for the game itself. It is used only to load ads and optional rewarded videos for hints or shuffling.',
    ),
    FaqItem(
      question: 'How do I get hints?',
      answer:
          'Hints can be received for in-game points or by watching a short optional ad.',
    ),
    FaqItem(
      question: 'How do I mute sound?',
      answer: 'Open the app settings and turn sound off.',
    ),
    FaqItem(
      question: 'Why are there ads?',
      answer:
          'The game is free. The user version may show banner ads, while videos are shown only when you choose to watch them.',
    ),
  ];
}

class InfoBlock {
  const InfoBlock({required this.title, required this.body});

  final String title;
  final String body;
}

class FaqItem {
  const FaqItem({required this.question, required this.answer});

  final String question;
  final String answer;
}
