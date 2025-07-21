import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'providers/coffee_shop_provider.dart';
import 'screens/map_screen.dart';

void main() {
  runApp(const AppRoot());
}

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      routes: [
        GoRoute(path: '/', builder: (context, state) => const MapScreen()),
      ],
    );
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => CoffeeShopProvider())],
      child: MaterialApp.router(
        title: 'SIG Kopi Temanggung',
        theme: ThemeData(
          colorScheme: ColorScheme.light(
            primary: Colors.blue[800]!,
            secondary: Colors.blueAccent,
            surface: Colors.grey[100]!,
          ),
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'Inter',
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 0,
            titleTextStyle: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
        routerConfig: router,
      ),
    );
  }
}
