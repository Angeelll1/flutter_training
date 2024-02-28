import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
import 'package:latihan_flutetr/search_api/controller/api_controller.dart';

class SearchApiView extends StatelessWidget {
  const SearchApiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    APIController controller = Get.put(APIController());
    controller.onGetAllDocumentData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Dashboard'),
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                textInputAction: TextInputAction.search,
                onChanged: (value) => controller.searchData(value),
                decoration: InputDecoration(
                  labelText: 'Search',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),

          Expanded(
            child: Obx(
              () => controller.isLoading.isFalse
                  ? Center(
                      child: SizedBox(
                        width: 65,
                        height: 65,
                        child: CircularProgressIndicator(
                          color: Colors.red.shade800,
                          strokeWidth: 8,
                        ),
                      ),
                    )
                  : Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                              itemCount: controller.posts.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                          color: Colors.grey.shade200,
                                          width: 1,
                                        )),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          ComponentItem(
                                            title: "userId",
                                            value: controller.posts[index]
                                                    .userId ??
                                                "-",
                                          ),
                                          ComponentItem(
                                            title: "id",
                                            value: controller.posts[index]
                                                    .id ??
                                                "-",
                                          ),
                                          ComponentItem(
                                            title: "title",
                                            value: controller
                                                    .posts[index].title ??
                                                "-",
                                          ),
                                          ComponentItem(
                                            title: "completed",
                                            value: controller.posts[index]
                                                    .completed ??
                                                "-",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 3,
        backgroundColor: Colors.red,
        onPressed: () {},
        label: const Text('Start Counter'),
        icon: const Icon(Icons.drive_folder_upload),
      ),
    );
  }
}

class ComponentItem extends StatelessWidget {
  final String title;
  final String value;
  const ComponentItem({Key? key, required this.title, required this.value})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Row(
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: Get.size.width * 0.4,
              minWidth: Get.size.width * 0.3,
            ),
            child: Text(
              title,
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: 8,
            child: Text(
              ":",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
