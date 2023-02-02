import 'package:dio/dio.dart';
import 'package:exam5/Data/Models/User_Rndom_Model.dart';
import 'package:exam5/Data/Models/my_response.dart';
import 'package:exam5/Data/Services/Api_Client.dart';

class Apiservices extends ApiClient {
  Future<MyResponse> getAllData() async {
    MyResponse myResponse = MyResponse(error: "");
    try {
      Response response = await dio.get(dio.options.baseUrl);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        myResponse.data = RandomUserModel.fromJson(response.data);
      }
    } catch (e) {
      myResponse.error = e.toString();
    }
    return myResponse;
  }
}

