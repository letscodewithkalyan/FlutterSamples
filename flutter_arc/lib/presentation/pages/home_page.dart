import 'package:flutter/material.dart';
import 'package:flutter_arc/data/datasources/fakeapi_datasource/fakeapi.dart';
import 'package:flutter_arc/data/models/user_model.dart';
import 'package:flutter_arc/presentation/widgets/user_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<UserModel>> _futurePersons;

  @override
  void initState() {
    super.initState();
    _futurePersons = FakeApi().getUsers();
  }

  var count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _futurePersons,
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            final persons = snapshot.data!;
            return ListView.builder(
              itemCount: persons.length,
              itemBuilder: (context, index) {
                return UserCard(user: persons[index]);
              },
            );
          } else {
            return Text("Loading");
          }
        },
      ),
    );
  }
}
