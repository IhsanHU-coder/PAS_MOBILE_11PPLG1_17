import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:pas_mobile_11pplg1_17/controller/premiere_table_controller.dart';

class PremiereTablePage extends StatelessWidget {
  PremiereTablePage({super.key});
  final controller = Get.find<PremiereTableController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Premiere League Table"),),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Obx((){
          if(controller.isLoading.value){
            return Center(child: CircularProgressIndicator(),);
          }
          return RefreshIndicator(
            onRefresh: (){
              return controller.fetchPremiereTable();
            },
            
            child: ListView.builder(
              itemCount: controller.standings.length,
              itemBuilder: (context, index){
                final team = controller.standings[index];
                return Card(child: ListTile(
                  leading: CircleAvatar(backgroundImage: NetworkImage(team.strBadge),),
                  trailing: Text(team.intPoints),
                  subtitle: Text("Player " + team.intPlayed + "W " + team.intWin + 
                  "D " + team.intDraw + "L " + team.intLoss),
                  title: Text(team.strTeam.toString()),),);
              }),
          );
        }
        )
      ),
    );
  }
}