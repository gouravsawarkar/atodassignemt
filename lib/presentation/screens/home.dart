import 'package:a_to_d_assignemt/businessLogic/cityIndex/cubit/city_index_cubit.dart';
import 'package:a_to_d_assignemt/businessLogic/cityList/bloc/city_list_bloc.dart';
import 'package:a_to_d_assignemt/businessLogic/forcast/bloc/forcast_bloc.dart';
import 'package:a_to_d_assignemt/businessLogic/liveWeather/bloc/live_weather_bloc.dart';
import 'package:a_to_d_assignemt/businessLogic/login/bloc/login_bloc.dart';
import 'package:a_to_d_assignemt/businessLogic/otherForecast/bloc/other_forecast_bloc.dart';
import 'package:a_to_d_assignemt/constants.dart';
import 'package:a_to_d_assignemt/presentation/widgets.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  String cityId;
  String tocken;
  HomePage({Key? key, required this.cityId, required this.tocken})
      : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final widgets = Widgets();
  List items = ['a', 'b'];

  final constants = Constants();
  void initState() {
    super.initState();

    BlocProvider.of<CityListBloc>(context)
        .add(GetCityList(tocken: widget.tocken));
    BlocProvider.of<LiveWeatherBloc>(context)
        .add(GetLiveWeather(cityId: widget.cityId, tocken: widget.tocken));
    BlocProvider.of<CityIndexCubit>(context).cityIndex(0);
  }

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
              // ignore: sort_child_properties_last
              child: Container(
                width: (85.5 * MediaQuery.of(context).size.width) / 100,
                height: (3.2 * MediaQuery.of(context).size.height) / 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BlocBuilder<CityIndexCubit, CityIndexState>(
                      builder: (context, cityIndex) {
                        print(cityIndex is CityIndexLoaded
                            ? cityIndex.index
                            : 'sd');
                        return BlocBuilder<CityListBloc, CityListState>(
                          builder: (context, cityState) {
                            return cityState is CityListLoaded
                                ? cityIndex is CityIndexLoaded
                                    ? Container(
                                        width: (49.5 *
                                                MediaQuery.of(context)
                                                    .size
                                                    .width) /
                                            100,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(
                                              Icons.location_pin,
                                              color: Colors.white,
                                            ),
                                            Container(
                                              width: (35 *
                                                      MediaQuery.of(context)
                                                          .size
                                                          .width) /
                                                  100,
                                              child: Text(
                                                cityState.data
                                                    .list[cityIndex.index].name,
                                                textAlign: TextAlign.start,
                                                overflow: TextOverflow.clip,
                                                style: TextStyle(
                                                    fontFamily: 'Inter',
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 24.0,
                                                    color: Colors.white),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                _searchCity();
                                              },
                                              child: Icon(
                                                Icons
                                                    .keyboard_arrow_down_rounded,
                                                color: Colors.white,
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    : Container(
                                        width: (49.5 *
                                                MediaQuery.of(context)
                                                    .size
                                                    .width) /
                                            100,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(
                                              Icons.location_pin,
                                              color: Colors.white,
                                            ),
                                            Text(
                                              cityState.data.list[1].name,
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 24.0,
                                                  color: Colors.white),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                _searchCity();
                                              },
                                              child: Icon(
                                                Icons
                                                    .keyboard_arrow_down_rounded,
                                                color: Colors.white,
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                : Container(
                                    width: (49.5 *
                                            MediaQuery.of(context).size.width) /
                                        100,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(
                                          Icons.location_pin,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          'City',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontFamily: 'Inter',
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 24.0,
                                              color: Colors.white),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            _searchCity();
                                          },
                                          child: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                          },
                        );
                      },
                    ),
                    InkWell(
                      onTap: () {
                        _logOut();
                      },
                      child: Container(
                        child: Icon(
                          Icons.power_settings_new,
                          color: Color(0xffffFF6D6D),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              left: (7.2 * MediaQuery.of(context).size.width) / 100,
              top: (6 * MediaQuery.of(context).size.height) / 100,
            ),
            Positioned(
              // ignore: sort_child_properties_last
              child: BlocBuilder<LiveWeatherBloc, LiveWeatherState>(
                builder: (context, state) {
                  return state is LiveWeatherLoaded
                      ? Container(
                          width:
                              (40.9 * MediaQuery.of(context).size.width) / 100,
                          height:
                              (19.1 * MediaQuery.of(context).size.height) / 100,
                          child: Image.asset(
                            constants.weather[
                                    state.data.data.condition.toLowerCase()]
                                .toString(),
                            fit: BoxFit.fitHeight,
                            height:
                                (19.1 * MediaQuery.of(context).size.height) /
                                    100,
                            width: (40.9 * MediaQuery.of(context).size.width) /
                                100,
                          ),
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        );
                },
              ),
              left: (25.60 * MediaQuery.of(context).size.width) / 100,
              top: (13.95 * MediaQuery.of(context).size.height) / 100,
            ),
            Positioned(
              // ignore: sort_child_properties_last
              child: Container(
                width: (85.26 * MediaQuery.of(context).size.width) / 100,
                height: (56.1 * MediaQuery.of(context).size.height) / 100,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFffffff).withOpacity(0.3),
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(20.0)),
                ),
                child: BlocBuilder<LiveWeatherBloc, LiveWeatherState>(
                  builder: (context, state) {
                    return state is LiveWeatherLoaded
                        ? Stack(
                            children: [
                              Positioned(
                                child: Container(
                                  child: Center(
                                    child: Text(
                                      'Today is ${state.data.data.date}',
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18.0,
                                        color: Color(0xFFFFFFff),
                                      ),
                                    ),
                                  ),
                                  width: (85.26 *
                                          MediaQuery.of(context).size.width) /
                                      100,
                                  height: (2.4 *
                                          MediaQuery.of(context).size.height) /
                                      100,
                                ),
                                top:
                                    (1.8 * MediaQuery.of(context).size.height) /
                                        100,
                              ),
                              Positioned(
                                child: Container(
                                  child: Center(
                                    child: Text(
                                      state.data.data.temperature.toString(),
                                      style: TextStyle(
                                        fontFamily: 'Overpass',
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 100.0,
                                        color: Color(0xFFFFFFff),
                                      ),
                                    ),
                                  ),
                                  width: (85.26 *
                                          MediaQuery.of(context).size.width) /
                                      100,
                                  height: (17 *
                                          MediaQuery.of(context).size.height) /
                                      100,
                                ),
                                top:
                                    (3.4 * MediaQuery.of(context).size.height) /
                                        100,
                              ),
                              Positioned(
                                child: Container(
                                  child: Center(
                                    child: Text(
                                      state.data.data.condition,
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 24.0,
                                        color: Color(0xFFFFFFff),
                                      ),
                                    ),
                                  ),
                                  width: (85.26 *
                                          MediaQuery.of(context).size.width) /
                                      100,
                                  height: (3.2 *
                                          MediaQuery.of(context).size.height) /
                                      100,
                                ),
                                top: (19.5 *
                                        MediaQuery.of(context).size.height) /
                                    100,
                              ),
                              Positioned(
                                // ignore: sort_child_properties_last
                                child: Container(
                                  width: (73.6 *
                                          MediaQuery.of(context).size.width) /
                                      100,
                                  height: (26.7 *
                                          MediaQuery.of(context).size.height) /
                                      100,
                                  child: Column(
                                    children: [
                                      Container(
                                        width: (73.6 *
                                                MediaQuery.of(context)
                                                    .size
                                                    .width) /
                                            100,
                                        child: Row(
                                          // ignore: sort_child_properties_last

                                          children: [
                                            Container(
                                              height: (2.6 *
                                                      MediaQuery.of(context)
                                                          .size
                                                          .height) /
                                                  100,
                                              padding:
                                                  const EdgeInsets.all(0.0),
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                      'assets/images/windy.png'),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0),
                                                    child: Container(
                                                      child: Text(
                                                        "Time",
                                                        style: TextStyle(
                                                          fontFamily: 'Inter',
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 18.0,
                                                          color:
                                                              Color(0xFFFFFFff),
                                                        ),
                                                      ),
                                                      height: (2.4 *
                                                              MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height) /
                                                          100,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            BlocBuilder<LoginBloc, LoginState>(
                                              builder: (context, state1) {
                                                return state1 is LoginDone
                                                    ? Text(
                                                        DateFormat('hh:mm a')
                                                            .format(state1
                                                                .msg
                                                                .liveWeather
                                                                .updatedAt),
                                                        style: TextStyle(
                                                          fontFamily: 'Inter',
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 18.0,
                                                          color:
                                                              Color(0xFFFFFFff),
                                                        ),
                                                      )
                                                    : SizedBox();
                                              },
                                            ),
                                          ],
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 6.0),
                                        child: Container(
                                          width: (73.6 *
                                                  MediaQuery.of(context)
                                                      .size
                                                      .width) /
                                              100,
                                          child: Row(
                                            // ignore: sort_child_properties_last

                                            // ignore: sort_child_properties_last
                                            children: [
                                              Container(
                                                height: (2.6 *
                                                        MediaQuery.of(context)
                                                            .size
                                                            .height) /
                                                    100,
                                                padding:
                                                    const EdgeInsets.all(0.0),
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                        'assets/images/windy.png'),
                                                    FittedBox(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 8.0),
                                                        child: Container(
                                                          child: Text(
                                                            "Temperature",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Inter',
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 18.0,
                                                              color: Color(
                                                                  0xFFFFFFff),
                                                            ),
                                                          ),
                                                          height: (2.4 *
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height) /
                                                              100,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                state.data.data.temperature
                                                        .toString() +
                                                    ' °C',
                                                style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 18.0,
                                                  color: Color(0xFFFFFFff),
                                                ),
                                              ),
                                            ],
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 6.0),
                                        child: Container(
                                          width: (73.6 *
                                                  MediaQuery.of(context)
                                                      .size
                                                      .width) /
                                              100,
                                          child: Row(
                                            // ignore: sort_child_properties_last

                                            // ignore: sort_child_properties_last
                                            children: [
                                              Container(
                                                height: (2.6 *
                                                        MediaQuery.of(context)
                                                            .size
                                                            .height) /
                                                    100,
                                                padding:
                                                    const EdgeInsets.all(0.0),
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                        'assets/images/windy.png'),
                                                    FittedBox(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 8.0),
                                                        child: Container(
                                                          child: Text(
                                                            "MaxTemperature",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Inter',
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 18.0,
                                                              color: Color(
                                                                  0xFFFFFFff),
                                                            ),
                                                          ),
                                                          height: (2.4 *
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height) /
                                                              100,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                state.data.data.maxTemperature
                                                        .toString() +
                                                    ' °C',
                                                style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 18.0,
                                                  color: Color(0xFFFFFFff),
                                                ),
                                              ),
                                            ],
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 6.0),
                                        child: Container(
                                          width: (73.6 *
                                                  MediaQuery.of(context)
                                                      .size
                                                      .width) /
                                              100,
                                          child: Row(
                                            // ignore: sort_child_properties_last

                                            // ignore: sort_child_properties_last
                                            children: [
                                              Container(
                                                height: (2.6 *
                                                        MediaQuery.of(context)
                                                            .size
                                                            .height) /
                                                    100,
                                                padding:
                                                    const EdgeInsets.all(0.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Image.asset(
                                                        'assets/images/windy.png'),
                                                    FittedBox(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 8.0),
                                                        child: Container(
                                                          child: Text(
                                                            "MinTemperature",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Inter',
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 18.0,
                                                              color: Color(
                                                                  0xFFFFFFff),
                                                            ),
                                                          ),
                                                          height: (2.4 *
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height) /
                                                              100,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                state.data.data.minTemperature
                                                        .toString() +
                                                    ' °C',
                                                style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 18.0,
                                                  color: Color(0xFFFFFFff),
                                                ),
                                              ),
                                            ],
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 6.0),
                                        child: Container(
                                          width: (73.6 *
                                                  MediaQuery.of(context)
                                                      .size
                                                      .width) /
                                              100,
                                          child: Row(
                                            // ignore: sort_child_properties_last

                                            children: [
                                              Container(
                                                height: (2.6 *
                                                        MediaQuery.of(context)
                                                            .size
                                                            .height) /
                                                    100,
                                                padding:
                                                    const EdgeInsets.all(0.0),
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                        'assets/images/windy.png'),
                                                    FittedBox(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 8.0),
                                                        child: Container(
                                                          child: Text(
                                                            "Condition",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Inter',
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 18.0,
                                                              color: Color(
                                                                  0xFFFFFFff),
                                                            ),
                                                          ),
                                                          height: (2.4 *
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height) /
                                                              100,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                state.data.data.condition,
                                                style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 18.0,
                                                  color: Color(0xFFFFFFff),
                                                ),
                                              ),
                                            ],
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 6.0),
                                        child: Container(
                                          width: (73.6 *
                                                  MediaQuery.of(context)
                                                      .size
                                                      .width) /
                                              100,
                                          child: Row(
                                            // ignore: sort_child_properties_last

                                            children: [
                                              Container(
                                                height: (2.6 *
                                                        MediaQuery.of(context)
                                                            .size
                                                            .height) /
                                                    100,
                                                padding:
                                                    const EdgeInsets.all(0.0),
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                        'assets/images/windy.png'),
                                                    FittedBox(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 8.0),
                                                        child: Container(
                                                          child: Text(
                                                            "WindSpeed",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Inter',
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 18.0,
                                                              color: Color(
                                                                  0xFFFFFFff),
                                                            ),
                                                          ),
                                                          height: (2.4 *
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height) /
                                                              100,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                state.data.data.windSpeed
                                                    .toString(),
                                                style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 18.0,
                                                  color: Color(0xFFFFFFff),
                                                ),
                                              ),
                                            ],
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 6.0),
                                        child: Container(
                                          width: (73.6 *
                                                  MediaQuery.of(context)
                                                      .size
                                                      .width) /
                                              100,
                                          child: Row(
                                            // ignore: sort_child_properties_last

                                            // ignore: sort_child_properties_last
                                            children: [
                                              Container(
                                                height: (2.6 *
                                                        MediaQuery.of(context)
                                                            .size
                                                            .height) /
                                                    100,
                                                padding:
                                                    const EdgeInsets.all(0.0),
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                        'assets/images/windy.png'),
                                                    FittedBox(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 8.0),
                                                        child: Container(
                                                          child: Text(
                                                            "Humidity",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Inter',
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 18.0,
                                                              color: Color(
                                                                  0xFFFFFFff),
                                                            ),
                                                          ),
                                                          height: (2.4 *
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height) /
                                                              100,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                state.data.data.humidity
                                                    .toString(),
                                                style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 18.0,
                                                  color: Color(0xFFFFFFff),
                                                ),
                                              ),
                                            ],
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                left:
                                    (5.7 * MediaQuery.of(context).size.width) /
                                        100,
                                top: (27.34 *
                                        MediaQuery.of(context).size.height) /
                                    100,
                              ),
                            ],
                          )
                        : Center(child: CircularProgressIndicator());
                  },
                ),
              ),
              left: (7.5 * MediaQuery.of(context).size.width) / 100,
              top: (28 * MediaQuery.of(context).size.height) / 100,
            ),
            Positioned(
              // ignore: sort_child_properties_last
              child: BlocBuilder<CityListBloc, CityListState>(
                builder: (context, cityState) {
                  return cityState is CityListLoaded
                      ? BlocBuilder<CityIndexCubit, CityIndexState>(
                          builder: (context, state) {
                            return state is CityIndexLoaded
                                ? InkWell(
                                    onTap: () {
                                      BlocProvider.of<ForcastBloc>(context).add(
                                          GetForeCast(
                                              cityId: cityState
                                                  .data.list[state.index].id,
                                              tocken: widget.tocken));
                                      BlocProvider.of<OtherForecastBloc>(
                                              context)
                                          .add(GetOtherForcast(
                                              cityId: cityState
                                                  .data.list[state.index].id,
                                              tocken: widget.tocken));
                                      Navigator.of(context)
                                          .pushNamed('/details');
                                    },
                                    child: Container(
                                      width: (53.14 *
                                              MediaQuery.of(context)
                                                  .size
                                                  .width) /
                                          100,
                                      height: (7.14 *
                                              MediaQuery.of(context)
                                                  .size
                                                  .height) /
                                          100,
                                      decoration: const BoxDecoration(
                                        color: const Color(0xFFFFFFFF),
                                        borderRadius: const BorderRadius.all(
                                            const Radius.circular(20.0)),
                                      ),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              // ignore: sort_child_properties_last
                                              child: const Text(
                                                "Forecast report",
                                                style: TextStyle(
                                                  fontFamily: 'Overpass',
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16.0,
                                                  color: Color(0xffff444E72),
                                                ),
                                              ),
                                              width: (30.1 *
                                                      MediaQuery.of(context)
                                                          .size
                                                          .width) /
                                                  100,
                                              height: (3.125 *
                                                      MediaQuery.of(context)
                                                          .size
                                                          .height) /
                                                  100,
                                            ),
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              size: 15,
                                              color: Color(0xffff444E72),
                                            )
                                          ]),
                                    ),
                                  )
                                : Container();
                          },
                        )
                      : CircularProgressIndicator();
                },
              ),
              left: (23.4 * MediaQuery.of(context).size.width) / 100,
              top: (88.83 * MediaQuery.of(context).size.height) / 100,
            ),
          ],
        ),
      ),
    );
  }

  _logOut() {
    print('logou');
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            content: Container(
              height: (43.41 * MediaQuery.of(context).size.height) / 100,
              width: (81.64 * MediaQuery.of(context).size.width) / 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/images/logout.png'),
                  Container(
                    child: Text(
                      "Log Out",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w700,
                        fontSize: 20.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    child: Text(
                      "Are you sure you want to logout from app",
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.0,
                          color: Color(0xffff6B6A71)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            SystemChannels.platform
                                .invokeMethod('SystemNavigator.pop');
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height:
                                  (6.6 * MediaQuery.of(context).size.height) /
                                      100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color(0xffffFF6D6D)),
                              child: Center(
                                child: Text(
                                  'Logout',
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18.0,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: (6.6 * MediaQuery.of(context).size.height) /
                                100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Color(0xffffF1EFEF)),
                            child: Center(
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18.0,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  _searchCity() {
    TextEditingController _searchController = TextEditingController();
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              content: Container(
                height: (51.5 * MediaQuery.of(context).size.height) / 100,
                width: (85.5 * MediaQuery.of(context).size.width) / 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    Container(
                      height: (6.3 * MediaQuery.of(context).size.height) / 100,
                      width: (79.7 * MediaQuery.of(context).size.width) / 100,
                      child: TextFormField(
                        controller: _searchController,
                        onChanged: (value) {
                          setState(() {
                            _searchController.text;
                          });
                        },
                        decoration: InputDecoration(
                            hintText: 'Search here',
                            hintStyle: TextStyle(
                              fontFamily: 'Overpass',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              fontSize: 18.0,
                            ),
                            prefixIcon: InkWell(
                              child: Icon(Icons.arrow_back),
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            suffixIcon: Icon(Icons.mic),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15))),
                      ),
                    ),
                    BlocBuilder<CityListBloc, CityListState>(
                      builder: (context, citystate) {
                        return citystate is CityListLoaded
                            ? ListView.builder(
                                shrinkWrap: true,
                                itemCount: citystate.data.list.length,
                                itemBuilder: (context, index) {
                                  var cityDetails = citystate.data.list[index];
                                  return cityDetails.name
                                          .toLowerCase()
                                          .contains(_searchController.text)
                                      ? Container(
                                          width: (85.5 *
                                                  MediaQuery.of(context)
                                                      .size
                                                      .width) /
                                              100,
                                          child: ListTile(
                                            leading: Icon(Icons.location_pin),
                                            title: Text(
                                              cityDetails.name,
                                              style: TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                fontFamily: 'Overpass',
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 18.0,
                                              ),
                                            ),
                                            onTap: () {
                                              BlocProvider.of<CityIndexCubit>(
                                                      context)
                                                  .cityIndex(index);
                                              BlocProvider.of<LiveWeatherBloc>(
                                                      context)
                                                  .add(GetLiveWeather(
                                                      cityId: cityDetails.id,
                                                      tocken: widget.tocken));
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        )
                                      : SizedBox.shrink();
                                })
                            : SizedBox();
                      },
                    )
                  ],
                ),
              ),
            );
          });
        });
  }
}
