import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'package:two_dos/core/themes/themes.dart';
import 'package:two_dos/data/models/db/todo_db_model.dart';
import 'package:two_dos/logic/cubit/date_picker/date_picker_cubit.dart';
import 'package:two_dos/logic/cubit/theme_picker/theme_picker_cubit.dart';
import 'package:two_dos/presentation/screens/home_screen/home_screen.dart';
import 'presentation/router/app_router.dart';
import 'core/constants/strings.dart';
import 'presentation/screens/home_screen/widgets/progress_indicator.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  final directory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(TodoDbAdapter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DatePickerCubit>(create: (context) => DatePickerCubit()),
        BlocProvider<ThemePickerCubit>(create: (context) => ThemePickerCubit()),
      ],
      child: MaterialApp(
        title: Strings.appTitle,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        initialRoute: AppRouter.home,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Hive.openBox('todo_item'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return ValueListenableBuilder(
                  valueListenable: Hive.box('todo_item').listenable(),
                  builder: (context, _, __) {
                    return TodoListScreen(title: widget.title);
                  });
            }
          } else {
            return const ProgressIndiactor();
          }
        });
  }

  @override
  void dispose() {
    Hive.box('todo_item').close();
    super.dispose();
  }
}
