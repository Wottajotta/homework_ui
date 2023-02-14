import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme:
              const TextTheme(titleMedium: TextStyle(color: Colors.white))),
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: const Text("Weather Forecast"),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: SingleChildScrollView(child: 
         Column(
          children: [
            _buildBody(),
          ],
        ),
      ),
    ),);
  }
}

Widget _buildBody() {
  return SingleChildScrollView(
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: _textField(),
        ),
        const Divider(color: Colors.red),
        _cityDetail(),
        const Divider(
          height: 50,
          color: Colors.red,
        ),
        _temperatureDetail(),
        const Divider(color: Colors.red),
        _extraWeatherDetail(),
        const Divider(
          height: 50,
          color: Colors.red,
        ),
        const Text(
          "7-DAY WEATHER FORECAST",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        const Divider(color: Colors.red),
        _bottomDetail(),
      ],
    ),
  );
}

TextField _textField() {
  return const TextField(
    decoration: InputDecoration(
      hintText: "Enter City Name",
      hintStyle: TextStyle(color: Colors.white, fontSize: 17),
      prefixIcon: Icon(
        Icons.search,
        color: Colors.white,
        size: 25,
      ),
      border: InputBorder.none,
      filled: true,
      fillColor: Colors.red,
    ),
  );
}

Widget _cityDetail() {
  return Center(
    child: Column(
      children: const [
        Text(
          "Sverdlovskaya Oblast, RU",
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        Divider(color: Colors.red),
        Text(
          "Monday, Feb 13, 2023",
          style: TextStyle(fontSize: 17, color: Colors.white),
        )
      ],
    ),
  );
}

Widget _temperatureDetail() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              Icon(
                Icons.wb_sunny,
                color: Colors.white,
                size: 60.0,
              )
            ]),
        const SizedBox(width: 16.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: const <Widget>[
                Text(
                  '14 °F',
                  style: TextStyle(color: Colors.white, fontSize: 35.0),
                ),
              ],
            ),
            Row(
              children: const <Widget>[
                Text(
                  'LIGTHS NOW',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ],
            )
          ],
        )
      ],
    ),
  );
}

Widget _extraWeatherDetail() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(width: 1.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Icon(
              Icons.ac_unit,
              color: Colors.white,
              size: 30,
            ),
            Text(
              "5",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              "km/hr",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        const SizedBox(width: 70.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Icon(Icons.ac_unit, color: Colors.white, size: 30),
            Text(
              "3",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              "%",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ],
        ),
        const SizedBox(width: 70.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Icon(Icons.ac_unit, color: Colors.white, size: 30),
            Text(
              "20",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              "%",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _bottomDetail() {
  List<String> days = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Fryday",
    "Saturday",
    "Sunday"
  ];
  List<String> degree = ["6", "22", "15", "17", "27", "10", "9"];
  return SizedBox(
    width: 400,
    height: 150,
    child: ListView.builder(
        padding: const EdgeInsets.all(7.0),
        scrollDirection: Axis.horizontal,
        itemExtent: 190,
        itemCount: days.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              tileColor: Colors.grey[400],
              title: Padding(padding: const EdgeInsets.all(8.0),child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    days[index],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${degree[index]}°F ",
                    style: const TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  const Icon(
                    Icons.sunny,
                    size: 40,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          );
        }),
  );
}
