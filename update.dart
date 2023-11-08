import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class RealtimeDatabaseUpdate extends StatefulWidget {
  const RealtimeDatabaseUpdate({super.key});

  @override
  State<RealtimeDatabaseUpdate> createState() => _RealtimeDatabaseUpdateState();
}

class _RealtimeDatabaseUpdateState extends State<RealtimeDatabaseUpdate> {
  final DatabaseReference databaseRef =
      FirebaseDatabase.instance.ref().child('testdb');
  @override
  Widget build(BuildContext context) {
    /*  return Scaffold(
        body: SafeArea(
      child: FirebaseAnimatedList(
          query: databaseRef,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            final name = snapshot.value['name'] as String? ?? '';
            final city = snapshot.value['city'] as String? ?? '';

            return ListTile(
              subtitle: Text(name),
              title: Text(city),
            );
          }),
    )
    );
    */
    
    return Scaffold(
      body: SafeArea(
        child: FirebaseAnimatedList(
          query: databaseRef,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            if (snapshot.value is Map) {
              final Map<dynamic, dynamic> dataMap =
                  snapshot.value as Map<dynamic, dynamic>;
              final String name = dataMap['name'] as String? ?? '';
              final String city = dataMap['city'] as String? ?? '';
              final String age = dataMap['age'] as String? ?? '';

              return ListTile(
                subtitle: Text(name),
                title: Text(city + "\t" + age),
                trailing: IconButton(
                  onPressed: () {
                    updateDialog(name, city, age, context, snapshot.key);

                    // updateDialog(snapshot.value['name'], snapshot.value['city'],
                    //     context, snapshot.key);
                  },
                  icon: const Icon(Icons.edit),
                ),
              );
            } else {
              // Handle if the data is not in the expected format
              return const ListTile(
                subtitle: Text('Data Format error'),
                title: Text('Data format error'),
              );
            }
          },
        ),
      ),
    );
  
  }


  Future<void> updateDialog(
      String name, String city, String age, BuildContext context, var key) {
    var nameController = TextEditingController(text: name);
    var cityController = TextEditingController(text: city);
    var ageController = TextEditingController(text: age);
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Update Value"),
            content: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(), labelText: "Name"),
                ),
                TextFormField(
                  controller: cityController,
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(), labelText: "city"),
                ),
                TextFormField(
                  controller: ageController,
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(), labelText: "age"),
                ),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    UpdateData(nameController.text, cityController.text,
                        ageController.text, key);
                    Navigator.of(context).pop();
                  },
                  child: const Text("Update")),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Cancel")),
            ],
          );
        });
  }

  void UpdateData(String name, String city, String age, var key) {
    Map<String, String> x = {"name": name, "city": city, "age": age};
    databaseRef.child(key).update(x);
  }


}
