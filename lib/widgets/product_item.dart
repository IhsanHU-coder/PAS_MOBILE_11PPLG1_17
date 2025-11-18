import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_17/controller/favorite_controller.dart';
import 'package:pas_mobile_11pplg1_17/models/DataProduct.dart';

class ProductItem extends StatelessWidget {
  final DataProduct product;
  final int index; // used to vary height to simulate masonry

  ProductItem({required this.product, required this.index});

  final favoriteC = Get.find<FavoriteController>();

  double _imageHeight() {
    // Vary the height based on index to mimic Pinterest masonry
    final base = 160.0;
    final extra = (index % 3) * 40.0; // 0,40,80
    return base + extra;
  }

  @override
  Widget build(BuildContext context) {
    final imgHeight = _imageHeight();

    return GestureDetector(
      onTap: () {
        // Optional: navigate to detail page later
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, 6),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
              child: Image.network(
                product.image,
                height: imgHeight,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 8),
              child: Text(
                product.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${product.price.toStringAsFixed(2)}",
                    style: TextStyle(
                      color: Colors.blue.shade800,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Obx(() {
                    final isFav = favoriteC.isFavorite(product.id);
                    return GestureDetector(
                      onTap: () => favoriteC.toggleFavorite(product),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: isFav ? Colors.blue.shade700 : Colors.blue.shade50,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          isFav ? Icons.bookmark : Icons.add,
                          color: isFav ? Colors.white : Colors.blue.shade700,
                          size: 18,
                        ),
                      ),
                    );
                  })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
