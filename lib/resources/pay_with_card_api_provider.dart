import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constant.dart';
import 'get_token_api_provider.dart';

Future<ApiResponseModel> payWithCard(String cardId, String ammount) async {
  var url = "${baseUrl + chargesUrl}";
  var body = {
    "amount": '${int.parse(ammount) * 100}',
    "currency": "INR",
    "source": cardId,
    "description": "Testing",
    "customer": customerId
  };
  var client = new http.Client();
  var request = new http.Request('POST', Uri.parse(url));
  request.headers['Content-Type'] =
      'application/x-www-form-urlencoded; charset=utf-8';
  request.headers['Authorization'] = 'Bearer $stripekey';
  request.bodyFields = body;
  payResponse = await client.send(request);
  final response2 = await payResponse.stream.bytesToString();

  var test = json.decode(response2);
  if (payResponse.statusCode == 200) {
    // print(response2);
    // print(test);
    return ApiResponseModel(
        "Data found", true, json.decode(response2), payResponse.statusCode);
  } else {
    print("something Wrong!");
    return ApiResponseModel(
        "No Data found", false, json.decode(response2), payResponse.statusCode);
  }
}
