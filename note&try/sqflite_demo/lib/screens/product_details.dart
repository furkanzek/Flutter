import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sqflite_demo/data/dbHelper.dart';
import 'package:sqflite_demo/models/product.dart';

class ProductDetail extends StatefulWidget {
  Product product;
  ProductDetail(this.product);

  @override
  State<ProductDetail> createState() => _ProductDetailState(product);
}

enum Options { delete, update }

class _ProductDetailState extends State<ProductDetail> {
  Product product;
  _ProductDetailState(this.product);
  var dbHelper = DbHelper();
  var txtName = TextEditingController();
  var txtDescription = TextEditingController();
  var txtPrice = TextEditingController();

  @override
  void initState() {
    txtName.text = product.name;
    txtDescription.text = product.description;
    txtPrice.text = product.price.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Ürün detayı: ${product.name}"),
        actions: [
          PopupMenuButton<Options>(
            onSelected: selectProcess,
            itemBuilder: (BuildContext context) => <PopupMenuEntry<Options>>[
              PopupMenuItem<Options>(
                child: Text("Sil"),
                value: Options.delete,
              ),
              PopupMenuItem<Options>(
                child: Text("Güncelle"),
                value: Options.update,
              )
            ],
          )
        ],
      ),
      body: buildProductDetail(),
    );
  }

  buildProductDetail() {
    return Padding(
      padding: EdgeInsets.all(30.0),
      child: Column(
        children: [
          buildNameField(),
          buildDescriptionField(),
          buildPriceField(),
        ],
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

  selectProcess(Options options) async {
    switch (options) {
      case Options.delete:
        await dbHelper.delete(product.id!);
        Navigator.pop(context, true);
        break;
      case Options.update:
        await dbHelper.update(Product.withId(
            id: product.id,
            name: txtName.text,
            description: txtDescription.text,
            price: double.tryParse(txtPrice.text)!));
        Navigator.pop(context, true);
        break;
      default:
    }
  }
}
