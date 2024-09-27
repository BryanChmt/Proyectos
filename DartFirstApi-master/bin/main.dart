
import '../lib/firstapi_sink.dart';
import 'dart:async';
Future main() async {
  var app = Application <FirstapiSink>()
      ..configuration.configurationFilePath = "config.yaml"
      ..configuration.port = 8000;

  await app.start(numberOfInstances: 2);

  print("Application started on port: ${app.configuration.port}.");
  print("Use Ctrl-C (SIGINT) to stop running the application.");
}