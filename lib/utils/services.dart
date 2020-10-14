import 'package:dio/dio.dart';

import 'package:domino_mate/utils/constants.dart' as cons;

postRequest(context, path) async {

  FormData formData = new FormData.fromMap({
    "image_file": await MultipartFile.fromFile(path),
    "user": "MobileApplication",
    "version": "1"
  });

  var response = await Dio().post(cons.URL_POST_IMAGE_KINGDOMINO, data: formData);


  if (response.statusCode == 200) {
    return response;
  } else {
    return null;
  }
}
