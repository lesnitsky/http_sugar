# http_sugar

Sugar methods for HttpRequest and HttpResponse

[![GitHub stars](https://img.shields.io/github/stars/lesnitsky/http_sugar.svg?style=social)](https://github.com/lesnitsky/http_sugar)
[![Twitter Follow](https://img.shields.io/twitter/follow/lesnitsky_dev.svg?label=Follow%20me&style=social)](https://twitter.com/lesnitsky_dev)

## Usage

```dart
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
```

## License

MIT

## Author

Andrei Lesnitsky

[![GitHub stars](https://img.shields.io/github/stars/lesnitsky/http_sugar.svg?style=social)](https://github.com/lesnitsky/http_sugar)
[![Twitter Follow](https://img.shields.io/twitter/follow/lesnitsky_dev.svg?label=Follow%20me&style=social)](https://twitter.com/lesnitsky_dev)
