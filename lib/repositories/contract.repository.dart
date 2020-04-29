import 'package:path/path.dart';
import 'package:sc/settings.dart';
import 'package:sqflite/sqflite.dart';

class ContractRepository
{
   Future<Database> _getDatabase() async
   {
      return openDatabase
      (  
        join  (await getDatabasesPath(), DATABASE_NAME),
        onCreate: (db, version){
        }
      )
      ;
   }
}