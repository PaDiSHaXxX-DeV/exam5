import 'package:exam5/Data/Models/my_response.dart';
import 'package:exam5/Data/Services/Api_Serviece.dart';

class RandomUserRepo{
  RandomUserRepo({required this.apiservices});
  final Apiservices apiservices;


  Future<MyResponse> fetchAllData()=>apiservices.getAllData();

}