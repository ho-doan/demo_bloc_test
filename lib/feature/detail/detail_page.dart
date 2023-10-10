import 'package:bloc_ffff/core/services/dependency_injection/service_locator.dart';
import 'package:bloc_ffff/feature/detail/cubit/detail_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/data/models/entry.dart';

Widget detailPage(EntryModel? entry) {
  return BlocProvider(
    create: (context) => getIt<DetailCubit>(param1: entry),
    child: const DetailPage(),
  );
}

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Widget buildBody(DetailState detailState) {
    switch (detailState) {
      case DetailInitial():
      case DetailLoading():
        return const Center(
          child: CircularProgressIndicator(),
        );
      case DetailFailure():
        return Center(
          child: Text('error ${detailState.error}'),
        );
      case DetailSuccess():
        return Center(
          child: Text(detailState.entry.aPI ?? 'NONE'),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailCubit, DetailState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Detail'),
          ),
          body: buildBody(state),
        );
      },
    );
  }
}
