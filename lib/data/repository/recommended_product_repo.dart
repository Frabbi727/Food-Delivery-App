import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:get/get.dart';

import '../api/api_client.dart';
class RecommendedProductRepo extends GetxService{
  // create an instance of Api client which help to communicate with the server
  final ApiClient apiClient;
//Constructor which required apiclient
  RecommendedProductRepo({required this.apiClient});
// This method helps to get the data from client side
  Future<Response> getRecommendedProductList ()async{
    //print('End End point url');
    return await apiClient.getData(AppConstants.RECOMMENDED_PRODUCT_URI); //storing json response

  }
}