import 'package:bcrypt/bcrypt.dart';

String encrypt(String password) {
  String salt = BCrypt.gensalt();
  String hash = BCrypt.hashpw(password, salt);
  return hash;
}

void desEncrypt(String hash, String password) {
  bool match = BCrypt.checkpw(password, hash);
  if (match) {
    print("Contraseña correcta");
  } else {
    print("La contraseña es incorrecta");
  }
}
