import 'package:blog_app/Constants/Color%20Constant/ColorConstant.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ref = FirebaseDatabase.instance.ref("Blog");
    return Scaffold(
        backgroundColor: App_Colors.app_background_color,
        body: Column(children: [
          Expanded(
              child: StreamBuilder(
                  stream: ref.onValue,
                  builder: (
                    context,
                    AsyncSnapshot<DatabaseEvent> snapshot,
                  ) {
                    try {
                      Map<dynamic, dynamic> map =
                          snapshot.data?.snapshot.value as dynamic;
                      List<dynamic> list = [];
                      list.clear();
                      list = map.values.toList();
                      return ListView.builder(
                        itemCount: snapshot.data!.snapshot.children.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              list[index]["title"],
                              style:
                                  TextStyle(color: Colors.black, fontSize: 40),
                            ),
                            subtitle: Text(
                              list[index]["content"],
                              style:
                                  TextStyle(color: Colors.black, fontSize: 40),
                            ),
                          );
                        },
                      );
                    } catch (e) {
                      return CircularProgressIndicator();
                    }
                  }))
        ]));
  }
}
