import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddData extends StatefulWidget{
  @override
  _AddDataState createState() => new _AddDataState();

}

class _AddDataState extends State<AddData> {

  TextEditingController controllerCode  = TextEditingController();
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerPrice  = TextEditingController();
  TextEditingController controllerStock  = TextEditingController();

  void addData(){
      var url = "http://192.168.137.208/flutterserver/rest-api/adddata.php";
      http.post(url,body: {
        "itemcode":controllerCode.text,
        "itemname":controllerName.text,
        "price":controllerPrice.text,
        "stock":controllerStock.text
      });
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title:  new Text("Add Data"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerCode,
                  decoration: new InputDecoration(
                    hintText: "Item Code",labelText: "Item Code"
                  ),
                ),
                new TextField(
                  controller: controllerName,
                  decoration: new InputDecoration(
                    hintText: "Item name",labelText: "Item Name"
                  ),
                ),
                new TextField(
                  controller: controllerPrice,
                  decoration: new InputDecoration(
                    hintText: "Item Price" ,labelText: "Item Price"
                  ),
                ),
                new TextField(
                  controller: controllerStock,
                  decoration: new InputDecoration(
                    hintText: "Stock",labelText: "Stock"),
                  ),
                new Padding(padding: const EdgeInsets.all(10.0),),
                new RaisedButton(
                  child: new Text("Add Data"),
                    color: Colors.blueAccent,
                    onPressed: (){
                      addData();
                      Navigator.pop(context);
                    }
                )
              ],
            )
          ],
        ),
      ),
    );
  }

}

