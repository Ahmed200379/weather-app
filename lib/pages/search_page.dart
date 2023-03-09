import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:section_weather_app/models/weather_model.dart';
import 'package:section_weather_app/models/weather_provider.dart';
import 'package:section_weather_app/pages/services/weather_services.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: const Center(
          child: Text(
            'Location',
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 18, right: 18),
        child: Column(
          children: [
            const Image(
                image: NetworkImage(
                    'https://cip-network-rss.org/sites/default/files/2021-09/Globe_CIP_0.gif')),
            const SizedBox(
              height: 50,
            ),
            TextFormField(
              onFieldSubmitted: (location) async {
                city = location;
                Weather_Services services = Weather_Services();
                Weather_Model weather = await services.get_weather(city: city!);
                Provider.of<Weather_Provider>(context, listen: false).weatherdata = weather;
                Navigator.pop(context);
                const InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                  width: 5.0,
                )));
              },
              decoration: InputDecoration(
                  labelText: 'Location',
                  hintText: 'Enter your city',
                  suffixIcon: const Icon(Icons.location_on_outlined),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18))),
            ),
          ],
        ),
      ),
    );
  }
}

String? city;
