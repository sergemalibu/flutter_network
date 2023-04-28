import 'package:flutter/material.dart';
import 'package:flutter_network/models/user.dart';
import 'package:flutter_network/services/user_repository.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

Future<OfficesList>? officessList;

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    officessList = OfficesRepository.getOfficesList();
    setState(() {});
    super.initState();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(title: const Text('JSON Serialization')),
      body: FutureBuilder<OfficesList>(
        future: officessList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.offices!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text('${snapshot.data?.offices?[index].name}'),
                      subtitle:
                          Text('${snapshot.data?.offices?[index].address}'),
                      leading: Image.network(
                          '${snapshot.data?.offices?[index].image}'),
                      isThreeLine: true,
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            return const Text('Error');
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
