import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_17/controller/data_product_controller.dart';
import 'package:pas_mobile_11pplg1_17/widgets/product_item.dart';

class DataProductPage extends StatelessWidget {
  DataProductPage({super.key});
  final DataProductController controller = Get.find<DataProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          final products = controller.dataProducts;

          // Responsive column count
          final width = MediaQuery.of(context).size.width;
          final crossAxisCount = width > 900 ? 4 : (width > 600 ? 3 : 2);

          return RefreshIndicator(
            onRefresh: () => controller.fetchDataProduct(),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.62,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final data = products[index];
                return ProductItem(product: data, index: index);
              },
            ),
          );
        }),
      ),
    );
  }
}
