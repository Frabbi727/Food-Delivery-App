import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:get/get.dart';

import '../api/api_client.dart';
class PopularProductRepo extends GetxService{
  // create an instance of Api client which help to communicate with the server
  final ApiClient apiClient;
//Constructor which required apiclient
  PopularProductRepo({required this.apiClient});
// This method helps to get the data from client side
  Future<Response> getPopularProductList ()async{
    //print('End End point url');
    return await apiClient.getData(AppConstants.POPULAR_PRODUCT_URI); //storing json response

  }
}