import 'package:flutter/material.dart';



class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("หน้าหลัก"),
      ),
      body: Column(
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
                     onTap: () { Navigator.pushNamed(context, '/detail');},
                      child: Card(
                        elevation: 4,
                        child: Image.network(
                          "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/iphone-11-pro-select-2019-family?wid=882&amp;hei=1058&amp;fmt=jpeg&amp;qlt=80&amp;op_usm=0.5,0.5&amp;.v=1567812930312",
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
                        child: Text("iPhone 11 Pro",
                            style: TextStyle(
                              fontSize: 12,
                            )),
                      )),
                  Positioned(
                    right: 10.0,
                    bottom: 10.0,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text("B 39,000",
                              style: TextStyle(
                                fontSize: 10,
                              )),
                        ]),
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
      ),
    );
  }
}
