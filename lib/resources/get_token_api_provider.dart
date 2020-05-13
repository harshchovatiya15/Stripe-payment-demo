import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:stripe_demo/constant.dart';
import 'package:http/http.dart' as http;

import 'add_existing_card_api_provider.dart';
import 'create_customer_api_provider.dart';

Future<ApiResponseModel> createCard(BuildContext context, String expireDate,
    String cardNumber, String cvcNumber, String ammount) async {
  var month = expireDate.split("/")[0];
  var year = expireDate.split("/")[1];
  var url = "${baseUrl + tokenUrl}";
  var body = {
    "card[number]": cardNumber,
    "card[exp_month]": month,
    "card[exp_year]": year,
    "card[cvc]": cvcNumber,
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
    var test = json.decode(response2);
    id = test['id'];

    // print(id);
    // return createCustomer(context, id, ammount);
    return customerId != null && customerId != ""
        ? addCardToExitingCustomer(id, ammount)
        : createCustomer(context, id, ammount);
  } else {
    print("something Wrong!");
    return ApiResponseModel(
        "No Data found", false, json.decode(response2), response1.statusCode);
  }
}

class ApiResponseModel {
  final String message;
  final bool status;
  final dynamic data;
  final int statusCode;
  ApiResponseModel(this.message, this.status, this.data, this.statusCode);
}
