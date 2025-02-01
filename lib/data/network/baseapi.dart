abstract class BaseApiServices{

  Future<dynamic> getGetApiResponse(String url);

  // which data send to backend
  Future<dynamic> getPostApiResponse(String url, dynamic data);
}