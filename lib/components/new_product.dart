import 'package:flutter/material.dart';
import 'package:pks3/components/products.dart';
class AddProductScreen extends StatefulWidget {
  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _fullDescriptionController = TextEditingController();
  final _imgUrlController = TextEditingController();
  final _urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Добавить товар'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Название'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Описание'),
            ),
            TextField(
              controller: _fullDescriptionController,
              decoration: const InputDecoration(labelText: 'Полное описание'),
            ),
            TextField(
              controller: _imgUrlController,
              decoration: const InputDecoration(labelText: 'URL изображения'),
            ),
            TextField(
              controller: _urlController,
              decoration: const InputDecoration(labelText: 'Ссылка на товар'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final newProduct = Product(
                  title: _titleController.text,
                  description: _descriptionController.text,
                  fullDescription: _fullDescriptionController.text,
                  img: _imgUrlController.text,
                  url: _urlController.text,
                );
                Navigator.pop(context, newProduct);
              },
              child: const Text('Добавить'),
            ),
          ],
        ),
      ),
    );
  }
}