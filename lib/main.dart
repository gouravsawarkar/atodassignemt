import 'dart:io';

import 'package:a_to_d_assignemt/businessLogic/cityIndex/cubit/city_index_cubit.dart';
import 'package:a_to_d_assignemt/businessLogic/cityList/bloc/city_list_bloc.dart';
import 'package:a_to_d_assignemt/businessLogic/forcast/bloc/forcast_bloc.dart';
import 'package:a_to_d_assignemt/businessLogic/liveWeather/bloc/live_weather_bloc.dart';
import 'package:a_to_d_assignemt/businessLogic/login/bloc/login_bloc.dart';
import 'package:a_to_d_assignemt/businessLogic/otherForecast/bloc/other_forecast_bloc.dart';
import 'package:a_to_d_assignemt/businessLogic/signUp/bloc/sign_up_bloc.dart';
import 'package:a_to_d_assignemt/presentation/screens/detailsScreen.dart';
import 'package:a_to_d_assignemt/presentation/screens/home.dart';
import 'package:a_to_d_assignemt/presentation/screens/onboardingScreen.dart';
import 'package:a_to_d_assignemt/presentation/screens/signIn.dart';
import 'package:a_to_d_assignemt/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final pref = await SharedPreferences.getInstance();
  final setHome = pref.getBool('setHome') ?? true;
    HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp(
    setHome: setHome,
  ));
}
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
class MyApp extends StatelessWidget {
  bool setHome;
  MyApp({Key? key, required this.setHome}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppRout route = AppRout();
    return MultiBlocProvider(
        providers: [
          BlocProvider<SignUpBloc>(
            create: (context) => SignUpBloc(),
          ),
          BlocProvider<LoginBloc>(
            create: (context) => LoginBloc(),
          ),
          BlocProvider<CityListBloc>(
            create: (context) => CityListBloc(),
          ),
          BlocProvider<LiveWeatherBloc>(
            create: (context) => LiveWeatherBloc(),
          ),
          BlocProvider<CityIndexCubit>(
            create: (context) => CityIndexCubit(),
          ),
          BlocProvider<ForcastBloc>(
            create: (context) => ForcastBloc(),
          ),
          BlocProvider<OtherForecastBloc>(
            create: (context) => OtherForecastBloc(),
          ),
        ],
        child: MaterialApp(
           debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: this.setHome ? OnBoardingScreens() : LoginPage(),
          onGenerateRoute: route.onGeneratedRout,
        ));
  }
}
