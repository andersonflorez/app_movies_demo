import 'package:app_movies_demo_exito_2/global/api/custom_interceptors_api.dart';
import 'package:dio/io.dart';

class ApiClient extends DioForNative {
  ApiClient([super.options]) {
    interceptors.add(CustomInterceptors());
  }
}
