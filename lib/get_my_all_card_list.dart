import 'package:flutter/material.dart';
import 'package:stripe_demo/blocs/my_all_card_bloc.dart';
import 'package:stripe_demo/pay_with_existing_card.dart';

import 'models/get_my_all_card_model.dart';

class GetMyAllCardList extends StatefulWidget {
  @override
  _GetMyAllCardListState createState() => _GetMyAllCardListState();
}

class _GetMyAllCardListState extends State<GetMyAllCardList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Cards')),
      body: Container(
        child: StreamBuilder(
            stream: myAllCardBloc.getAllCard,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                myAllCardBloc.setGetAllCard();
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              final List<Cards> getAllMyCards = snapshot.data.data.cardList;
              return getAllMyCards.length != 0
                  ? ListView.builder(
                      itemCount: getAllMyCards.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          child: ListTile(
                            title: Text(
                                'xxxx xxxx xxxx ${getAllMyCards[index].last4}'),
                            leading: Text(
                              getAllMyCards[index].brand,
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                            trailing: Text('Pay'),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PayWithExistingCard(
                                      '${getAllMyCards[index].id}'),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    )
                  : Container(
                      child: Center(
                        child: Text('You does not have any card'),
                      ),
                    );
            }),
      ),
    );
  }
}
