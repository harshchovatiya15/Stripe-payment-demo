import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stripe_demo/constant.dart';
import 'package:stripe_demo/credit_card_page.dart';
import 'package:stripe_demo/get_my_all_card_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    customerId = prefrenceObjects.getString('CustomerID');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 50),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreditCardPage(),
                      ),
                    );
                  },
                  child: Text('Pay the payment'),
                ),
              ),
              customerId != null
                  ? RaisedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GetMyAllCardList(),
                          ),
                        );
                      },
                      child: Text('My cards'),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
