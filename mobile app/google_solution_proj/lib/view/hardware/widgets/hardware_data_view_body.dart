import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class HardwareViewBody extends StatelessWidget {
  const HardwareViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    final ref = FirebaseDatabase.instance.ref('Sensors');
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            FirebaseAnimatedList(
                query: ref,
                itemBuilder: (context, snapshot, animation, index) {
                  return ListTile(
                    title: Text(snapshot.child('Humidity').value.toString()),
                    subtitle:
                        Text(snapshot.child('Temperature').value.toString()),
                  );
                })
          ],
        ),
      ),
    );
  }
}
