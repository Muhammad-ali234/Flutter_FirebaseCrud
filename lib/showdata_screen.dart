import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:com.firebase_crud.flutter_application_1/database_services.dart';
import 'package:com.firebase_crud.flutter_application_1/editpage_screen.dart';
import 'package:com.firebase_crud.flutter_application_1/adddata_screen.dart';
import 'package:flutter/material.dart';

class ShowData extends StatefulWidget {
  const ShowData({super.key});

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  // ignore: non_constant_identifier_names
  Navigation(BuildContext context, Widget pagename) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => pagename));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Show Data",
          ),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (() {
            Navigation(context, const LoginScreen());
          }),
          child: const Icon(Icons.add),
        ),
        body: StreamBuilder(
            stream: firebaseFirestore.collection('notes').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      //create variable to easily add the respose of firebase
                      final res = snapshot.data!.docs[index];
                      return Dismissible(
                        key: UniqueKey(),

                        //delete data from firebase
                        onDismissed: (v) {
                          DataBaseServices.delete(res.id);
                        },
                        background: const Icon(Icons.delete),
                        child: Card(
                          color: Colors.blue,
                          child: ExpansionTile(
                            collapsedIconColor: Colors.white,

                            leading: IconButton(
                                onPressed: () {
                                  Navigation(
                                      context,
                                      EditScreen(
                                        id: res.id,
                                        title: res['title'],
                                        detail: res['detail'],
                                      ));
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                )),
                            //show data in firbase
                            title: Text(
                              "${res['title']}",
                              style: const TextStyle(color: Colors.white),
                            ),
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("${res['detail']}",
                                    style:
                                        const TextStyle(color: Colors.white)),
                              )
                            ],
                          ),
                        ),
                      );
                    });
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
