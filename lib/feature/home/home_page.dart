import 'package:bloc_ffff/core/services/dependency_injection/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/home_cubit.dart';

/// Demo
Widget get homeRouter => BlocProvider<HomeCubit>(
      create: (ctx) => getIt<HomeCubit>()..onInit(),
      child: const HomePage(),
    );

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeCubit get cubit => context.read<HomeCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (p, c) => p != c,
      builder: (context, state) => Scaffold(
        body: _buildBody(state),
      ),
    );
  }

  Widget _buildBody(HomeState state) {
    switch (state) {
      case HomeInitial():
      case HomeLoading():
        return const Center(
          child: CircularProgressIndicator(),
        );
      case HomeFailure():
        return Center(
          child: Text(
            state.error,
            textAlign: TextAlign.center,
          ),
        );
      case HomeSuccess():
        return Column(
          children: [
            Builder(builder: (context) {
              return TextButton(
                key: const Key('dialog'),
                onPressed: () => showModalBottomSheet(
                  context: context,
                  builder: (ctx) => HomeBottomSheet(cubit: cubit),
                ),
                child: const Text('dialog'),
              );
            }),
            Expanded(
              child: ListView(
                children: [
                  for (final entry in state.entries.entries)
                    Builder(builder: (context) {
                      return GestureDetector(
                        onTap: () => cubit.onPushDetail(entry),
                        // ref.watch(homeStateNotifierProvider.notifier).delete(
                        //       state.entries.indexOf(entry),
                        //     ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            entry.aPI ?? entry.description ?? 'None',
                          ),
                        ),
                      );
                    }),
                ],
              ),
            ),
          ],
        );
      default:
        return Container();
    }
  }
}

class HomeBottomSheet extends StatelessWidget {
  const HomeBottomSheet({super.key, required this.cubit});

  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: cubit,
      buildWhen: (p, c) => p != c,
      builder: (context, state) {
        return Material(
          child: ListView(
            children: [
              if (state is HomeSuccess)
                for (final entry in state.entries.entries)
                  GestureDetector(
                    key: ObjectKey(entry),
                    onTap: () => cubit.delete(
                      state.entries.entries.indexOf(entry),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        entry.aPI ?? entry.description ?? 'None',
                      ),
                    ),
                  ),
            ],
          ),
        );
      },
    );
  }
}
