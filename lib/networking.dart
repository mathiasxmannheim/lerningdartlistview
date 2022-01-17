import 'package:http/http.dart' as http;

Future<http.Response> fetchBitcoinPrice() async {
  final response = await http.get(Uri.https("blockchain.info",'ticker'));
  return response;
}

class BitcoinPrice {
  var EUR;
  var USD;

  // constructor
  BitcoinPrice({required this.EUR, required this.USD});

  factory BitcoinPrice.fromJson(Map<String,dynamic> json) {
    // print(json['EUR']['15m']);
    return BitcoinPrice(
        EUR: json['EUR']['15m'],
        USD: json['USD']['15m']);
    // return
  }

}