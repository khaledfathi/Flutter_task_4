import 'package:flutter/material.dart';
import 'package:task_l4/models/user_model.dart';
import 'package:task_l4/views/database_list_view.dart';
import 'package:task_l4/views/home_view.dart';

class HomeController {

  Widget Homeview (){
    return const HomeView(); 
  }
  Future databaseView({required context })async{
    List<UserModel> records=[]; 
    await UserModel().select().then((queryReuslt) {
      records = queryReuslt; 
    });
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> DatabaseListView(records: records)));
  }
}