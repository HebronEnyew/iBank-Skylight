import 'package:flutter/material.dart';

class LanguageModel {
  final String name;
  final String flagAsset;
  final String code;

  LanguageModel({
    required this.name,
    required this.flagAsset,
    required this.code,
  });
}

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String selectedLanguageCode = "en";

  final List<LanguageModel> languages = [
    LanguageModel(
      name: "Vietnamese",
      flagAsset: "assets/flags/vn.webp",
      code: "vi",
    ),
    LanguageModel(
      name: "French",
      flagAsset: "assets/flags/fr.webp",
      code: "fr1",
    ),
    LanguageModel(
      name: "English",
      flagAsset: "assets/flags/us.webp",
      code: "en",
    ),
    LanguageModel(
      name: "Japanese",
      flagAsset: "assets/flags/jp.webp",
      code: "jp",
    ),
    LanguageModel(
      name: "Portuguese",
      flagAsset: "assets/flags/pt.gif",
      code: "pt1",
    ),
    LanguageModel(name: "China", flagAsset: "assets/flags/cn.webp", code: "zh"),
    LanguageModel(name: "Korea", flagAsset: "assets/flags/kr.webp", code: "ko"),
    LanguageModel(
      name: "Nicaragua",
      flagAsset: "assets/flags/ni.webp",
      code: "ni",
    ),
    LanguageModel(
      name: "Russia",
      flagAsset: "assets/flags/ru.webp",
      code: "ru",
    ),
    LanguageModel(
      name: "Portuguese",
      flagAsset: "assets/flags/pt.webp",
      code: "pt2",
    ),
    LanguageModel(
      name: "French",
      flagAsset: "assets/flags/fr.webp",
      code: "fr2",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black87,
            size: 22,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Language",
          style: TextStyle(
            color: Color(0xFF333333),
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.only(top: 10, bottom: 20),
        itemCount: languages.length,
        separatorBuilder: (context, index) => const Divider(
          indent: 85,
          height: 1,
          thickness: 0.8,
          color: Color(0xFFF2F2F7),
        ),
        itemBuilder: (context, index) {
          final language = languages[index];
          final isSelected = selectedLanguageCode == language.code;

          return _buildLanguageTile(language, isSelected);
        },
      ),
    );
  }

  Widget _buildLanguageTile(LanguageModel language, bool isSelected) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedLanguageCode = language.code;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Row(
          children: [
            // Flag Container
            Container(
              width: 55,
              height: 38,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                image: DecorationImage(
                  image: AssetImage(language.flagAsset),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                language.name,
                style: TextStyle(
                  color: isSelected
                      ? const Color(0xFF333333)
                      : const Color(0xFFAAAAAA),
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  fontSize: 19,
                ),
              ),
            ),
            if (isSelected)
              const Icon(
                Icons.check_rounded,
                color: Color(0xFF3B3DBF),
                size: 26,
              ),
          ],
        ),
      ),
    );
  }
}
