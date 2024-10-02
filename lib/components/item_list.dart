import 'package:flutter/material.dart';
import 'package:pks3/pages/product_detail.dart';

class ItemList extends StatelessWidget {
  final String title;
  final String description;
  final String fullDescription;
  final String productUrl;
  final String img;
  final VoidCallback onRemove;

  const ItemList({
    super.key,
    required this.title,
    required this.description,
    required this.fullDescription,
    required this.productUrl,
    required this.img,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(  // Используем Stack для наложения элементов
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailPage(
                    title: title,
                    description: description,
                    fullDescription: fullDescription,
                    productUrl: productUrl,
                    img: img,
                  ),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.38,
              color: const Color.fromARGB(255, 52, 149, 234),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      color: const Color.fromARGB(222, 253, 252, 252),
                      width: double.infinity,
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        title,
                        style: const TextStyle(color: Colors.black, fontSize: 24),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: Container(
                      color: Colors.blueAccent,
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        description,
                        style: const TextStyle(color: Colors.white, fontSize: 16),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.red),
              onPressed: onRemove,  // Вызываем callback для удаления
            ),
          ),
        ],
      ),
    );
  }
}
