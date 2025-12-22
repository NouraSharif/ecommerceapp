import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:ecommerceapp/core/functions/internetcheck.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, Map>> postData(String uri, Map data) async {
    var response = await http.post(Uri.parse(uri), body: data);

    try {
      if (await internetCheck()) {
        if (response.statusCode == 200 || response.statusCode == 201) {
          var responsebody = jsonDecode(response.body);
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverfailure);
    }
  }
}
