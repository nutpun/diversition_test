import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ข้อมูลสินค้า"),
      ),
      body: Column(
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
                      "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/iphone-11-pro-select-2019-family?wid=882&amp;hei=1058&amp;fmt=jpeg&amp;qlt=80&amp;op_usm=0.5,0.5&amp;.v=1567812930312",
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
                          style: TextStyle(fontSize: 10, color: Colors.white))),
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
                      "ต้นรถบ้านการ์เด้น",
                      style: TextStyle(fontSize: 10, color: Colors.blue),
                    ),
                    VerticalDivider(
                      width: 55,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.location_on, size: 18, color: Colors.blue),
                        Text("ภาคอีสาน » สกลนคร » อำเภอเมืองสกลนคร",
                            style: TextStyle(fontSize: 10, color: Colors.blue)),
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
                    Text("จำนวนโพสต์ 500 คัน", style: TextStyle(fontSize: 10)),
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
      ),
    );
  }
}
