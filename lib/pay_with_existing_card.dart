import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:stripe_demo/welcome_page.dart';

import 'constant.dart';
import 'resources/pay_with_card_api_provider.dart';

class PayWithExistingCard extends StatefulWidget {
  const PayWithExistingCard(this.cardId);
  final String cardId;
  @override
  _PayWithExistingCardState createState() => _PayWithExistingCardState();
}

class _PayWithExistingCardState extends State<PayWithExistingCard> {
  final amountController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(title: Text('Pay money')),
        body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.4),
              child: TextField(
                decoration: InputDecoration(hintText: 'Enter amount in Rs.'),
                controller: amountController,
                keyboardType: TextInputType.number,
              ),
            ),
            Container(
              child: RaisedButton(
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  await payWithCard(widget.cardId, amountController.text);
                  // if (customerId != null && customerId != '') {

                  // } else {
                  if (payResponse.statusCode == 200) {
                    setState(() {
                      isLoading = false;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WelcomePage(),
                      ),
                    );
                  }
                },
                child: Text('Pay'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
