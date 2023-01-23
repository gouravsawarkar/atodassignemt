import 'package:a_to_d_assignemt/businessLogic/forcast/bloc/forcast_bloc.dart';
import 'package:a_to_d_assignemt/businessLogic/otherForecast/bloc/other_forecast_bloc.dart';
import 'package:a_to_d_assignemt/constants.dart';
import 'package:a_to_d_assignemt/presentation/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final widgets = Widgets();
  final constants = Constants();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [
            Color(0xffff47BFDF),
            Color(0xffff4A91FF),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Stack(
          children: [
            widgets.vector1(MediaQuery.of(context).size.height,
                MediaQuery.of(context).size.width),
            widgets.vector2(MediaQuery.of(context).size.height,
                MediaQuery.of(context).size.width),
            Positioned(
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    Text(
                      'Back',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700,
                          fontSize: 24.0,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
              left: (5 * MediaQuery.of(context).size.width) / 100,
              top: (5.8 * MediaQuery.of(context).size.height) / 100,
            ),
            Positioned(
              child: Container(
                width: (89 * MediaQuery.of(context).size.width) / 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Today',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w900,
                          fontSize: 24.0,
                          color: Colors.white),
                    ),
                    Text(
                      DateFormat("MMM, DD").format(DateTime.now()).toString(),
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700,
                          fontSize: 18.0,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              left: (5.5 * MediaQuery.of(context).size.width) / 100,
              top: (13.9 * MediaQuery.of(context).size.height) / 100,
            ),
            Positioned(
              child: BlocBuilder<ForcastBloc, ForcastState>(
                builder: (context, state) {
                  return state is SmallForecastLoaded
                      ? Container(
                          width: MediaQuery.of(context).size.width,
                          height:
                              (17.2 * MediaQuery.of(context).size.height) / 100,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: state.data.data.length,
                              itemBuilder: (context, index) {
                                var details = state.data.data[index];
                                return Container(
                                  width: (16.9 *
                                          MediaQuery.of(context).size.width) /
                                      100,
                                  height: (17.2 *
                                          MediaQuery.of(context).size.height) /
                                      100,
                                  child: Column(
                                    children: [
                                      Text(
                                        ' ${details.temperature.toString()} °C',
                                        style: TextStyle(
                                            fontFamily: 'Inter',
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 18.0,
                                            color: Colors.white),
                                      ),
                                      Image.asset(
                                        constants.weather[
                                                details.condition.toLowerCase()]
                                            .toString(),
                                      ),
                                      Text(
                                        ' ${details.time.toString()} ',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: 'Inter',
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 18.0,
                                            color: Colors.white),
                                      )
                                    ],
                                  ),
                                );
                              }),
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        );
                },
              ),
              left: (1.9 * MediaQuery.of(context).size.width) / 1008.0,
              top: (23.1 * MediaQuery.of(context).size.height) / 100,
            ),
            Positioned(
              child: Container(
                width: (89 * MediaQuery.of(context).size.width) / 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Next Forecast',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w900,
                          fontSize: 24.0,
                          color: Colors.white),
                    ),
                    Icon(
                      Icons.calendar_today,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              left: (7.2 * MediaQuery.of(context).size.width) / 100,
              top: (46.0 * MediaQuery.of(context).size.height) / 100,
            ),
            Positioned(
              child: BlocBuilder<OtherForecastBloc, OtherForecastState>(
                builder: (context, state) {
                  return state is OtherForecastLoaded
                      ? Container(
                          width:
                              (85.9 * MediaQuery.of(context).size.width) / 100,
                          height:
                              (44 * MediaQuery.of(context).size.height) / 100,
                          child: ListView(
                            children: [
                              Container(
                                height:
                                    (6.6 * MediaQuery.of(context).size.height) /
                                        100,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      ' ${DateFormat("MMM, DD").format(DateTime.now()).toString()}',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18.0,
                                          color: Colors.white),
                                    ),
                                    Image.asset(
                                      constants.weather[state
                                              .data.data.day1.condition
                                              .toLowerCase()]
                                          .toString(),
                                    ),
                                    Text(
                                      ' ${state.data.data.day1.temperature}°C',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18.0,
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height:
                                    (6.6 * MediaQuery.of(context).size.height) /
                                        100,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      ' ${DateFormat("MMM, DD").format(DateTime.now().add(Duration(days: 1))).toString()}',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18.0,
                                          color: Colors.white),
                                    ),
                                    Image.asset(
                                      constants.weather[state
                                              .data.data.day2.condition
                                              .toLowerCase()]
                                          .toString(),
                                    ),
                                    Text(
                                      ' ${state.data.data.day2.temperature}°C',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18.0,
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height:
                                    (6.6 * MediaQuery.of(context).size.height) /
                                        100,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      ' ${DateFormat("MMM, DD").format(DateTime.now().add(Duration(days: 2))).toString()}',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18.0,
                                          color: Colors.white),
                                    ),
                                    Image.asset(
                                      constants.weather[state
                                              .data.data.day3.condition
                                              .toLowerCase()]
                                          .toString(),
                                    ),
                                    Text(
                                      ' ${state.data.data.day3.temperature}°C',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18.0,
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height:
                                    (6.6 * MediaQuery.of(context).size.height) /
                                        100,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      ' ${DateFormat("MMM, DD").format(DateTime.now().add(Duration(days: 3))).toString()}',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18.0,
                                          color: Colors.white),
                                    ),
                                    Image.asset(
                                      constants.weather[state
                                              .data.data.day4.condition
                                              .toLowerCase()]
                                          .toString(),
                                    ),
                                    Text(
                                      ' ${state.data.data.day4.temperature}°C',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18.0,
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height:
                                    (6.6 * MediaQuery.of(context).size.height) /
                                        100,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      ' ${DateFormat("MMM, DD").format(DateTime.now().add(Duration(days: 4))).toString()}',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18.0,
                                          color: Colors.white),
                                    ),
                                    Image.asset(
                                      constants.weather[state
                                              .data.data.day5.condition
                                              .toLowerCase()]
                                          .toString(),
                                    ),
                                    Text(
                                      ' ${state.data.data.day5.temperature}°C',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18.0,
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height:
                                    (6.6 * MediaQuery.of(context).size.height) /
                                        100,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      ' ${DateFormat("MMM, DD").format(DateTime.now().add(Duration(days: 5))).toString()}',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18.0,
                                          color: Colors.white),
                                    ),
                                    Image.asset(
                                      constants.weather[state
                                              .data.data.day6.condition
                                              .toLowerCase()]
                                          .toString(),
                                    ),
                                    Text(
                                      ' ${state.data.data.day6.temperature}°C',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18.0,
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height:
                                    (6.6 * MediaQuery.of(context).size.height) /
                                        100,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      ' ${DateFormat("MMM, DD").format(DateTime.now().add(Duration(days: 6))).toString()}',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18.0,
                                          color: Colors.white),
                                    ),
                                    Image.asset(
                                      constants.weather[state
                                              .data.data.day7.condition
                                              .toLowerCase()]
                                          .toString(),
                                    ),
                                    Text(
                                      ' ${state.data.data.day7.temperature}°C',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18.0,
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      : CircularProgressIndicator();
                },
              ),
              left: (7.2 * MediaQuery.of(context).size.width) / 100,
              top: (52.6 * MediaQuery.of(context).size.height) / 100,
            ),
          ],
        ),
      ),
    );
  }
}
