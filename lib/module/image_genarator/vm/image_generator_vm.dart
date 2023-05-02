import 'package:flutter/material.dart';
import 'package:xertain/module/image_genarator/model/image_model.dart';
import 'package:xertain/module/image_genarator/repo/image_genarator_repo.dart';

import '../../../data/request_builder.dart';
import '../../../data/response/api_response.dart';
import '../../../utils/app_log.dart';

class ImageGeneratorVm with ChangeNotifier {
  final _myRepo = ImageGeneratorRepo();

  /// Sync live cart with local cart
  ApiResponse<ImageModel> imageValue = ApiResponse.loading();

  syncImage(ApiResponse<ImageModel> response) {
    imageValue = response;
    notifyListeners();
  }

  Future<ImageModel?> imageGeneratorVm(
      {required String imageSize, required String userInput}) async {
    var data =
        await rawImageRequest(imageSize: imageSize, userInput: userInput);
    syncImage(ApiResponse.loading());
    await _myRepo.imageGeneratorApiCall(data: data).then((value) {
      syncImage(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      syncImage(ApiResponse.error(error.toString()));
      AppLog().errLog(
          err: "ImageGenerator Vm err ${error.toString()}",
          stackTrace: stackTrace);
    });
    return null;
  }
}
