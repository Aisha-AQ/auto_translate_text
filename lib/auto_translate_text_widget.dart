import 'package:auto_translate_text/language_service.dart';
import 'package:flutter/material.dart';
import 'package:google_cloud_translation/google_cloud_translation.dart';
import 'auto_translate_config.dart';
export 'language_service.dart';

class AutoTranslateText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;

  const AutoTranslateText(this.text, {super.key, this.style, this.textAlign});

  static Future<TranslationModel> translateText(String text) async {
    final translation = Translation(
      apiKey: AutoTranslateConfig.apiKey,
    );
    try {
      final translated = await translation.translate(
        text: text,
        to: await LanguageService.getOrStoreLanguage(),
      );
      return translated;
    } catch (e) {
      return TranslationModel(
        translatedText: text,
        detectedSourceLanguage: '',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TranslationModel>(
      future: translateText(text),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text(text, style: style);
        }
        if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}", style: style);
        }
        return Text(
          snapshot.data?.translatedText ?? text,
          style: style,
          textAlign: textAlign,
        );
      },
    );
  }
}
