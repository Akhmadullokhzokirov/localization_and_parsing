import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:localization/model/employees.dart';
import 'package:localization/packages/network_employees.dart';
import 'package:localization/service/http_service.dart';
import 'package:localization/service/logger_service.dart';

class HomePage extends StatefulWidget {
  static final String id = "home_page";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        centerTitle: true,
        title: Text("Localization"),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
           mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              minWidth: double.infinity,
              color: Colors.blue,
              onPressed: () {

              },
            child: Text("str_packages").tr(),
            ),
            MaterialButton(
              minWidth: double.infinity,
              color: Colors.blue,
              onPressed: () {

              },
              child: Text("str_localization").tr(),
            ),
            MaterialButton(
              minWidth: double.infinity,
              color: Colors.blue,
              onPressed: () {

              },
              child: Text("str_local_database").tr(),
            ),
            MaterialButton(
              minWidth: double.infinity,
              color: Colors.blue,
              onPressed: () {
                Navigator.pushNamed(context, NetEmployees.id);
            // width error
              },
              child: Text("str_networking").tr(),
            ),
           SizedBox(height: 250,),
            Row(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Expanded(
                   child: MaterialButton(
                     color: Colors.green,
                 onPressed: () {
                   context.setLocale(const Locale('en', 'US'));
                 },
                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                 child: Text("Enflish"),
               )
               ),
               SizedBox(width: 5,),
               Expanded(child: MaterialButton(
                 color: Colors.red,
                 onPressed: () {
                   context.setLocale(const Locale('ko', 'KOR'));
                 },
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                 child: Text("Korean"),
               )
               ),
               SizedBox(width: 5,),
               Expanded(child: MaterialButton(
                 color: Colors.blue,
                 onPressed: () {
                   context.setLocale(const Locale('ja', 'JPN'));
                 },
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                 child: Text("Japonies"),
               )
               ),

             ],
           )
          ],
        ),
      ),
    );
  }
}
