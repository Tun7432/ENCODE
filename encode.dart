void main() {
  final input = "CISKUC";
  final level1 = encodeROT13(input);
  final level2 = encodeDecimalToBinary(level1);
  final output = "$level2";

  print("Input = $input");
  print("Level 1, ROT-13 = $level1");
  print("Level 2, DTB = $level2");
  print("Output =  $output");
}

String encodeROT13(String input) {
  return input.runes.map((rune) {
    if ((rune >= 65 && rune <= 77) || (rune >= 97 && rune <= 109)) {
      // Rotate by 13 places for uppercase and lowercase letters
      return String.fromCharCode(rune + 13);
    } else if ((rune >= 78 && rune <= 90) || (rune >= 110 && rune <= 122)) {
      // Wrap around for letters beyond 'M' or 'm'
      return String.fromCharCode(rune - 13);
    } else {
      // Non-alphabet characters
      return String.fromCharCode(rune);
    }
  }).join();
}

String encodeDecimalToBinary(String input) {
  return input.runes.map((rune) {
    if (rune >= 48 && rune <= 57) {
      // Digits
      final binaryString =
          int.parse(String.fromCharCode(rune)).toRadixString(2);
      return binaryString.padLeft(4, '0');
    } else {
      // Non-digit characters
      return String.fromCharCode(rune);
    }
  }).join();
}
