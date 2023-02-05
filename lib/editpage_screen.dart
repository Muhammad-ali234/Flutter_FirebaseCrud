import 'package:com.firebase_crud.flutter_application_1/showdata_screen.dart';
import 'package:flutter/material.dart';

import 'package:com.firebase_crud.flutter_application_1/database_services.dart';

// ignore: must_be_immutable
class EditScreen extends StatelessWidget {
  String? title;
  String? detail;
  String? id;
  EditScreen({super.key, this.detail, this.title, this.id});

  //controller
  TextEditingController titleC = TextEditingController();

  TextEditingController detailC = TextEditingController();

  //validation key
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Edit Data"),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  maxLines: 1,
                  controller: titleC,
                  validator: (value) {
                    if (value!.isEmpty) {
                      titleC.text = title!;
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "$title",
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  maxLines: 5,
                  minLines: 1,
                  controller: detailC,
                  validator: (value) {
                    if (value!.isEmpty) {
                      detailC.text = detail!;
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "$detail",
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                            const Size(double.infinity, 40))),
                    onPressed: () {
                      if (formkey.currentState!.validate()) {}
                      DataBaseServices.updateData(
                          id!, titleC.text, detailC.text);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const ShowData()));
                    },
                    child: const Text("Update"))
              ],
            ),
          ),
        )));
  }
}
