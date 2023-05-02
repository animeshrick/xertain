import 'package:flutter/material.dart';
import 'package:xertain/module/image_genarator/model/image_model.dart';

import '../../../data/network/base_api_service.dart';
import '../../../data/network/network_api_services.dart';
import '../../../resources/components/popup_items.dart';
import '../../../utils/app_log.dart';
import 'image_generator_parser.dart';

class ImageGeneratorRepo {
  BaseApiServices apiServices = NetworkApiService();

  String imageGeneratorUrl = 'https://api.openai.com/v1/images/generations';

  /* ----- Sync Live Cart ----- */
  Future<ImageModel?> imageGeneratorApiCall({required dynamic data}) async {
    try {
      dynamic response = await apiServices.getPostApiResponseV2(
        'DALL-E Image Generator',
        imageGeneratorUrl,
        data,
      );
      // dynamic response =
      //     '{"created":"1683013329","data":[{"url":"https://oaidalleapiprodscus.blob.core.windows.net/private/org-b28fGSm0zEP8zwwUs2uovChG/user-w4Jq9gY7QavWStu5856fBaZ3/img-AKL7uwN0zRVswPhtMK9Ub4xP.png?st=2023-05-02T08%3A15%3A33Z&se=2023-05-02T10%3A15%3A33Z&sp=r&sv=2021-08-06&sr=b&rscd=inline&rsct=image/png&skoid=6aaadede-4fb3-4698-a8f6-684d7786b067&sktid=a48cca56-e6da-484e-a814-9c849652bcb3&skt=2023-05-01T17%3A37%3A15Z&ske=2023-05-02T17%3A37%3A15Z&sks=b&skv=2021-08-06&sig=jYvqu64VUl98SOwNy4MGv/3rnSHNeVjTslHDt8//F/c%3D"}]}';
      // dynamic resp = jsonDecode(response);
      // return ImageGeneratorParser().imageGen(resp);
      return ImageGeneratorParser().imageGen(response);
    } catch (e) {
      AppLog().errLog(err: "err from DALL-E Image Generator - ${e.toString()}");
      PopUpItems().toastMessage(
          "An error occurred in DALL-E Image Generator. Please try again later.",
          Colors.red);
      // throw e.toString();
    }
    return ImageModel();
  }
}
