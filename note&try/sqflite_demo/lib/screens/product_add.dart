// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sqflite_demo/data/dbHelper.dart';
import 'package:sqflite_demo/models/product.dart';

class ProductAdd extends StatefulWidget {
  const ProductAdd({Key? key}) : super(key: key);

  @override
  State<ProductAdd> createState() => _ProductAddState();
}

class _ProductAddState extends State<ProductAdd> {
  var dbHelper = DbHelper();
  var txtName = TextEditingController();
  var txtDescription = TextEditingController();
  var txtPrice = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ürün Ekleme Sayfası"),
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: [
            buildNameField(),
            buildDescriptionField(),
            buildPriceField(),
            buildSaveButton(),
          ],
        ),
      ),
    );
  }

  buildNameField() {
    return TextField(
      decoration: InputDecoration(labelText: "Ürün adı"),
      controller: txtName,
    );
  }

  buildDescriptionField() {
    return TextField(
      decoration: InputDecoration(labelText: "Ürün açıklaması"),
      controller: txtDescription,
    );
  }

  buildPriceField() {
    return TextField(
      decoration: InputDecoration(labelText: "Ürün fiyatı"),
      controller: txtPrice,
    );
  }

  buildSaveButton() {
    return FlatButton(
        onPressed: () {
          addProduct();
        },
        child: Text("Ekle"));
  }

  void addProduct() async {
    var result = await dbHelper.insert(Product(
        name: txtName.text,
        description: txtDescription.text,
        price: double.tryParse(txtPrice.text)!));
    Navigator.pop(context, true);
  }
}
