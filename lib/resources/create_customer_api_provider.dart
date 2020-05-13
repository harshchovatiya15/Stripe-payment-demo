import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:stripe_demo/constant.dart';
import 'package:http/http.dart' as http;
import 'get_token_api_provider.dart';
import 'payment_api_provider.dart';

Future<ApiResponseModel> createCustomer(
    BuildContext context, String token, String ammount) async {
  var url = "${baseUrl + createCustomerUrl}";
  var body = {"description": "Customerdetail", "source": token};
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
    custId = test['id'];
    prefrenceObjects.setString('CustomerID', test['id']);
    // print('CstomerId: $custId');
    return await pay(custId, ammount);
  } else {
    print("something Wrong!");
    return ApiResponseModel(
        "No Data found", false, json.decode(response2), response1.statusCode);
  }
}
