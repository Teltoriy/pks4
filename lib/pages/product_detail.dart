import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductDetailPage extends StatelessWidget {
  final String title;
  final String description;
  final String fullDescription;
  final String productUrl;
  final String img;

  const ProductDetailPage({
    super.key,
    required this.title,
    required this.description,
    required this.fullDescription,
    required this.productUrl,
    required this.img,
  });

  Future<void> _launchUrl() async {
    final Uri url = Uri.parse(productUrl);
    if (!await launchUrl(url)) {
      throw 'Не работает твоя ссылка ツ $productUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              description,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              fullDescription,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Center(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  double screenWidth = constraints.maxWidth;
                  double adaptiveHeight = screenWidth * 0.25;

                  return Image.network(
                    img,
                    height: adaptiveHeight,
                    width: screenWidth,
                    fit: BoxFit.contain,
                  );
                },
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: _launchUrl,
                child: const Text('Перейти на сайт'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
