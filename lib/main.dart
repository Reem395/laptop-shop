// @dart=2.7
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:magdsoft_flutter_structure/business_logic/bloc_observer.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/business_logic/products_cubit/products_cubit.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/local/cache_helper.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/remote/dio_helper.dart';
import 'package:magdsoft_flutter_structure/presentation/router/app_router.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';

import 'business_logic/login_cubit/login_cubit.dart';

// late LocalizationDelegate delegate;
/** To run LocalHost type: json-server --host 192.168.100.10:3000 api.json
 */
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  BlocOverrides.runZoned(
    () async {
      DioHelper.init();
      await CacheHelper.init();
      // final locale =
      //     CacheHelper.getDataFromSharedPreference(key: 'language') ?? "ar";
      // delegate = await LocalizationDelegate.create(
      //   fallbackLocale: locale,
      //   supportedLocales: ['ar', 'en'],
      // );
      // await delegate.changeLocale(Locale(locale));
      runApp(MyApp(
        appRouter: AppRouter(),
      ));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatefulWidget {
  final AppRouter appRouter;

  const MyApp({
    // required this.appRouter,
    this.appRouter,
    Key key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // @override
  // void initState() {
  //   super.initState();
  //   Intl.defaultLocale = delegate.currentLocale.languageCode;

  //   delegate.onLocaleChanged = (Locale value) async {
  //     try {
  //       setState(() {
  //         Intl.defaultLocale = value.languageCode;
  //       });
  //     } catch (e) {
  //       showToast(e.toString());
  //     }
  //   };
  // }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: ((context) => GlobalCubit()),),
        BlocProvider(create: ((context) => ProductsCubit()),),
        BlocProvider(create: ((context) => LoginCubit()),),
      ],
      child: BlocConsumer<GlobalCubit, GlobalState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Sizer(
              builder: (context, orientation, deviceType) {
                // return LocalizedApp(
                //   delegate,
                //   LayoutBuilder(builder: (context, constraints) {
                // return Sizer(
                //   builder: (BuildContext context, Orientation orientation,
                //       DeviceType deviceType) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Werash',
                  // localizationsDelegates: [
                  //   GlobalCupertinoLocalizations.delegate,
                  //   DefaultCupertinoLocalizations.delegate,
                  //   GlobalMaterialLocalizations.delegate,
                  //   GlobalWidgetsLocalizations.delegate,
                  //   delegate,
                  // ],
                  // locale: delegate.currentLocale,
                  // supportedLocales: delegate.supportedLocales,
                  onGenerateRoute: widget.appRouter.onGenerateRoute,
                  theme: ThemeData(
                    fontFamily: 'Inter',
                    /**original comment */
                    //scaffoldBackgroundColor: AppColors.white,
                    appBarTheme: const AppBarTheme(
                      elevation: 0.0,
                      systemOverlayStyle: SystemUiOverlayStyle(
                        /**original comment */
                        //statusBarColor: AppColors.transparent,
                        statusBarIconBrightness: Brightness.dark,
                      ),
                    ),
                  ),
                );
              },
            );
          }),
    );
    // },
    // );
    // },
    // ),
    // );
  }
}
