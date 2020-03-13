import 'dart:async';

import 'package:flutter/material.dart';
import 'package:awesome_card/awesome_card.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  final RoundedLoadingButtonController _btnController =
      new RoundedLoadingButtonController();

  void _doSomething() async {
    Timer(Duration(seconds: 2), () {
      _btnController.success();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Payment',
              style: TextStyle(
                color: Colors.white,
              )),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(child: Text("การชำระเงิน",style: TextStyle(fontSize: 16),),),
           
            Container(
              margin: EdgeInsets.all(10),
              child: CreditCard(
                cardNumber: "5450 7879 4864 7854",
                cardExpiry: "10/25",
                cardHolderName: "Card Holder",
                cvv: "456",
                bankName: "Axis Bank",
                showBackSide: false,
                frontBackground: CardBackgrounds.black,
                backBackground: CardBackgrounds.white,
                showShadow: true,
              ),
            ),
            Container(
              height: 40,
              width: 350,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "5450 7879 4864 7854",
                ),
              ),
            ),
            Container(
              height: 40,
              width: 350,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "10/28",
                ),
              ),
            ),
            Container(
              height: 40,
              width: 350,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Axis Bank",
                ),
              ),
            ),
            Container(
              height: 40,
              width: 350,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "CCV",
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 40,
              width: 150,
              child: RoundedLoadingButton(
                  child: Text('ชำระเงิน',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      )),
                  controller: _btnController,
                  onPressed: _doSomething),
            )
          ],
        ));
  }
}
