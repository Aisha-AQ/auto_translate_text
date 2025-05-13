import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageService {
  static const String _languageKey = 'language_key';
  static final RxString currentLanguage = 'en'.obs;

  /// Gets the stored language, or stores the given one.
  static Future<String> getOrStoreLanguage({String? language}) async {
    final prefs = await SharedPreferences.getInstance();
    final storedLanguage = prefs.getString(_languageKey);

    if (storedLanguage != null && language == null) {
      currentLanguage.value = storedLanguage;
      return storedLanguage;
    } else {
      final langToStore = language ?? 'en';
      await prefs.setString(_languageKey, langToStore);
      currentLanguage.value = langToStore;
      return langToStore;
    }
  }

  /// Optional: Allows changing the language manually
  static Future<void> setLanguage(String language) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, language);
    currentLanguage.value = language;
  }

  /// Optional: Retrieves the currently stored language without modifying it
  static Future<String> getCurrentLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_languageKey) ?? 'en';
  }
}
