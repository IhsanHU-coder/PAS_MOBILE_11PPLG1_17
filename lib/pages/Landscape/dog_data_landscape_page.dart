import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_17/controller/dog_data_controller.dart';


class DogDataLandscapePage extends StatelessWidget {
  DogDataLandscapePage({super.key});
  final controller = Get.find<DogDataController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Data Dog Table Landscape"),),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Obx((){
          if(controller.isLoading.value){
            return Center(child: CircularProgressIndicator(),);
          }
          return RefreshIndicator(
            onRefresh: (){
              return controller.fetchDogData();
            },
            
            child: ListView.builder(
              itemCount: controller.dogs.length,
              itemBuilder: (context, index){
                final dog = controller.dogs[index];
                return Card(child: ListTile(
                  // leading: CircleAvatar(backgroundImage: NetworkImage(dog.attributes.imgUrl),),
                  // trailing: Text(dog.intPoints),
                  title: Text("Id " + dog.id + ", Name: " + dog.attributes.name + 
                  ", Life: " + dog.attributes.life.max.toString()),
                  subtitle: Text(dog.attributes.description.toString()),),);
              }),
          );
        }
        )
      ),
    );
  }
}