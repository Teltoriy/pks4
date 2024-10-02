import 'package:flutter/material.dart';
import 'package:pks3/pages/product_detail.dart';

class ItemList extends StatelessWidget {
  final String title;
  final String description;
  final String fullDescription;
  final String productUrl;
  final String img;

  const ItemList({
    super.key,
    required this.title,
    required this.description,
    required this.fullDescription,
    required this.productUrl,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
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
            mainAxisAlignment: MainAxisAlignment.center, // Центрируем по вертикали
            crossAxisAlignment: CrossAxisAlignment.center, // Центрируем по горизонтали
            children: [
              // Название в самом верху
              Center(
                child: Container(
                  color: const Color.fromARGB(222, 253, 252, 252),
                  width: double.infinity,
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    style: const TextStyle(color: Colors.black, fontSize: 24),
                    textAlign: TextAlign.center, // Выравниваем текст по центру
                  ),
                ),
              ),
              const SizedBox(height: 8),

              // Описание ниже названия
              Center(
                child: Container(
                  color: Colors.blueAccent,
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    description,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                    textAlign: TextAlign.center, // Выравниваем текст по центру
                    overflow: TextOverflow.visible, // Убедимся, что текст не обрезается
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
