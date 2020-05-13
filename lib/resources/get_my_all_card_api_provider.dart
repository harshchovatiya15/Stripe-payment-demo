import 'dart:convert';
import 'package:stripe_demo/constant.dart';
import 'package:stripe_demo/models/get_my_all_card_model.dart';
import 'get_token_api_provider.dart';
import 'package:http/http.dart' as http;

Future<ApiResponseModel> getAllCards() async {
  var url = "${baseUrl + 'customers/' + customerId + '/' + 'sources'}";
  var client = new http.Client();
  var request = new http.Request('GET', Uri.parse(url));
  request.headers['Content-Type'] =
      'application/x-www-form-urlencoded; charset=utf-8';
  request.headers['Authorization'] = 'Bearer $stripekey';
  final response1 = await client.send(request);
  final response2 = await response1.stream.bytesToString();
  if (response1.statusCode == 200) {
    // print(response2);
    var test = json.decode(response2);
    return ApiResponseModel(
        'Data found', true, CardModel(test['data']), response1.statusCode);
  } else {
    print("something Wrong!");
    return ApiResponseModel(
        "No Data found", false, json.decode(response2), response1.statusCode);
  }
}
