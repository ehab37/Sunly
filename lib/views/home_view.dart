import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sunly/core/utils/assets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(CupertinoIcons.location_solid),
                  SizedBox(width: 8),
                  Text("Cairo", style: TextStyle(fontSize: 30)),
                ],
              ),
              const Text('updated at 23:46', style: TextStyle(fontSize: 24)),
              Image.asset(
                AssetsData.kLogo,
                width: MediaQuery.of(context).size.width / 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Mintemp: 16', style: TextStyle(fontSize: 16)),
                  Text("19°", style: TextStyle(fontSize: 64)),
                  Text('Maxtemp: 24', style: TextStyle(fontSize: 16)),
                ],
              ),
              Text(
                "feels like 23°",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              SizedBox(height: 24),
              Text(
                "Cloudy",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
