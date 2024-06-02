import 'package:http/http.dart' as http;

Future<void> fetchDataFromPHP() async {
  final response = await http.get(Uri.parse('YOUR_PHP_SCRIPT_URL_HERE'));

  if (response.statusCode == 200) {
    print('Response body: ${response.body}');
    // Parse response body if needed
  } else {
    print('Request failed with status: ${response.statusCode}');
  }
}

void main() {
  fetchDataFromPHP();
}
