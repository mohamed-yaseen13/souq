import 'dart:math';

class Generator {
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

  static String generateUserId() {
    const chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-_';
    final rand = Random.secure();
    final userId = List.generate(
      20, // Firestore auto IDs are 20 chars long
      (_) => chars[rand.nextInt(chars.length)],
    ).join();

    return userId;
  }
}
