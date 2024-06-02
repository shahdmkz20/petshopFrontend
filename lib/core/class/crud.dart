import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../functions/checkinternet.dart';
import 'statusrequest.dart';

class CRUD {
  Future<Either<StatusRequest, Map>> postData(String linkUrl, Map data) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(Uri.parse(linkUrl), body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          return right(responseBody);
        } else {
          return left(StatusRequest.serverFailure);
        }
      } else {
        return left(StatusRequest.offlineFailure);
      }
    } catch (e) {
      print('Error in CRUD.postData: $e'); // Print error
      return left(StatusRequest.serverFailure);
    }
  }
}
