import 'dart:convert';
import 'package:http/http.dart' as http;

class Test {
  static Future<String?> checkEmailProvider(String email) async {
    final domain = email.split('@').last;
    final url = Uri.parse("https://dns.google/resolve?name=$domain&type=MX");

    final response = await http.get(url);
    if (response.statusCode != 200) return null;

    final data = jsonDecode(response.body);

    if (data["Answer"] == null) return null;

    final answers = (data["Answer"] as List)
        .map((e) => e["data"].toString())
        .toList();

    if (answers.any((r) => r.contains("google.com"))) {
      return "Google";
    } else if (answers.any(
      (r) => r.contains("outlook.com") || r.contains("microsoft.com"),
    )) {
      return "Microsoft";
    }

    return null;
  }
}
