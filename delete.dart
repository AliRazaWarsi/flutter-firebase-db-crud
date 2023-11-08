import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class RealtimeDatabaseDelete extends StatefulWidget {
  const RealtimeDatabaseDelete({Key? key}) : super(key: key);

  @override
  State<RealtimeDatabaseDelete> createState() => _RealtimeDatabaseDeleteState();
}

class _RealtimeDatabaseDeleteState extends State<RealtimeDatabaseDelete> {
  final DatabaseReference databaseRef =
      FirebaseDatabase.instance.ref().child('testdb');

  // final databaseRef = FirebaseDatabase.instance.ref().child("users");

  @override
  Widget build(BuildContext context) {
    /*  return Scaffold(
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
                title: Text(city
                    // + "\t" + age
                    ),
                trailing: IconButton(
                  onPressed: () {
                    //  DeleteData(snapshot.key);

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
*/
    /*
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
                title: Text(city + "\t" + age),
                subtitle: Text(name),
                trailing: IconButton(
                  onPressed: () {
                    // Delete the data
                    DeleteData(snapshot.key);
                  },
                  icon: const Icon(Icons.delete),
                ),
              );
            }
            // Handle if the data is not in the expected format
            return const ListTile(
              subtitle: Text('Data Format error'),
              title: Text('Data format error'),
            );
          },
        ),
      ),
    );
 */
    /* return Scaffold(
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
                // + "\t" + age
                title: Text(city),
                trailing: IconButton(
                  onPressed: () {
                    DeleteData(snapshot.key);

                    // updateDialog(snapshot.value['name'], snapshot.value['city'],
                    //     context, snapshot.key);
                  },
                  icon: const Icon(Icons.remove),
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
                    var key = snapshot.key;
                    print("Delete Id :  " + key.toString());

                    DeleteData(key);

                    // updateDialog(name, city, age, context, snapshot.key);
                    // updateDialog(snapshot.value['name'], snapshot.value['city'],
                    //     context, snapshot.key);
                  },
                  icon: const Icon(Icons.delete),
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

  // ignore: non_constant_identifier_names

  void DeleteData(String? key) {
    if (key != null) {
      print("Deleting data with key: $key");
      databaseRef.child(key).remove();
    }
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
