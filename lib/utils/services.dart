

import 'package:http/http.dart';

postRequest(context, path) async {

  String url = 'https://jsonplaceholder.typicode.com/posts';

  Map<String, String> headers = {"Content-type": "application/json"};
  String json = '{"title": "Hello", "body": "body text", "userId": 1}';

  // make POST request
  Response response = await post(url, headers: headers, body: json);  // check the status code for the result
  int statusCode = response.statusCode;  // this API passes back the id of the new item added to the body
  String body = response.body;

  return body[0];
  // {
  //   "title": "Hello",
  //   "body": "body text",
  //   "userId": 1,
  //   "id": 101
  // }
}

/**upload(BuildContext context, String path) async {
    var imgFile = File(path);
    var uri = Uri.parse("");
    var request = new http.MultipartRequest("POST", uri);
    var multipartFile = new http.MultipartFile.fromBytes(
    'file', await imgFile.readAsBytes(),
    contentType: new MediaType('image', 'png'));

    request.files.add(multipartFile);
    request.fields['user'] = 'MobileApplication';

    var response = await request.send();

    print(response.statusCode);

    response.stream.transform(utf8.decoder).listen((value) {
    print(value);
    });

    Navigator.pop(context, response);
    }*/