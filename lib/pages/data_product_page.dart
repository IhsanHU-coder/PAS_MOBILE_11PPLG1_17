import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_17/controller/data_product_controller.dart';


class DataProductPage extends StatelessWidget {
  DataProductPage({super.key});
  final DataProductController controller = Get.find<DataProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Data Product Page"),),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Obx((){
          if(controller.isLoading.value){
            return Center(child: CircularProgressIndicator(),);
          }
          return RefreshIndicator(
            onRefresh: (){
              return controller.fetchDataProduct();
            },
            
            child: ListView.builder(
              itemCount: controller.dataProducts.length,
              itemBuilder: (context, index){
                final data = controller.dataProducts[index];
                return Card(child: ListTile(
                  leading: CircleAvatar(backgroundImage: NetworkImage(data.image),),
                  // trailing: Text(dog.intPoints),
                  title: Text("Id " + data.id.toString() + ", Name: " + data.title),
                  subtitle: Text(data.description),),);
              }),
          );
        }
        )
      ),
    );
  }
}