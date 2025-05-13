class AutoTranslateConfig {
  static String? _apiKey;

  static void setApiKey(String key) {
    _apiKey = key;
  }

  static String get apiKey {
    if (_apiKey == null) {
      throw Exception("Google Translate API key is not set. Call AutoTranslateConfig.setApiKey('YOUR_KEY') in main().");
    }
    return _apiKey!;
  }
}