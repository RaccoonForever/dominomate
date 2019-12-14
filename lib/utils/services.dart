import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

postRequest(context, path) async {
  /**String url = 'https://jsonplaceholder.typicode.com/posts';

      Map<String, String> headers = {
      "accept": "application/json",
      "Content-type": "multipart/form-data"
      };
      String json = '{"title": "Hello", "body": "body text", "userId": 1}';

      // make POST request
      Response response = await post(url,
      headers: headers, body: json); // check the status code for the result
      int statusCode = response
      .statusCode; // this API passes back the id of the new item added to the body
      String body = response.body;

      return body[0];*/

  var uri = Uri.parse("");
  var request = new http.MultipartRequest("POST", uri);

  request.fields['user'] = 'MobileApplication';
  request.fields['version'] = "1"; // TODO CHANGE THIS

  request.files.add(new http.MultipartFile.fromBytes(
      "file", await File.fromUri(path).readAsBytes(),
      contentType: new MediaType("image", "png")));

  var response = await request.send();

  if (response.statusCode == 200) {
    return response;
  } else {
    return null;
  }
}
