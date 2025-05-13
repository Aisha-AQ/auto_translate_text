import 'package:auto_translate_text/auto_translate_text.dart';
import 'package:flutter/material.dart';

void main() {
  AutoTranslateConfig.setApiKey(
    'YOUR_GOOGLE_KEY', // Replace this with your real key for testing
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auto Translate Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LanguageSelectionPage(),
    );
  }
}

class LanguageSelectionPage extends StatelessWidget {
  final List<String> languages = ['en', 'es', 'fr', 'de'];

  LanguageSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Language')),
      body: ListView.builder(
        itemCount: languages.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(languages[index]),
            onTap: () async {
              await LanguageService.setLanguage(languages[index]);
              if (!context.mounted) return;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TranslatedTextPage(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class TranslatedTextPage extends StatelessWidget {
  final String textToTranslate = "Hello, how are you?";

  const TranslatedTextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Translated Text')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: AutoTranslateText(
            textToTranslate,
            style: const TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
