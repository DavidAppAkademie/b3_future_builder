import 'package:b3_future_builder/functions.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  Future<int> biggerNumberParcel = getBiggerNumber(1000, 780);
  Future<bool> isEvenParcel = isEvenNumber(10);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  setState(() {
                    biggerNumberParcel = getBiggerNumber(1000, 500);
                  });
                },
                child: const Text("Finde groessere Zahl"),
              ),
              FutureBuilder(
                future: biggerNumberParcel,
                builder: (context, snapshot) {
                  if (snapshot.hasData &&
                      snapshot.connectionState == ConnectionState.done) {
                    // Daten sind endlich da! Anzeigen!
                    int result = snapshot.data!;
                    return Text("Das Ergebnis ist $result");
                  } else if (snapshot.hasError) {
                    // Ladezeit vorbei, allerdings Fehler statt Daten!
                    return const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.error),
                        Text("Es gab nen Fehler :("),
                      ],
                    );
                  } else {
                    // immer noch am Laden.....
                    return const CircularProgressIndicator();
                  }
                },
              ),
              const SizedBox(
                height: 64,
              ),
              ElevatedButton(
                onPressed: () async {
                  setState(() {
                    isEvenParcel = isEvenNumber(7);
                  });
                },
                child: const Text("Ist Zahl gerade?"),
              ),
              FutureBuilder(
                future: isEvenParcel,
                builder: (context, snapshot) {
                  if (snapshot.hasData &&
                      snapshot.connectionState == ConnectionState.done) {
                    // Daten sind endlich da! Anzeigen!
                    bool result = snapshot.data!;
                    return Text("Das Ergebnis ist $result");
                  } else if (snapshot.hasError) {
                    // Ladezeit vorbei, allerdings Fehler statt Daten!
                    return const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.error),
                        Text("Es gab nen Fehler :("),
                      ],
                    );
                  } else {
                    // immer noch am Laden.....
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
