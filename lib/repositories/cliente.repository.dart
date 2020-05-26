import 'package:path/path.dart';
import 'package:sc/models/cliente.model.dart';
import 'package:sc/settings.dart';
import 'package:sqflite/sqflite.dart';

class ClienteRepository
{
   Future<Database> getDatabase() async{
      return openDatabase
      (  
        join  (await getDatabasesPath(), DATABASE_NAME),
        onCreate: (db, version)
        {
          return db.execute(CREATE_CLIENTE_TABLE_SCRIPT);
        },
         version: 1,
      );
   }

   Future create(Cliente model) async{
     try
     {
      final Database db = await getDatabase();
      await db.insert(
         TABLE_NAME,
         model.toMap(),
         conflictAlgorithm: ConflictAlgorithm.replace,
      );
     }catch(ex){
           print(ex);
           return;
     }
   }

   Future<List<Cliente>> getClientes() async {
       try
       {
         final Database db = await getDatabase();
         final List<Map<String,dynamic>> maps = await db.query(TABLE_NAME);

         return List.generate(
           maps.length,
           (i){
             return Cliente(
               id: maps[i]['id'],
               nome:maps[i]['name'],
               telefone: maps[i]['telefone'],
               email:maps[i]['email'],
               endereco: maps[i]['endereco'],
             );
           },
         );
       }
       catch(ex){
           print(ex);
           return new List<Cliente>();
       }
   }

   Future delete(int id) async{
     
      try{
       final Database db  = await getDatabase();
       await db.delete(
          TABLE_NAME,
          where:"id = ?",
          whereArgs: [id],
       );
      }
      catch(ex){
        print(ex);
        return;
      }
   }

   Future update(Cliente model) async{
     try{
       final Database db = await getDatabase();
       await db.update(
          TABLE_NAME,
          model.toMap(),
          where: "id = ?",
          whereArgs: [model.id],
       );
     }
     catch(ex){
       print(ex);
       return;
     }
   }

   Future<List<Cliente>> search(String term) async {

      try
      { 
       final Database db = await getDatabase();
       final List<Map<String,dynamic>> maps = await db.query(
          TABLE_NAME,
          where:"name LIKE",
          whereArgs: [
            '%$term%',

          ],
       );
      }
      catch(ex){
           print (ex);
           return new List<Cliente>();
      }

   }

   Future<Cliente> getCliente(int id) async{

       try{
         final Database db = await getDatabase();
         final List<Map<String,dynamic>> maps = await db.query(
           TABLE_NAME,
           where: "id = ?",
           whereArgs: [id],
         );
             return Cliente(
               id: maps[0]['id'],
               nome:maps[0]['nome'],
               telefone: maps[0]['telefone'],
               email:maps[0]['email'],
               endereco: maps[0]['endereco'],
             );
       }
       catch(ex)
       { 
        print(ex);
        return new Cliente(); 
       }
   }
 
   Future updateImage(int id, String imagePath) async{
      try{
         final Database db = await getDatabase();
         final model  = await getCliente(id);
         
         model.image = imagePath;

         await db.update(
            TABLE_NAME,
            model.toMap(),
            where: "id = ?",
            whereArgs: [model.id],
         );
      }catch(ex){
           print(ex);
           return;
      }
   }
}