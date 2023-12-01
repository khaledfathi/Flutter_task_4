import 'package:task_l4/services/database_service.dart';
import 'package:task_l4/models/model.dart';
import 'package:task_l4/globals.dart' as globals ; 

class UserModel implements Model {
  final DatabaseService _db = globals.db; 
  @override
  String tableName = 'users';
  String? id;
  String? name;
  String? password;
  String? email;
  String? phone;
  UserModel({this.id, this.name, this.email, this.password, this.phone});

  @override
  Future<List<UserModel>> select({int? id}) async {
    List<UserModel> data = [];
    await _db.table(tableName).select(id).then((value) {
      for (var model in value) {
        data.add(UserModel(
            id: model['id'].toString(),
            name: model['name'].toString(),
            password: model['password'].toString(),
            email: model['email'].toString(),
            phone: model['phone'].toString()));
      }
    });
    return data;
  }

  @override
  Future<List<UserModel>> selectWhere(String where) async {
    List<UserModel> data = [];
    await _db.table(tableName).selectWhere(where).then((value) {
      for (var model in value) {
        data.add(UserModel(
            id: model['id'].toString(),
            name: model['name'].toString(),
            password: model['password'].toString(),
            email: model['email'].toString(),
            phone: model['phone'].toString()));
      }
    });
    return data;
  }

  @override
  Future<int> insert(Map<String, Object?> row) async {
    return await _db.table(tableName).insert(row).then((value) => value);
  }

  @override
  Future<int> update(Map<String, Object?> row, int id) async {
    return await _db.table(tableName).update(row, id).then((value) => value);
  }

  @override
  Future<int> delete(int id) async {
    return await _db.table(tableName).delete(id).then((value) => value);
  }

  @override
  Future<int> deleteAll() async {
    return await _db.table(tableName).deleteAll().then((value) => value);
  }
}
