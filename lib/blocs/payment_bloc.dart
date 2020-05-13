// import 'package:rxdart/rxdart.dart';
// import 'package:stripe_demo/resources/get_token_api_provider.dart';

// class PayPaymentBloc {
//   BehaviorSubject<ApiResponseModel> payPayment =
//       BehaviorSubject<ApiResponseModel>();

//   Future<void> setCreateCard(String expireDate, String cardNumber,
//       String cvcNumber, String ammount) async {
//     final ApiResponseModel item =
//         await createCard(expireDate, cardNumber, cvcNumber, ammount);
//     payPayment.sink.add(item);
//   }

//   void dispose() {
//     payPayment.close();
//   }

//   void clear() {
//     payPayment.sink.add(null);
//   }
// }

// final payPaymentBloc = PayPaymentBloc();
