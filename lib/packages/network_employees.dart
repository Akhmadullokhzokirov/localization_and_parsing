import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:localization/model/employees.dart';
import 'package:localization/packages/detail_page.dart';
import 'package:localization/service/http_service.dart';
import 'package:localization/service/logger_service.dart';

class NetEmployees extends StatefulWidget {
  static final String id = "Net_Employees";
  const NetEmployees({super.key});

  @override
  State<NetEmployees> createState() => _NetEmployeesState();
}

class _NetEmployeesState extends State<NetEmployees> {
  var isLoading = false;
    List<Employee> items = [];



  @override
  void initState() {
    super.initState();
    _apiEmployeesList();

  }

  void _apiEmployeesList() async {
    setState(() {
      isLoading = true;
    });
    var responce = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    if (responce != null) {
      setState(() {
        isLoading = false;
        items = employeesFromJson(responce).data;

      });
    }
  }
  void _apiEmployeesCreate(Employee employee) {
    Network.POST(Network.API_CREATE, Network.paramsCreate(employee))
        .then((responce) => {});
  }

  void _apiEmployeesUpdate(Employee employee) {
    Network.PUT(Network.API_UPDATE + employee.id.toString(),
        Network.paramsUpdate(employee))
        .then((responce) => {});
  }

  void _apiEmployeesDelete(Employee employee) {
    Network.DEL(
        Network.API_DELETE + employee.id.toString(), Network.paramsEmpty())
        .then((responce) => {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Networking"),
      ),
      body: Stack(
        children: [
          ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return itemHomeEmployee(items[index],items[index].id);
              }
          ),
          isLoading ? Center(
            child: CircularProgressIndicator(),
          ) :
          SizedBox.shrink(),
        ],
      ),
    );
  }
  Widget itemHomeEmployee(Employee employee, index) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return DetailPage(index:index);
        }));
      },
      child: Slidable(
        endActionPane: ActionPane(
          extentRatio: 0.25,
          motion: ScrollMotion(),
          children: [
            SlidableAction(onPressed: (BuildContext context){
              _apiEmployeesDelete(employee);
              // delete api
            },
              flex: 3,
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: "Delete",
            )
          ],
        ),
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(employee.employeeName!,style: TextStyle(color: Colors.black,
              fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 5,),
              Text(employee.employeeAge.toString())
            ],
          ),
        ),
      ),
    );
  }
}
