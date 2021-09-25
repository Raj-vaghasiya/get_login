import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_login/getx_controllers/compectapi_controller.dart';

class SecondApi extends StatelessWidget {
  SecondApi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('second api'),
      ),
      body: ListView(
        children: [
          GetBuilder<CompactApiFetchDataController>(
              init: CompactApiFetchDataController(),
              builder: (compactapiDetail) {
                // ignore: unnecessary_null_comparison
                if (compactapiDetail == null)
                  return Center(child: Text('No Data'));
                if (compactapiDetail.compactDetailApiDetail.isEmpty)
                  return Center(child: CircularProgressIndicator());
                return ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: compactapiDetail.compactDetailApiDetail.length,
                  padding: EdgeInsets.all(0),
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      child: ListTile(
                        title: Text(
                          "id:- ${compactapiDetail.compactDetailApiDetail[index].id}\n"
                            "Name:- ${compactapiDetail.compactDetailApiDetail[index].name}"),
                        subtitle: Text(
                            "Email:- ${compactapiDetail.compactDetailApiDetail[index].email}"),
                      ),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
