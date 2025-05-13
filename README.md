## Auto Translate Text Widget for Flutter

A simple and efficient Flutter package that automatically translates text content based on the user's selected language using the Google Cloud Translation API.

# Features
* Automatically translates text based on the user's language preference.
* Caches the user's language preference using SharedPreferences.
* Supports customizable styles and text alignment.
* Easy integration with the Google Cloud Translation API.

# Installation
To use this package, add it to your pubspec.yaml file:

dependencies:
  auto_translate_text: ^1.0.0

Then run:
    flutter pub get

# Setup

# Google Translate API Key
You must set your Google Translate API key before using the widget. You can do this by calling AutoTranslateConfig.setApiKey('YOUR_API_KEY') in your app’s main() function.

    void main() {
        AutoTranslateConfig.setApiKey('YOUR_API_KEY'); // Replace with your Google API key
        runApp(const MyApp());
    }

## Usage

# Using the AutoTranslateText Widget
You can use the AutoTranslateText widget to automatically translate text in your app. The widget takes the original text, an optional TextStyle, and an optional TextAlign parameter.

    AutoTranslateText(
        "Hello, how are you?",
        style: TextStyle(fontSize: 20, color: Colors.black),
        textAlign: TextAlign.center,
    )

This will translate the provided text based on the current user's language preference (stored in SharedPreferences). If no language is set, it defaults to English ('en').

# Language Service
The LanguageService class allows you to get or set the language dynamically. The language preference is stored in SharedPreferences, so it persists across app restarts.

    // Get the current stored language
    String currentLanguage = await LanguageService.getCurrentLanguage();

    // Set the language manually
    await LanguageService.setLanguage('es');  // Set language to Spanish

# Translation Logic
The translation is handled by the Google Cloud Translation API. The text will be translated into the language stored in SharedPreferences or default to English (en).

    TranslationModel translatedText = await AutoTranslateText.translateText("Hello");

## Example
To run the example, clone the repository and navigate to the `example` directory. Then, run the following command:

bash
    flutter run example/example.dart

# Configuration
* API Key: Ensure to set the Google Translate API key using AutoTranslateConfig.setApiKey('YOUR_API_KEY') in your main.dart before using the widget.
* Language Preference: The user's language preference is stored locally using SharedPreferences and can be modified using LanguageService.setLanguage().

# Contribution
Contributions are welcome! Please open an issue or submit a pull request for bug fixes, improvements, or new features.

# License
This project is licensed under the MIT License - see the LICENSE file for details.