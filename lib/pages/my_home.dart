import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_network/pages/bloc/offices_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<OfficesBloc, OfficesState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is LoadedState) {
            return ListView.builder(
              itemCount: state.officesList.offices?.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text('${state.officesList.offices?[index].name}'),
                    subtitle:
                        Text('${state.officesList.offices?[index].address}'),
                    leading: Image.network(
                        '${state.officesList.offices?[index].image}'),
                  ),
                );
              },
            );
          }
          if (state is FailureState) {
            return Center(
              child: Text(state.exception.toString()),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
