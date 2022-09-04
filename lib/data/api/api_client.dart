import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;
  late Map<String, String> _mainHeaders;
//Constructor
  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;  // this url needs na base url from dependencies
    timeout = Duration(seconds: 30);
    token= AppConstants.TOKEN;
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }
// Hit the uri which means end point  and get the data
  Future<Response> getData(String uri) async {
   // print('Api client getData class');
    try {
      Response response = await get(uri);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
