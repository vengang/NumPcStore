import 'package:computer_store/service/apiModel.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Apiservice {
  Future<List<ProductModel>> fetchApi() async {
    try {
      final url = "https://seangleangsim006-cmd.github.io/fake-json/?fbclid=IwY2xjawRZHx9leHRuA2FlbQIxMQBzcnRjBmFwcF9pZA80Mzc2MjYzMTY5NzM3ODgAAR4z07u-WdVdhKo--lHuU89ZzcUHjccy35_u9uvFfm7to8X_arg4VyOS5PS7cg_aem_IHAT3yfksU4uwg4hQJsMGA";
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        return compute(productModelFromJson, res.body);
      } else {
        throw Exception("Error Status code: ${res.statusCode}");
      }
    } catch (e) {
      throw Exception("Error${e.toString()}");
    }
  }
}
