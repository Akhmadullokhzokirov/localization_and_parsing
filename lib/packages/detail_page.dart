import 'package:flutter/material.dart';
import 'package:localization/model/emp_detail.dart';
import 'package:localization/service/http_service.dart';

class DetailPage extends StatefulWidget {
  static final String id = "detail_page";
  final int index;

  const DetailPage({required this.index, super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Employeeid? employeeid;

  void _apiEmployeeid() async {
    setState(() {
      isLoading = true;
    });
    var responce = await Network.GET(
        "${Network.API_LIST_Id}${widget.index}", Network.paramsEmpty());
    if (responce != null) {
      setState(() {
        isLoading = false;
        employeeid = empDetailFromJson(responce).employeeid;
        print("$responce");
        print(employeeid?.employeeName);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _apiEmployeeid();
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Page"),
      ),
      body: Stack(
        children: [
          Center(
            child:
                Text("${employeeid?.employeeName}(${employeeid?.employeeAge})"
                    "\n ${employeeid?.employeeSalary}"),
          ),
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
