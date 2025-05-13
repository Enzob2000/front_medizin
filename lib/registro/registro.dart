import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:front_medizin/Inicio/config/helpers/app_router.dart';
import 'package:front_medizin/registro/config/theme/app_theme.dart';
import 'package:front_medizin/registro/domain/datasources/auth_datasource.dart';
import 'package:front_medizin/registro/domain/repositories/auth_repository.dart';
import 'package:front_medizin/registro/domain/usecases/register_user.dart';
import 'package:front_medizin/registro/infrastructure/datasources/auth_datasource_impl.dart';
import 'package:front_medizin/registro/infrastructure/repositories/auth_repository_impl.dart';
import 'package:front_medizin/registro/presentation/providers/auth_provider.dart';

void main() {
  runApp(const InicioScreen());
}

class InicioScreen extends StatelessWidget {
  const InicioScreen({super.key});

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
                context.read<AuthDataSource>(), // <-- Obtiene la implementación
              ),
        ),
        ChangeNotifierProvider(
          create:
              (context) =>
                  AuthProvider(RegisterUser(context.read<AuthRepository>())),
        ),
      ],
      child: MaterialApp(
        title: 'Medizin App',
        theme: AppTheme.lightTheme,
        initialRoute: AppRouter.register,
        onGenerateRoute: AppRouter.generateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
