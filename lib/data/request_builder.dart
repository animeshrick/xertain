import 'dart:convert';

import '../api_key.dart';

apiHeaders() {
  Map<String, String> header = {
    "Authorization": "Bearer $new_apiKey",
    // "Authorization": "Bearer $exp_apiKey",
    "Content-Type": "application/json",
  };
  return header;
}

rawImageRequest({required String imageSize, required String userInput}) {
  Map bodyData = {"prompt": userInput, "n": 1, "size": imageSize};
  return jsonEncode(bodyData);
}
