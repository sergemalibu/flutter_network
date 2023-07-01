import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_network/pages/bloc/offices_bloc.dart';
import 'package:flutter_network/pages/my_home.dart';
import 'package:flutter_network/repositories/abstract_offices_repository.dart';
import 'package:flutter_network/repositories/offices_repository.dart';
import 'package:get_it/get_it.dart';

void main() {
  GetIt.I.registerSingleton<AbstractOfficesRepository>(
      OfficesRepository(dio: Dio()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OfficesBloc()..add(FetchOfficesEvent()),
      child: MaterialApp(
        theme: ThemeData(),
        home: const MyHomePage(),
      ),
    );
  }
}
