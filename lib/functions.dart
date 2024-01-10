/* 
Finde die größere Zahl
Schreibe eine Funktion, die die größere von zwei Zahlen zurückgibt.


Gerade Zahl
Schreibe eine Funktion, die prüft, ob eine übergebene Zahl gerade ist.

 */

Future<int> getBiggerNumber(int x, int y) async {
  await Future.delayed(const Duration(seconds: 3));
  if (x >= y) {
    return x;
  } else {
    return y;
  }
}

Future<bool> isEvenNumber(int x) async {
  await Future.delayed(const Duration(seconds: 3));
  throw Exception("Fehler!!!!!!!");
}
