import 'package:flutter/material.dart';
import 'package:front_medizin/Inicio/config/helpers/app_router.dart';
import 'package:front_medizin/Inicio/config/theme/app_theme.dart';
import 'package:front_medizin/Inicio/domain/datasources/auth_datasources.dart';
import 'package:front_medizin/Inicio/domain/repositories/auth_repository.dart';
import 'package:front_medizin/Inicio/infrastructure/datasources/auth_datasources_impl.dart';
import 'package:front_medizin/Inicio/infrastructure/repositories/auth_repository_impl.dart';
import 'package:front_medizin/Inicio/presentation/providers/auth_provider.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(const Inicio());
}

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthDataSource>(
          create:
              (_) =>
                  AuthDataSourceImpl(), // Proveemos la implementación concreta
        ),
        Provider<AuthRepository>(
          create:
              (context) => AuthRepositoryImpl(
                context.read<AuthDataSource>(), // Inyectamos el datasource
              ),
        ),
        ChangeNotifierProvider(
          create:
              (context) => AuthProvider(
                context.read<AuthRepository>(), // Inyectamos el repository
              ),
        ),
      ],
      child: MaterialApp(
        title: 'Medizin App',
        theme: AppTheme.lightTheme,
        initialRoute: AppRouter.welcome,
        onGenerateRoute: AppRouter.generateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
