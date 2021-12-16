import 'package:flutter/material.dart';
import 'package:recap/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime('Accra', 'Africa/Accra', 'ghana.png'),
    WorldTime('London', 'Europe/London', 'uk.png'),
    WorldTime('Athens', 'Europe/Berlin', 'greece.png'),
    WorldTime('Cairo', 'Africa/Cairo', 'egypt.png'),
    WorldTime('Nairobi', 'Africa/Nairobi', 'kenya.png'),
    WorldTime('Chicago', 'America/Chicago', 'usa.png'),
    WorldTime('New York', 'America/New_York', 'usa.png'),
    WorldTime('Seoul', 'Asia/Seoul', 'south_korea.png'),
    WorldTime('Jakarta', 'Asia/Jakarta', 'indonesia.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose a Location'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4),
              child: Card(
                child: ListTile(
                  title: Text(locations[index].location),
                  onTap: () {
                    updateTime(index);
                  },
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage('https://raw.githubusercontent.com/iamshaunjp/flutter-beginners-tutorial/lesson-34/world_time_app/assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
