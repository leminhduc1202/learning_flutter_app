import 'package:flutter/material.dart';
import 'package:learning_flutter/app_mini/basic_quiz/basic_quiz_screen.dart';
import 'package:learning_flutter/app_mini/pdf_generation/pdf_generating_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        BasicQuizScreen.routeNameBasicQuiz: (context) =>
            const BasicQuizScreen(),
        PdfGeneratingScreen.routeNamePdfGen: (context) =>
            PdfGeneratingScreen(),
        //add more for register
      },
      title: 'Flutter App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: const MyHomePage(title: 'Flutter App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, BasicQuizScreen.routeNameBasicQuiz);
              },
              child: const Text('Basic Quiz'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, PdfGeneratingScreen.routeNamePdfGen);
              },
              child: const Text('Pdf Generating'),
            ),
            Text(
              'You have pushed the button this many times: $_counter',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
