abstract class BaseApiServices {
  Future<dynamic> getGetApiResponse(String requestTag, String url);

  Future<dynamic> getPostApiResponseV2(
      String requestTag, String url, dynamic data);

  Future<dynamic> getPostEncodedApiResponse(
      String requestTag, String url, Map body);

  Future<dynamic> getPostMultipartApiResponse(String? requestTag, String? url,
      String? arrayName, String? image, String? imageFileName);
}
