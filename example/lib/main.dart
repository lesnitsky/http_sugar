import 'dart:io';
import 'package:http_sugar/http_sugar.dart';

void main() async {
  final server = await HttpServer.bind(InternetAddress.anyIPv4, 3000);

  await for (HttpRequest req in server) {
    final body = await req.toJson();

    switch (body['result']) {
      case 'success':
        req.response.success();
        break;

      case 'error':
        req.response.error();
        break;

      case 'notFound':
        req.response.notFound();
        break;

      case 'respondWithJson':
        req.response.json({'key': 'value'});
        break;
    }
  }
}
