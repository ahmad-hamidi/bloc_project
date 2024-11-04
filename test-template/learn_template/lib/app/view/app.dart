import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_template/counter/counter.dart';
import 'package:learn_template/counter/cubit/theme_cubit.dart';
import 'package:learn_template/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    print('build App');
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterCubit(),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
      ],
      child: _buildApp(),
    );
  }

  Widget _buildApp() {
    print('build _buildApp');

    return BlocBuilder<ThemeCubit, Brightness>(
      builder: (context, state) {
        return MaterialApp(
          theme: ThemeData(
            brightness: state,
            appBarTheme: AppBarTheme(
              backgroundColor: Theme
                  .of(context)
                  .colorScheme
                  .inversePrimary,
            ),
            useMaterial3: true,
          ),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const CounterPage(),
        );
      },
    );
  }
}
