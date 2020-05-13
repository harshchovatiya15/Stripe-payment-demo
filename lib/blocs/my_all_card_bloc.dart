import 'package:rxdart/rxdart.dart';
import 'package:stripe_demo/resources/get_my_all_card_api_provider.dart';
import 'package:stripe_demo/resources/get_token_api_provider.dart';

class MyAllCardBloc {
  BehaviorSubject<ApiResponseModel> getAllCard =
      BehaviorSubject<ApiResponseModel>();

  Future<void> setGetAllCard() async {
    final ApiResponseModel item = await getAllCards();
    getAllCard.sink.add(item);
  }

  void dispose() {
    getAllCard.close();
  }

  void clear() {
    getAllCard.sink.add(null);
  }
}

final myAllCardBloc = MyAllCardBloc();
