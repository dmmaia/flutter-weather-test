import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mobx_test/screens/service.dart';

import '../models/weather_model.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  var _weatherModel;
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _weatherModel = (await WheaterService().getWheaters())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clima'),
      ),
      body: Container(
        color: Colors.blue[300],
        width: 800,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          SizedBox(
            width: 200,
            height: 200,
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Text(
                  _weatherModel != null
                      ? '${(_weatherModel.temp.round())}º'
                      : '0',
                  style: const TextStyle(color: Colors.white, fontSize: 80)),
              Text(
                textAlign: TextAlign.center,
                _weatherModel != null ? '${(_weatherModel.description)}' : '0',
                style: const TextStyle(color: Colors.white, fontSize: 10),
              )
            ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                _weatherModel != null
                    ? 'Min ${(_weatherModel.tempMin.round())}º'
                    : '0',
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              Text(
                _weatherModel != null
                    ? 'Max ${(_weatherModel.tempMax.round())}º'
                    : '0',
                style: const TextStyle(color: Colors.white, fontSize: 20),
              )
            ],
          )
        ]),
      ),
    );
  }
}
