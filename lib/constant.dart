import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

final Client client = Client();
String baseUrl = 'https://api.stripe.com/v1/';
String tokenUrl = 'tokens';
String createCustomerUrl = 'customers';
String chargesUrl = 'charges';
String stripekey = 'sk_test_h0DawdwgoBHon7LfZ3rXvnYd00gqoNehRt';
String custId;
StreamedResponse payResponse;
var id;
SharedPreferences prefrenceObjects;
String customerId;
