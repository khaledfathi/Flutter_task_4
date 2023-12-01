import 'package:flutter/material.dart';
import 'package:task_l4/models/user_model.dart';
import 'package:task_l4/views/components/alert_message.dart';
import 'package:task_l4/views/components/alert_warnning.dart';

class DatabaseListView extends StatefulWidget {
  List<UserModel> records;
  DatabaseListView({super.key, required this.records});

  @override
  State<DatabaseListView> createState() => _DatabaseListViewState();
}

class _DatabaseListViewState extends State<DatabaseListView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Database'),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertWarnning(
                        title: 'Confirm Delete All',
                        message: 'Are You Sure',
                        onTapNo: () => Navigator.of(context).pop(),
                        onTapYes: () async {
                          await deleteAllrecord();
                          Navigator.of(context).pop(); 
                          setState(() {});
                        },
                      );
                    });
              },
              backgroundColor: Colors.red,
              tooltip: 'Delete all database',
              child: const Icon(
                Icons.delete_forever_rounded,
                color: Colors.white,
              ),
            ),
            body: ListView.builder(
                itemCount: widget.records.length,
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        color: Colors.deepPurpleAccent,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(2, 2),
                              blurRadius: 3),
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(-2, -2),
                              blurRadius: 3),
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: double.infinity,
                            child: Text(
                              'User Name : ${widget.records[index].name}',
                              style: customTextStyle(),
                            )),
                        SizedBox(
                            width: double.infinity,
                            child: Text(
                                'Email : ${widget.records[index].email}',
                                style: customTextStyle())),
                        SizedBox(
                            width: double.infinity,
                            child: Text(
                              'Phone : ${widget.records[index].phone}',
                              style: customTextStyle(),
                            )),
                        SizedBox(
                            width: double.infinity,
                            child: Text(
                              'Password : ${widget.records[index].password}',
                              style: customTextStyle(),
                            )),
                        ElevatedButton(
                            onPressed: () async {
                              await deleteRecord(
                                  int.parse(widget.records[index].id!));
                              setState(() {});
                            },
                            child: const Icon(
                              Icons.delete_forever_rounded,
                              color: Colors.red,
                            )),
                      ],
                    ),
                  );
                })));
  }

  TextStyle customTextStyle() {
    return const TextStyle(color: Colors.white, fontSize: 15);
  }

  Future deleteRecord(int id) async {
    await UserModel().delete(id);
    await UserModel()
        .select()
        .then((queryResults) => widget.records = queryResults);
  }

  Future deleteAllrecord() async {
    await UserModel().deleteAll();
    await UserModel()
        .select()
        .then((queryResults) => widget.records = queryResults);
  }
}
