import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'bloc/bloc.dart';
import 'ui/pages/pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: null,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => PageBloc(OnInitialPage())),
        ],
        child: MaterialApp(debugShowCheckedModeBanner: false, home: Wrapper()),
      ),
    );
  }
}
