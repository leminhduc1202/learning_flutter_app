import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class FlashcardScreen extends StatefulWidget {
  final String category;

  const FlashcardScreen({super.key, required this.category});

  @override
  State<FlashcardScreen> createState() => FlashcardScreenState();
}

class FlashcardScreenState extends State<FlashcardScreen> {
  var data = {
    "Food": [
      {"word": "Tea", "result": "Thé"},
      {"word": "rice", "result": "riz"},
    ],
    "Basics": [
      {"word": "Bonjour", "result": "Hello"},
      {"word": "Bye", "result": "Au revoir"},
    ],
    "Travel": [
      {"word": "Hostel", "result": "Auberge"},
      {"word": "Journey", "result": "Voyage"},
    ],
    "School": [
      {"word": "Teacher", "result": "Professeure/Professeur"},
      {"word": "classmate", "result": "camarade de classe"}
    ]
  };

  var _currItem = 0;
  late List<Map<String, String>> jsonData;
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  TextStyle textStyle = TextStyle(
      color: Colors.green.shade900, fontSize: 20, fontWeight: FontWeight.w600);

  @override
  void initState() {
    super.initState();
    jsonData = (data[widget.category] as List).cast<Map<String, String>>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffA7D397),
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Learning Made Easy"),
          elevation: 5,
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              Text(
                "Guess the Word and Flip! ????",
                style: TextStyle(fontSize: 30, color: Colors.green.shade900),
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 25),
              SizedBox(
                width: 300,
                height: 300,
                child: FlipCard(
                  key: cardKey,
                  side: CardSide.FRONT,
                  direction: FlipDirection.HORIZONTAL,
                  front: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    elevation: 7,
                    shadowColor: Colors.grey,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Text(jsonData[_currItem]["word"] ?? "",
                            textAlign: TextAlign.center, style: textStyle),
                      ),
                    ),
                  ),
                  back: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    elevation: 7,
                    shadowColor: Colors.grey,
                    color: Colors.yellow.shade200,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Text(jsonData[_currItem]["result"] ?? "",
                            textAlign: TextAlign.center, style: textStyle),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _currItem = (_currItem + 1) % jsonData.length;
                      cardKey.currentState?.toggleCardWithoutAnimation();
                    });
                  },
                  child: const Text("Next"))
            ])));
  }
}
