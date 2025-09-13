import 'package:dvp_prueba_tecnica/config/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'atomic_design/protons/colors.dart';
import 'atomic_design/protons/typography.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: 'User Management App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary500,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: AppTypography.fontFamily,
        scaffoldBackgroundColor: AppColors.backgroundPrimary,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.white,
          foregroundColor: AppColors.neutral900,
          elevation: 0,
          titleTextStyle: AppTypography.heading3,
          centerTitle: true,
        ),
      ),
      routerConfig: router,
    );
  }
}
