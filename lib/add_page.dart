import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddPage extends StatelessWidget {
  AddPage({super.key});

  String first = '';
  String last = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'First',
              ),
              onChanged: (text) {
                first = text;
              },
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Last',
              ),
              onChanged: (text) {
                //TODO:ここで取得したtextを使う
                last = text;
              },
            ),
            ElevatedButton(
              onPressed: () async {
                await _addToFirebase();
                Navigator.pop(context);
              },
              child: const Text('追加する'),
            )
          ],
        ),
      ),
    );
  }

  Future _addToFirebase() async {
    final db = FirebaseFirestore.instance;

    final user = <String, dynamic>{
      "first": first,
      "last": last,
      "born": 1815,
    };

    await db.collection("users").add(user);
  }
}
