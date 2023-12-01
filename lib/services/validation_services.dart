import 'package:task_l4/globals.dart' as globals;

class Validation {

  String text ; 
   
  //rules  
  bool _length = true ; 
  bool _unique = true ; 
  bool _required = true ; 
  bool _numeric = true ; 
  bool _email = true ; 

  Validation(this.text); 

  Validation length ({required int minLength , int? maxLength}){
    if (maxLength != null){
      _length = text.length >= minLength && text.length <= maxLength;
    }else {
      _length = text.length >= minLength; 
    }
    return this; 
  }

  Validation numeric (){
    try {
      int.parse(text); 
    } catch (e) {
      _numeric = false;
    }
    return this ; 
  }

  Future<Validation> unique (String table , String column) async{
    await globals.db.table(table).selectWhere('$column  = "$text"').then((queryResult){
      _unique = queryResult.isEmpty; 
    }); 
    return this; 
  }
  
  Validation required(){
    _required = text.isNotEmpty; 
    return this; 
  }   
  Validation email (){
    _email = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$' , caseSensitive: false ).hasMatch(text); 
    return this; 
  }

  bool validate(){
    return (
      _length &&
      _unique &&
      _required &&
      _numeric
    ) ;
  }

 
}