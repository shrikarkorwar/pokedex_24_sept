import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:pokedex_24_sept/pokedex_riverpod.dart';
import 'package:pokedex_24_sept/providers/theme_providers.dart';
import 'package:pokedex_24_sept/repos/hive_repo.dart';
import 'package:pokedex_24_sept/themes/styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  HiveRepo().registerAdapter();
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerStatefulWidget {
  const MainApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainAppState();
}

class _MainAppState extends ConsumerState<MainApp> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask((){
      ref.read(themeProvider.notifier).getAppTheme();
    });
  }


  @override
  Widget build(BuildContext context) {
    
    final isDarkTheme = ref.watch(themeProvider);
    
    return MaterialApp(
      theme:  Styles.themeData(isDarkTheme: isDarkTheme),
      home: const PokedexRiverpod(),
    );
  }
}

