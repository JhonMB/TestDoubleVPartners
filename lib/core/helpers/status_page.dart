import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class StatusPage<S, T extends BlocBase<S>> extends StatelessWidget {
  const StatusPage({Key? key}) : super(key: key);

  T createBloc(BuildContext context);

  initBloc(T bloc) {}

  @override
  Widget build(BuildContext context) {
    return BlocProvider<T>(
      create: (BuildContext context) {
        final bloc = createBloc(context);
        initBloc(bloc);
        return bloc;
      },
      child: BlocBuilder<T, S>(
        builder: (context, state) {
          final bloc = getBloc(context);
          return buildPage(context, state, bloc);
        },
      ),
    );
  }

  Widget buildPage(BuildContext context, S state, T bloc);

  T getBloc(BuildContext context) {
    return context.read<T>();
  }
}
