import 'package:flutter/material.dart';
import 'package:sasti_pk/res/dummyData/productList.dart';

class Description extends StatefulWidget {
  final int index;
  const Description({super.key, required this.index});

  @override
  State<Description> createState() => _ReviewsState();
}

class _ReviewsState extends State<Description> {
  final List<Map<String, dynamic>> descriptionData = productList.product_list;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Text(
          descriptionData[widget.index]['description'],
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
        ),
      ),
    );
  }
}
