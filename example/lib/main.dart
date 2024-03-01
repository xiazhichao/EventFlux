import 'package:eventflux/client.dart';
import 'package:eventflux/enum.dart';
import 'package:eventflux/models/response.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(EventFluxUsage());
}

class EventFluxUsage extends StatelessWidget {
  EventFluxUsage({super.key});
  EventFlux eventFlux = EventFlux.spawn();
  @override
  Widget build(BuildContext context) {
    connect();
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text("Refer Readme for usage"),
        ),
      ),
    );
  }
  void connect() {

    eventFlux.connect(
        EventFluxConnectionType.get,
        'http://10.0.2.157:8090/api/sysadmin/syss/common/subscribe?businessMessageType=999?userId=1668893024087506946',
        header: {"X-TOKEN":"29385bb0f6a24d98a1bb07b44c25b7c6"},
        onSuccessCallback: (EventFluxResponse? response) {
          response?.stream?.listen((data) {
            print("data:${data.data}");
            print("id:${data.id}");
            print("event:${data.event}");
          });
        },
        onError: (oops) {
          print("onError");
          // EventFlux.instance.disconnect();
          // Oops! Time to handle those little hiccups.
        },
        autoReconnect: true // Keep the party going, automatically!
    );

  }
}
