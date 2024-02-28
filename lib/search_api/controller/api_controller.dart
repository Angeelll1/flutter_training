import 'dart:developer';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:latihan_flutetr/search_api/model/product_model.dart';

class APIController extends GetxController {
  var counter = 0.obs;
  var materialname = 'none'.obs;
  var isLoading = false.obs;
  var searchQuery = ''.obs;
  var posts = [].obs;
  var lsProductionOrder = [].obs;
  
  String url =
      'https://jsonplaceholder.typicode.com/users/1/todos';

  @override
    void onInit() {
      super.onInit();
      onGetAllDocumentData();
    }

  void searchData(String data) {
    searchQuery.value = data;
    if (data.isEmpty) {
      posts.value = lsProductionOrder.toList();
    } else {
      var filteredData = lsProductionOrder
          .where((item) => item.id
              .toString()
              .toLowerCase()
              .contains(data.toLowerCase()))
          .toList();
      posts.value = filteredData;
    }
  }

  onStratCounting() {
    counter.value += 1;
  }

  onGetAllDocumentData() async {
    isLoading.value = true;
    try {
      String result = await onBasicGetSource(url: url)
          .timeout(const Duration(seconds: 20), onTimeout: () => "Time Out");
      onFilterData(data: result);
    } catch (e) {
      log('Failed to get data $e');
    }
  }

  Future<String> onBasicGetSource({required String url}) async {
    http.Response response = await http.get(Uri.parse(url));
    String rescode = response.statusCode.toString();
    String tempresult = '';
    String result = 'Error';
    if (response.statusCode == 200 &&
        !response.body.toUpperCase().contains('INVALID TOKEN') &&
        !response.body.toUpperCase().contains('UNAUTORIZED') &&
        !response.body.toUpperCase().contains('SERVER UNAVAILABLE')) {
      result = response.body;
    } else if (response.statusCode == 400) {
      tempresult = 'Error ' + rescode + ', Bad Request';
    } else if (response.statusCode == 401) {
      tempresult = 'Error ' + rescode + ', Unautorized';
    } else if (response.statusCode == 404) {
      tempresult = 'Error ' + rescode + ', Not Found';
    } else if (response.statusCode == 500) {
      tempresult = 'Error ' + rescode + ', Internal Server Error';
    } else if (response.statusCode == 502) {
      tempresult = 'Error ' + rescode + ', Bad Gateway';
    } else if (response.statusCode == 503) {
      tempresult = 'Error ' + rescode + ', Service Unavailable';
    } else if (response.body.contains('INVALID TOKEN')) {
      tempresult = 'Error ' + rescode;
    } else {
      tempresult = 'Error' + rescode;
    }
    result = tempresult.toLowerCase().contains('error')
        ? tempresult + " " + response.body
        : response.body;
    return result;
  }

  onFilterData({required String data}) {
    lsProductionOrder.clear();

    if (data.isNotEmpty &&
        !data.toLowerCase().contains('error') &&
        !data.toLowerCase().contains('failed')) {
      var jsonData = jsonDecode(data);
      for (var material in jsonData) {
        lsProductionOrder.add(ProductModel.fromJson(material));
        posts.add(ProductModel.fromJson(material));
      }
    }
  }

  
}
