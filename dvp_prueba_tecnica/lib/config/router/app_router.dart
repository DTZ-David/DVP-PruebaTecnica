import 'package:dvp_prueba_tecnica/ui/screens/home_screen.dart';
import 'package:dvp_prueba_tecnica/ui/screens/user_form_screen.dart';
import 'package:dvp_prueba_tecnica/ui/screens/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../ui/screens/address_form_screen.dart';
// Agrega aquí tus otros imports de pantallas

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(Ref ref) {
  return GoRouter(
    initialLocation: '/',
    errorBuilder: (context, state) {
      return Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              Text('Error: ${state.error}'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => context.go('/'),
                child: const Text('Ir al inicio'),
              ),
            ],
          ),
        ),
      );
    },
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/user_form',
        name: 'user-form',
        builder: (context, state) => const UserFormScreen(),
      ),
      GoRoute(
        path: '/address-form',
        name: 'address-form',
        builder: (context, state) => const AddressFormScreen(),
      ),
      // MEJORA: Agregar ruta de perfil que mencionas en el código
      GoRoute(
        path: '/profile',
        name: 'profile',
        builder: (context, state) => const UserProfileScreen(),
      ),
    ],
  );
}
