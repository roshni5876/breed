import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:the_dogapi/model/apis/app_exception.dart';
import 'package:the_dogapi/model/services/base_service.dart';

class BreedService extends BaseService {
  @override
  Future getResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await Dio().get(baseUrl + url);

      log(response.statusCode.toString());
      log(response.data.toString());
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  dynamic returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = response.data;
        return responseJson;
      case 400:
        throw BadRequestException(response.data.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.data.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while communication with server with status code : ${response.statusCode}');
    }
  }
}
