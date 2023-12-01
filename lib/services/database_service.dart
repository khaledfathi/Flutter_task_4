
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:task_l4/constants/database_const.dart';

class DatabaseService {

  Database? db ; 
  String tableName =''; 
  int version = 1; 

  Future<Database> connect ()async{
    String databasePath  = await getDatabasesPath(); 
    String path = join(databasePath , DATABASE_NAME); 
    Database currentDB = await openDatabase(path, onCreate: _onCreate , version: 1); 
    return currentDB; 
  }

  Future<void> _onCreate(Database db , int version) async{
    await db.execute('''
      CREATE TABLE "users" (
        "id"	INTEGER,
        "name"	TEXT NOT NULL,
        "password"	TEXT NOT NULL,
        "email"	TEXT NOT NULL UNIQUE,
        "phone"	TEXT NOT NULL UNIQUE,
        PRIMARY KEY("id" AUTOINCREMENT)
      );
    '''); 
    print ("OnCreate : build database [ok]"); 
  }

  
  Future initDB() async {
     db =  db == null ? await connect() : null; 
  }
  
  Future<void> disconnect() async {
    if (db != null ) await db!.close(); 
  }

  Future deleteDatabase ()async{
    await databaseFactory.deleteDatabase(join(await getDatabasesPath() ,DATABASE_NAME)); 
  }

  DatabaseService table (String table){
    tableName = table; 
    return this;
  }

  Future<List<Map<String , Object?>>> select(int? id)async {
    if (id == null){
      return await db!.query(tableName);
    }else {
      return await db!.query(tableName , where: 'id = $id') ;
    }
  }
  
  Future<List<Map<String , Object?>>> selectWhere(String where)async {
    return await db!.query(tableName , where: where); 
  }


  Future<int> insert (Map<String , Object?> row)async {
    try {
      return await db!.insert(tableName, row); 
    } catch (e) {
      print (e) ; 
    }
    return 0; 
  }

  Future<int>  update (Map<String , Object?> row , int id)async {
    try {
      return await db!.update(tableName, row ,where: 'id=$id'); 
    } catch (e) {
     print (e) ; 
    }
    return 0; 
  }

  Future<int>  delete (int id)async {
    return await db!.delete(tableName , where: 'id = $id'); 
  }

  Future<int>  deleteAll ()async {
    return await db!.delete(tableName); 
  }


  
  
}