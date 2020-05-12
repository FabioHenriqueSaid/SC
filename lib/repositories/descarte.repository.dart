import 'package:path/path.dart';
import 'package:sc/settings.dart';
import 'package:sqflite/sqflite.dart';

class DescarteRepository
{
   Future<Database> getDatabase() async
   {
      return openDatabase
      (  
        join  (await getDatabasesPath(), DATABASE_NAME),
        onCreate: (db, version)
        {
          return db.execute(CREATE_DESCARTE_TABLE_SCRIPT);
        },
         version: 1,
      );
   }
}