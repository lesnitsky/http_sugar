import 'dart:convert' as c;
import 'dart:io';

extension JsonBody on HttpRequest {
  Future<dynamic> toJson() async {
    final text = await c.utf8.decodeStream(this);
    return c.json.decode(text);
  }
}

extension HttpResult on HttpResponse {
  success() {
    this.statusCode = 200;
    this.close();
  }

  notFound() {
    this.statusCode = 404;
    this.close();
  }

  error() {
    this.statusCode = 500;
    this.close();
  }

  json(data) {
    this.statusCode = 200;
    this.headers.add('Content-Type', 'application/json');
    this.write(c.json.encode(data));

    this.close();
  }
}
