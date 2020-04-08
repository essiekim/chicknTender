import 'dart:async';
import 'dart:convert';
import 'business.dart';
import 'package:http/http.dart' as http;
import 'package:uri/uri.dart';
import 'dart:math';
import './secrets.dart';

class ParsedResponse<T> {
  ParsedResponse(this.statusCode, this.body);

  final int statusCode;
  final T body;

  bool isSuccess() {
    return statusCode >= 200 && statusCode < 300;
  }
}

const int CODE_OK = 200;
const int CODE_REDIRECTION = 300;
const int CODE_NOT_FOUND = 404;

class Repository {
  static final Repository _repo = new Repository._internal();
  static const String API_KEY = yelp_api_key;
  static const Map<String, String> AUTH_HEADER = {
    "Authorization": "Bearer $API_KEY"
  };

  static Repository get() {
    return _repo;
  }

  Repository._internal();

  Future<List<Business>> getBusinesses(String foodType) async {
    Random random = new Random();
    int randomNumber = random.nextInt(10);

    var template = new UriTemplate(
        "https://api.yelp.com/v3/businesses/search?term={searchQry}&limit=6&location=10004&offset={random}");

    String webAddress =
        template.expand({'searchQry': '$foodType', 'random': '$randomNumber'});

    http.Response response =
        await http.get(webAddress, headers: AUTH_HEADER).catchError((resp) {});

    // Error handling
    if (response == null ||
        response.statusCode < CODE_OK ||
        response.statusCode >= CODE_REDIRECTION) {
      return Future.error(response.body);
    }

    Map<String, dynamic> map = json.decode(response.body);

    Iterable jsonList = map["businesses"];
    List<Business> businesses =
        jsonList.map((model) => Business.fromJson(model)).toList();

    // debugPrint(jsonList.toString());

    return businesses;
  }
}
