import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constant.dart';
import 'get_token_api_provider.dart';
import 'pay_with_card_api_provider.dart';

Future<ApiResponseModel> addCardToExitingCustomer(
    String token, String amount) async {
  var url = "${baseUrl + 'customers/' + customerId + '/' + 'sources'}";
  var body = {
    "source": token,
  };
  var client = new http.Client();
  var request = new http.Request('POST', Uri.parse(url));
  request.headers['Content-Type'] =
      'application/x-www-form-urlencoded; charset=utf-8';
  request.headers['Authorization'] = 'Bearer $stripekey';
  request.bodyFields = body;
  final response1 = await client.send(request);
  final response2 = await response1.stream.bytesToString();
  if (response1.statusCode == 200) {
    // print(response2);
    var test = await json.decode(response2);
    String cardId = test['id'];
    return await payWithCard(cardId, amount);
  } else {
    print("something Wrong!");
    return ApiResponseModel(
        "No Data found", false, json.decode(response2), response1.statusCode);
  }
}
