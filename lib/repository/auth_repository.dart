import '../data/network/NetworkApiService.dart';
import '../data/network/baseapi.dart';
import '../res/app_url.dart';

class AuthRepository{
  BaseApiServices _apiServices = NetworkApiServices();
// dynamic means mix of (various data type) int, float, bool and any others data types
  Future<dynamic> loginApi(dynamic data)async{
    try{
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.loginEndPoint, data);
      return response;
    }catch(e){
      throw e;
    }
  }

  // register
  Future<dynamic> registerApi(dynamic data)async{
    try{
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.loginEndPoint, data);
      return response;
    }catch(e){
      throw e;
    }
  }
}