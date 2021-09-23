class LanguageModel {
  final String code;
  final String label;
  final String asset;

  const LanguageModel({
    required this.code,
    required this.label,
    required this.asset,
  });
}


class GlobalUtils {
  static const kLanguages = [
    LanguageModel(
      code: "ar_MA",
      label: "العربية",
      asset: "assets/icons/arabic.png"
    ),
    LanguageModel(
      code: "en_US",
      label: "English",
      asset: "assets/icons/english.png"
    ),
    LanguageModel(
      code: "fr_FR",
      label: "Français",
      asset: "assets/icons/french.png"
    ),
  ];

}
