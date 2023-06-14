// @dart=2.12
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/bloc_observer.dart';
import 'package:magdsoft_flutter_structure/business_logic/products_cubit/products_cubit.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/remote/dio_helper.dart';
import 'package:magdsoft_flutter_structure/presentation/router/app_router.dart';
import 'package:sizer/sizer.dart';

import 'business_logic/login_cubit/login_cubit.dart';

// late LocalizationDelegate delegate;
/// To run LocalHost type: json-server --host 192.168.100.10 api.json

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatefulWidget {
  final AppRouter appRouter;

  const MyApp({
    required this.appRouter,
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          // BlocProvider(
          //   create: ((context) => GlobalCubit()),
          // ),
          BlocProvider(
            create: ((context) => ProductsCubit()),
          ),
          BlocProvider(
            create: ((context) => LoginCubit()),
          ),
        ],
        child: Sizer(
          builder: (context, orientation, deviceType) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              onGenerateRoute: widget.appRouter.onGenerateRoute,
              theme: ThemeData(
                fontFamily: 'Inter',
                appBarTheme: const AppBarTheme(
                  elevation: 0.0,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarIconBrightness: Brightness.dark,
                  ),
                ),
              ),
            );
          },
        ));
  }
}
