import 'dart:math';

class PasswordGenerator {
  static String generatePassword() {
    const chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#\$%^&*()';
    final rand = Random.secure();
    final password = List.generate(
      32,
      (_) => chars[rand.nextInt(chars.length)],
    ).join();

    return password;
  }
}
