import 'package:flutter/cupertino.dart';

class PasswordsProvider extends ChangeNotifier {
  String password = "";
  String hash = "";

  String getPassword(String newPassword) {
    notifyListeners();
    return password = newPassword;
  }

  String getHash(String newHash) {
    notifyListeners();
    return hash = newHash;
  }
}
