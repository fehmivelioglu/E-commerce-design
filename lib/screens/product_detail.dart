import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProductDetailState();
}

class ProductDetailState extends State with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Product Detail",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: IconButton(
            icon: Icon(
              Icons.chevron_left,
              size: 40.0,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        backgroundColor: Colors.white,
      ),
      body: _buildProductDetails(context),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  _buildProductDetails(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildProductImages(),
              _buildProductTitle(),
              SizedBox(
                height: 12.0,
              ),
              _buildProductPrice(),
              SizedBox(height: 12.0),
              _buildDivider(size),
              SizedBox(
                height: 12.0,
              ),
              _buildFurtherInfo(),
              SizedBox(height: 12.0),
              _buildDivider(size),
              SizedBox(height: 12.0),
              _buildSizeArea(),
              SizedBox(height: 12.0),
              _buildInfo()
            ],
          ),
        )
      ],
    );
  }

  _buildProductImages() {
    TabController imagesController = TabController(length: 3, vsync: this);
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(
        height: 250.0,
        child: Center(
          child: DefaultTabController(
              length: 3,
              child: Stack(
                children: <Widget>[
                  TabBarView(
                    controller: imagesController,
                    children: <Widget>[
                      Image.network(
                          "https://cdn.fullamoda.com/UserFiles/ProductImages/0/17k17nisan0025/orj/kadin-cizgili-kazak-ekru-8708.jpg"),
                      Image.network(
                          "https://cdn.fullamoda.com/UserFiles/ProductImages/0/17k17nisan0025/orj/kadin-cizgili-kazak-bej-9603.jpg"),
                      Image.network(
                          "https://cdn.fullamoda.com/UserFiles/ProductImages/0/17k17nisan0025/orj/kadin-cizgili-kazak-ekru-8707.jpg"),
                    ],
                  ),
                  Container(
                    alignment: FractionalOffset(0.5, 0.95),
                    child: TabPageSelector(
                      controller: imagesController,
                      selectedColor: Colors.grey,
                      color: Colors.white,
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }

  _buildProductTitle() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        child: Center(
            child: Text("Jack Jones Kazak",
                style: TextStyle(fontSize: 16.0, color: Colors.black))));
  }

  _buildProductPrice() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: <Widget>[
          Text(
            "100 TL",
            style: TextStyle(fontSize: 16.0, color: Colors.black),
          ),
          SizedBox(
            width: 8.0,
          ),
          Text(
            "200 TL",
            style: TextStyle(
                fontSize: 12.0,
                color: Colors.grey,
                decoration: TextDecoration.lineThrough),
          ),
          SizedBox(
            width: 8.0,
          ),
          Text(
            "%50 indirim",
            style: TextStyle(fontSize: 12.0, color: Colors.blue),
          ),
          SizedBox(
            width: 8.0,
          ),
        ],
      ),
    );
  }

  _buildDivider(Size screenSize) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.grey,
          width: screenSize.width,
          height: 0.25,
        )
      ],
    );
  }

  _buildFurtherInfo() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.local_offer,
          ),
          SizedBox(width: 12.0),
          Text(
            "Daha fazla bilgi için tıklayınız",
            style: TextStyle(
              color: Colors.blueGrey,
            ),
          )
        ],
      ),
    );
  }

  _buildSizeArea() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.straighten,
                color: Colors.grey,
              ),
              SizedBox(width: 12.0),
              Text(
                "Beden : M",
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
          Row(children: <Widget>[
            Text(
              "Beden tablosu",
              style: TextStyle(fontSize: 12.0, color: Colors.blue),
            )
          ])
        ],
      ),
    );
  }

  _buildInfo() {
    TabController tabController = TabController(length: 2, vsync: this);
    return Container(
      child: Column(
        children: <Widget>[
          TabBar(
            controller: tabController,
            tabs: <Widget>[
              Tab(
                child: Text(
                  "Ürün Bilgisi",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Tab(
                child: Text(
                  "Yıkama Bilgisi",
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
          Container(
            height: 40.0,
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
            child: TabBarView(
              controller: tabController,
              children: <Widget>[
                Text(
                  "%65 pamuk %35 poliester",
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  "30 derece makinede renkli yıkama",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildBottomNavigationBar() {
    return Container(
      // padding: EdgeInsets.only(bottom:20.0),
     width: MediaQuery.of(context).size.width,
     height: 50.0,
     child: Row(
       children: <Widget>[
         Flexible(
           fit: FlexFit.tight, //yapışık olması için
          flex: 1,
          child: RaisedButton(onPressed: (){},color: Colors.grey,child: Row(
            children: <Widget>[
              Icon(Icons.list , color: Colors.white,),
              SizedBox(width:4.0),
              Text("Favorilere Ekle",style: TextStyle(color:Colors.white),)
            ],
          ),),
         ),
         Flexible(
           fit: FlexFit.tight, //yapışık olması için
          flex: 1,
          child: RaisedButton(onPressed: (){},color: Colors.greenAccent,child: Row(
            children: <Widget>[
              Icon(Icons.card_travel  , color: Colors.white,),
              SizedBox(width:4.0),
              Text("Sepete Ekle",style: TextStyle(color:Colors.white),)
            ],
          ),),
         ),
       ],
     ),
    );
  }
}
 