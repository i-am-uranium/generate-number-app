import 'dart:async';

import 'package:numbers/api/http.dart';
import 'package:numbers/model/number_detail.dart';

import 'error.dart';

class NumberApi {
  static const _apiVersion = 'v1';

  Future<NumberDetail> getHappyNumber() async {
    try {
      final response = await dio
          .post('/$_apiVersion/numbers/happy-number', data: {'length': 2});
      return NumberDetail.fromJson(response.data);
    } on Exception catch (e, stacktrace) {
      return NumberDetail(error: getError(e, stacktrace));
    }
  }
}
