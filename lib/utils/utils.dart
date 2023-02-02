import 'package:exam5/Data/Services/Api_Serviece.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;


void setup() {
  getIt.registerSingleton<Apiservices>(Apiservices());
}