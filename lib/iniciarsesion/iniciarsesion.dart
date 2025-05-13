import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:front_medizin/iniciarsesion/infrastructure/datasources/auth_datasources_impl.dart';
import 'package:front_medizin/Inicio/config/helpers/app_router.dart';
import 'package:front_medizin/Inicio/config/theme/app_theme.dart';
import 'package:front_medizin/iniciarsesion/domain/datasources/auth_datasource.dart';
import 'package:front_medizin/iniciarsesion/domain/repositories/auth_repository.dart';
import 'package:front_medizin/iniciarsesion/infrastructure/repositories/auth_repository_impl.dart';
import 'package:front_medizin/iniciarsesion/presentation/providers/auth_provider.dart';



void main() {
  runApp(const IniciarSesion());
}

class IniciarSesion extends StatelessWidget {
  const IniciarSesion({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
     providers: [
        // Primero provee el DataSource como AuthDataSource (interfaz)
       Provider<AuthDataSource>(
          create:
              (_) =>
                  AuthDataSourceImpl(), // Proveemos la implementación concreta
        ),
        // Luego el Repository que depende de la interfaz
        Provider<AuthRepository>(
          create:
              (context) => AuthRepositoryImpl(
                context.read<AuthDataSource>(), // <-- Obtiene la implementación
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
        initialRoute: AppRouter.login,
        onGenerateRoute: AppRouter.generateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
