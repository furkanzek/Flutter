import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sqflite_demo/data/dbHelper.dart';
import 'package:sqflite_demo/models/product.dart';
import 'package:sqflite_demo/screens/product_add.dart';
import 'package:sqflite_demo/screens/product_details.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  var dbHelper = DbHelper();
  late List<Product> products;
  late int productCount = 0;

  @override
  void initState() {
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    getProducts();
    return Scaffold(
      appBar: AppBar(
        title: Text("Ürün Listesi"),
        backgroundColor: Colors.cyan,
      ),
      body: buildProductList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          goToProductAdd();
        },
        backgroundColor: Colors.cyan,
        child: Icon(Icons.add_shopping_cart_rounded),
        tooltip: "Yeni ürün ekle",
      ),
    );
  }

  ListView buildProductList() {
    return ListView.builder(
      itemCount: productCount,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.cyan[100],
          elevation: 3.0,
          child: ListTile(
            leading: CircleAvatar(
                backgroundColor: Colors.black26, child: Text("P.")),
            title: Text(this.products[index].name),
            subtitle: Text(this.products[index].description),
            onTap: () {
              goToDetail(this.products[index]);
            },
          ),
        );
      },
    );
  }

  void goToProductAdd() async {
    bool result = await Navigator.push(
        context, MaterialPageRoute(builder: (contex) => ProductAdd()));
    if (result != null) {
      if (result) {
        getProducts();
      }
    }
  }

  void getProducts() async {
    Future<List<Product>> productsFuture = dbHelper.getProduct();
    productsFuture.then((value) {
      setState(() {
        this.products = value;
        productCount = value.length;
      });
    });
  }

  void goToDetail(Product product) async {
    bool? result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => ProductDetail(product)));
    if (result != null) {
      if (result == true) {
        getProducts();
      }
    }
  }
}
