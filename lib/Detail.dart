import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Product {
  final String id;
  final String name;
  final String details;
  final double price;
  final String picture;

  Product(this.id, this.name, this.details, this.price, this.picture);
}

class Detail extends StatefulWidget {
  Detail({Key key}) : super(key: key);

  @override
  _MyDetailState createState() => _MyDetailState();
}

class _MyDetailState extends State<Detail> {
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
          title: Text('ข้อมูลสินค้า',
              style: TextStyle(
                color: Colors.white,
              )),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(context, false),
          )),
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
                return Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(1),
                          child: GestureDetector(
                            onTap: () {},
                            child: Card(
                              elevation: 4,
                              child: Image.network(
                                (snapshort.data[0].picture),
                                width: 500,
                                height: 200,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 10.0,
                          top: 10.0,
                          child: Container(
                            child: Center(
                                child: Text("ประกาศแนะนำ",
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white))),
                            color: Colors.pink,
                            height: 15.0,
                            width: 65.0,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      padding: EdgeInsets.only(top: 0, left: 10),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.home,
                                size: 18,
                                color: Colors.blue,
                              ),
                              Text(
                                snapshort.data[0].name,
                                style:
                                    TextStyle(fontSize: 10, color: Colors.blue),
                              ),
                              VerticalDivider(
                                width: 55,
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(Icons.location_on,
                                      size: 18, color: Colors.blue),
                                  Text("ภาคอีสาน » สกลนคร » อำเภอเมืองสกลนคร",
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.blue)),
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.directions_car,
                                color: Colors.blue,
                                size: 18,
                              ),
                              Text("จำนวนโพสต์ 500 คัน",
                                  style: TextStyle(fontSize: 10)),
                              VerticalDivider(
                                width: 43,
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.widgets,
                                    size: 18,
                                    color: Colors.blue,
                                  ),
                                  Text("จำนวนสินค้า 50 รายการ",
                                      style: TextStyle(fontSize: 10)),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
            }),
      ),
    );
  }
}
