import 'package:flutter/material.dart';
import 'package:pks3/components/item_list.dart';
import 'package:pks3/components/products.dart';
import 'package:pks3/components/new_product.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

Future<List<Product>> loadProducts() async {
  try {
    final String response = await rootBundle.loadString('assets/products.json');
    final List<dynamic> data = json.decode(response);
    return data.map((item) => Product.fromJson(item)).toList();
  } catch (e) {
    print('Ошибка при загрузке продуктов: $e');
    throw Exception('Ошибка загрузки данных');
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    final loadedProducts = await loadProducts();
    setState(() {
      products = loadedProducts;
    });
  }
  void _removeProduct(int index) {
    setState(() {
      products.removeAt(index);
    });
  }

  void _navigateToAddProduct(BuildContext context) async {
    final newProduct = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddProductScreen()),
    );
    if (newProduct != null) {
      setState(() {
        products.add(newProduct);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Аптечка'),
      ),
      body: products.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          final product = products[index];
          return ItemList(
            title: product.title,
            description: product.description,
            productUrl: product.url,
            fullDescription: product.fullDescription,
            img: product.img,
            onRemove: () => _removeProduct(index),

          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToAddProduct(context),
        child: const Icon(Icons.add),
        tooltip: 'Добавить товар',
      ),
    );
  }
}
