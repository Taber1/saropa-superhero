import 'package:flutter/material.dart';
import 'package:saropa_task/app/app.locator.dart';
import 'package:saropa_task/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:provider/provider.dart';
import 'provider/theme_provider.dart';
import 'utils/storage/local_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.initialize();
  await setupLocator();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'Voxstar',
            debugShowCheckedModeBanner: false,
            theme: themeProvider.themeData,
            initialRoute: Routes.startupView,
            onGenerateRoute: StackedRouter().onGenerateRoute,
            navigatorKey: StackedService.navigatorKey,
            navigatorObservers: [
              StackedService.routeObserver,
            ],
          );
        },
      ),
    );
  }
}
