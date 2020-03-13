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

class Detail extends StatefulWidget {
  Detail({Key key}) : super(key: key);

  @override
  _MyDetailState createState() => _MyDetailState();
}

class _MyDetailState extends State<Detail> {
  int _n = 0;

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

  void add() {
    setState(() {
      _n++;
    });
  }

  void minus() {
    setState(() {
      if (_n != 0) _n--;
    });
  }
 



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Detail Product',
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
                            child: Container(
                           
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
                      margin: EdgeInsets.all(5),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.phone_iphone,
                                size: 20,
                                color: Colors.blue,
                              ),
                              Text(
                                snapshort.data[0].name,
                                style:
                                    TextStyle(fontSize: 16, color: Colors.blue),
                              ),
                              VerticalDivider(
                                width: 80,
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(Icons.color_lens,
                                      size: 18, color: Colors.blue),
                                  Text("สี:เทาสเปซเกรย์",
                                      style: TextStyle(
                                        fontSize: 16,
                                      )),
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.add_to_home_screen,
                                color: Colors.blue,
                                size: 20,
                              ),
                              Text("จอภาพขนาด 8.5 นิ้ว",
                                  style: TextStyle(fontSize: 16)),
                              VerticalDivider(
                                width: 43,
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.memory,
                                    size: 18,
                                    color: Colors.blue,
                                  ),
                                  Text("ความจุ 64 GB",
                                      style: TextStyle(fontSize: 16)),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                            ),
                            margin: const EdgeInsets.all(5.0),
                            padding: EdgeInsets.only(top: 0, left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "เลือกซื้อและเรียนรู้",
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.check,
                                      size: 16,
                                      color: Colors.green,
                                    ),
                                    Text(
                                      "จอภาพมีมุมมนที่รับกับดีไซน์แบบโค้งอันงดงาม​",
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.check,
                                      size: 16,
                                      color: Colors.green,
                                    ),
                                    Text(
                                      "iPhone 11 Pro และ iPhone 11 Pro Max มีความสามารถในการทนน้ำ​",
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.check,
                                      size: 16,
                                      color: Colors.green,
                                    ),
                                    Text(
                                      "หน้าจอจะมีขนาด 5.85 นิ้ว (iPhone 11 Pro)​",
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.check,
                                      size: 16,
                                      color: Colors.green,
                                    ),
                                    Text(
                                      "ค่าตามมาตรฐานที่ให้มานั้นจะใช้พื้นที่ประมาณ 11GB ถึง 14GB​",
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.check,
                                      size: 16,
                                      color: Colors.green,
                                    ),
                                    Text(
                                      "​ประกัน 3 ปี",
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.check,
                                      size: 16,
                                      color: Colors.green,
                                    ),
                                    Text(
                                      "iPhone ใหม่ทุกเครื่องมาพร้อมกับสิทธิ์ใช้ Apple TV+ ฟรี 1 ปี",
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Text("เลือกจำนวนสินค้า"),
                          ),
                          Container(
                            child: Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Container(
                                    width: 30,
                                    child: FloatingActionButton(
                                      heroTag: "btn1",
                                      onPressed: minus,
                                      child: Icon(
                                          const IconData(0xe15b,
                                              fontFamily: 'MaterialIcons'),
                                          color: Colors.black),
                                      backgroundColor: Colors.white,
                                    ),
                                  ),
                                  Text('$_n', style: TextStyle(fontSize: 20.0)),
                                  Container(
                                    width: 30,
                                    child: FloatingActionButton(
                                      heroTag: "btn2",
                                      onPressed: add,
                                      child:
                                          Icon(Icons.add, color: Colors.black),
                                      backgroundColor: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ButtonTheme(
                            buttonColor: Colors.green,
                            height: 30.0,
                            child: RaisedButton(
                              onPressed:(){ Navigator.pushNamed(context, '/payment');},
                              child: Text("สั่งซื้อ",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10)),
                            ),
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
