import 'dart:convert';
import 'package:crypto/crypto.dart';

String hashPassword(String password, String salt) {
  final bytes = utf8.encode('$salt$password');
  return sha256.convert(bytes).toString();
}

// Simple salt generator for a class project (not cryptographically perfect,
// but good enough for local prototype)
String makeSalt() => DateTime.now().microsecondsSinceEpoch.toString();
