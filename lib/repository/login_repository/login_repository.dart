import 'package:sasti_pk/data/network/network_api_services.dart';
import 'package:sasti_pk/res/app_url/app_urls.dart';

class LoginRepository {
  final _apiServices = NetworkApiServices();
  Future<dynamic> loginApi(var data, Map<String, String> headers) {
    dynamic response = _apiServices.postApi(data, AppUrl.loginApi, headers);
    return response;
  }
}
