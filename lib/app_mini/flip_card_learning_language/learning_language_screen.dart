import 'package:flutter/material.dart';

import 'flash_card_screen.dart';

class LearningLanguageScreen extends StatefulWidget {
  static const routeNameLearningLanguage = "/learningLanguage";

  const LearningLanguageScreen({super.key});

  @override
  State<LearningLanguageScreen> createState() => _LearningLanguageScreenState();
}

class _LearningLanguageScreenState extends State<LearningLanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Learning Language"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                "What you want to learn today?",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 1.0,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  padding: const EdgeInsets.all(10.0),
                  children: <Widget>[
                    _buildCard("Basics"),
                    _buildCard("Food"),
                    _buildCard("Travel"),
                    _buildCard("School"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(String text) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FlashcardScreen(category: text),
        ));
      },
      child: Container(
        height: 200,
        width: 200,
        decoration: const BoxDecoration(
            color: Color(0xffA7D397),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
