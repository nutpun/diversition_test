
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Product {
  final String id;
  final String name;
  final String details;
  final String price;
  final String picture;

  Product(this.id, this.name, this.details, this.price, this.picture);
}

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<Home> {
  Future<List<Product>> getProduct() async {
    final response = await http.get(
        'https://my-json-server.typicode.com/nutpun/diversition_test/products');
    var data = json.decode(response.body);

    for (var item in data) {
      Product product = Product(item["id"], item['name'], item['details'],
          item['price'], item['picture']);
      products.add(product);
    }
    return products;
  }

  List<Product> products = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Home',
              style: TextStyle(
                color: Colors.white,
              )),
      ),
           bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Favorite'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin),
            title: Text('Account'),
          ),
        ],
        selectedItemColor: Colors.blue,
      ),
      body: Container(
        child: FutureBuilder(
            future: getProduct(),
            builder: (BuildContext context, AsyncSnapshot snapshort) {
              if (snapshort.data == null) {
                return Container(
                    child: Center(
                  child: Text("Loading..."),
                ));
              } else {
                return  Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(5.0),
            height: 25,
            color: Colors.white,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("รายการสินค้า",
                      style: TextStyle(color: Colors.blue, fontSize: 10)),
                ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(1),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/detail');
                      },
                      child: Card(
                        elevation: 4,
                        child: Image.network(
                          snapshort.data[0].picture,
                          width: 190,
                          height: 150,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      left: 10.0,
                      bottom: 10.0,
                      child: Container(
                        color: Colors.blue,
                        child: Text( snapshort.data[0].name,
                            style: TextStyle(
                              fontSize: 12,color: Colors.white
                            )),
                      )),
                  Positioned(
                    right: 10.0,
                    bottom: 10.0,
                    child: Container(
                        color: Colors.blue[200],
                        child: Text( snapshort.data[0].price+" THB",
                            style: TextStyle(
                              fontSize: 12,
                            )),
                      )
                  ),
                  Positioned(
                    top: 10.0,
                    left: 10.0,
                    child: Container(
                      child: Center(
                          child: Text("ประกาศแนะนำ",
                              style:
                                  TextStyle(fontSize: 6, color: Colors.white))),
                      color: Colors.pink,
                      height: 12.0,
                      width: 45.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      );
              }
            }),
      ),
    );
  }
}
