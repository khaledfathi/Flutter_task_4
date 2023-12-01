
abstract class Model {
  late String tableName; 
  Future<List> select({int? id});
  Future<List> selectWhere(String where);
  Future<int> insert (Map<String , Object?>row);
  Future<int> update (Map<String , Object?>row , int id) ;
  Future<int> delete (int id); 
  Future<int> deleteAll ();
}
