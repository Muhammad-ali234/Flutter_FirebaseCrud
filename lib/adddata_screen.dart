import 'package:com.firebase_crud.flutter_application_1/database_services.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //controller
  TextEditingController titleC = TextEditingController();
  TextEditingController detailC = TextEditingController();

  //validation key
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Data"),
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
                      return "Please Enter a Title";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: "Enter title",
                    border: OutlineInputBorder(),
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
                      return "Please Enter Detail";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: "Enter Detail",
                    border: OutlineInputBorder(),
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
                      DataBaseServices.addData(titleC.text, detailC.text);
                      titleC.clear();
                      detailC.clear();
                    },
                    child: const Text("Add"))
              ],
            ),
          ),
        )));
  }
}
