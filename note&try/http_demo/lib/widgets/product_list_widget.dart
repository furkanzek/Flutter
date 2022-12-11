import 'package:flutter/material.dart';
import 'package:http_demo/models/product.dart';

class ProductListWidget extends StatefulWidget {
  late List<Product> products = <Product>[];

  ProductListWidget(List<Product> products) {
    this.products = products;
  }

  @override
  State<ProductListWidget> createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<ProductListWidget> {
  @override
  Widget build(BuildContext context) {
    return buildProductList(context);
  }

  Widget buildProductList(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 15.0,
        ),
        SizedBox(
          height: 500.0,
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(
              widget.products.length,
              (index) {
                return Text(widget.products[index].productName);
              },
            ),
          ),
        ),
      ],
    );
  }
}
