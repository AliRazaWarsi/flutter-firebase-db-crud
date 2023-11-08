import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class RealtimeDatabaseDisplay extends StatefulWidget {
  const RealtimeDatabaseDisplay({Key? key}) : super(key: key);

  @override
  State<RealtimeDatabaseDisplay> createState() =>
      _RealtimeDatabaseDisplayState();
}


class _RealtimeDatabaseDisplayState extends State<RealtimeDatabaseDisplay> {
  // final databaseRef = FirebaseDatabase.instance.reference().child("testdb");

  final databaseRef = FirebaseDatabase.instance.ref().child("testdb");
  List<Map<dynamic, dynamic>> dataList = [];

  @override
  void initState() {
    super.initState();
    // Fetch data from the Firebase Realtime Database when the widget is initialized.
    databaseRef.onValue.listen((event) {
      if (event.snapshot.value != null && event.snapshot.value is Map) {
        setState(() {
          dataList.clear();
          Map<dynamic, dynamic> dataMap =
              event.snapshot.value as Map<dynamic, dynamic>;
          dataMap.forEach((key, value) {
            if (value is Map) {
              dataList.add(value);
            }
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Realtime Database Display'),
      ),
      body: SafeArea(
        child: dataList.isEmpty
            ? const Center(
                child: CircularProgressIndicator()) // Loading indicator
            : ListView.builder(
                itemCount: dataList.length,
                itemBuilder: (context, index) {
                  final data = dataList[index];
                  final name = data['name'] as String;
                  final age = data['age'] as String;
                  final city = data['city'] as String;

                  return ListTile(
                    title: Text('City: $city'),
                    subtitle: Text('Age: $age'),
                    trailing: Text('Name: $name'),
                  );
                },
              ),
      ),
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MaterialApp(
    home: RealtimeDatabaseDisplay(),
  ));
}
