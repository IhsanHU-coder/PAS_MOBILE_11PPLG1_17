
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:pas_mobile_11pplg1_17/controller/contact_controller.dart';
// import 'package:pas_mobile_11pplg1_17/widgets/widget_textfield.dart';

// class ContactPage extends GetView<ContactController> {
//   const ContactPage({Key? key}) : super(key: key);

//   void _showUpdateDialog(BuildContext context, String oldName) {
//     final TextEditingController updateController =
//         TextEditingController(text: oldName);

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(16),
//           ),
//           title: const Text("Update Contact"),
//           content: TextField(
//             controller: updateController,
//             decoration: const InputDecoration(
//               border: OutlineInputBorder(),
//               labelText: "New Name",
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text("Cancel"),
//             ),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blueAccent,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               onPressed: () async {
//                 // await Get.find<ContactController>()
//                 //     .updateName2(oldName, updateController.text);

//                 Navigator.pop(context);

//                 // SnackBar untuk info update
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     content: Text('${updateController.text} updated'),
//                     backgroundColor: Colors.green,
//                     behavior: SnackBarBehavior.floating,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                 );
//               },
//               child: const Text("Update"),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF7F8FA),
//       appBar: AppBar(
//         title: const Text(
//           "Contact Name",
//           style: TextStyle(fontWeight: FontWeight.w600),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.blueAccent,
//         elevation: 0,
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(
//             bottom: Radius.circular(20),
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Card(
//               elevation: 3,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: CustomField(
//                         textEditingController: controller.nameController,
//                         labelText: "Input Name",
//                         hintText: "Enter name",
//                         obscureText: false,
//                       ),
//                     ),
//                     const SizedBox(width: 8),
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blueAccent,
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 20, vertical: 14),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                       onPressed: controller.addName,
//                       child: const Text(
//                         "Save",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),
//             Expanded(
//               child: Obx(
//                 () => ListView.builder(
//                   itemCount: controller.names.length,
//                   itemBuilder: (context, index) {
//                     final name = controller.names[index];
//                     return Dismissible(
//                       key: Key(name),
//                       direction: DismissDirection.startToEnd,
//                       background: Container(
//                         decoration: BoxDecoration(
//                           color: Colors.redAccent,
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         alignment: Alignment.centerLeft,
//                         padding: const EdgeInsets.only(left: 20),
//                         child: const Icon(Icons.delete, color: Colors.white),
//                       ),
//                       onDismissed: (direction) async {
//                         await controller.deleteName(name);
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text('$name deleted'),
//                             backgroundColor: Colors.redAccent,
//                             behavior: SnackBarBehavior.floating,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                           ),
//                         );
//                       },
//                       child: Card(
//                         margin: const EdgeInsets.symmetric(vertical: 6),
//                         elevation: 2,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: ListTile(
//                           contentPadding: const EdgeInsets.symmetric(
//                               horizontal: 16, vertical: 10),
//                           title: Text(
//                             name,
//                             style: const TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                           trailing: IconButton(
//                             icon: const Icon(Icons.edit, color: Colors.blue),
//                             onPressed: () => _showUpdateDialog(context, name),
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
