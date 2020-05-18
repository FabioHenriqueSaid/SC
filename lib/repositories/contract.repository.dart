import 'package:path/path.dart';
import 'package:sc/models/contact.model.dart';
import 'package:sc/settings.dart';
import 'package:sqflite/sqflite.dart';

class ContractRepository
{
   Future<Database> getDatabase() async
   {
      return openDatabase
      (  
        join  (await getDatabasesPath(), DATABASE_NAME),
        onCreate: (db, version)
        {
          return db.execute(CREATE_CONTATCTS_TABLE_SCRIPT);
        },
         version: 1,
      );
   }
   Future create(ContactModel model) async{
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
  
   Future<List<ContactModel>> getContacts() async {
       try
       {
         final Database db = await getDatabase();
         final List<Map<String,dynamic>> maps = await db.query(TABLE_NAME);

         return List.generate(
           maps.length,
           (i){
             return ContactModel(
               id: maps[i]['id'],
               name:maps[i]['name'],
               phone: maps[i]['phone'],
               email:maps[i]['email'],
               image: maps[i]['image'],
               addressLine1: maps[i]['addressLine1'],
               addressLine2: maps[i]['addressLine2'],
               latLng: maps[i]['lating'],
             );
           },
         );
       }
       catch(ex){
           print(ex);
           return new List<ContactModel>();
       }
   }

   Future<List<ContactModel>> search(String term) async {

      try
      { 
       final Database db = await getDatabase();
       final List<Map<String,dynamic>> maps = await db.query(
          TABLE_NAME,
          where:"name LIKE",
          whereArgs: [
            '%$term%'
          ],
       );
      }
      catch(ex){
           print (ex);
           return new List<ContactModel>();
      }

   }
}