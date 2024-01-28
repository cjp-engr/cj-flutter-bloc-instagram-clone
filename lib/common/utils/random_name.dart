import 'dart:convert';
import 'dart:math';

String randomName({int length = 8}) {
  const characters = 'abcdefghijklmnopqrstuvwxyz0123456789';
  final random = Random.secure();

  List<int> codeUnits = List.generate(length, (index) {
    int charIndex = random.nextInt(characters.length);
    return characters.codeUnitAt(charIndex);
  });

  String randomName = utf8.decode(codeUnits);
  return randomName;
}
