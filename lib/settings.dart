const  String DATABASE_NAME = "sistemaColeta.db";
const  String TABLE_NAME  = "contract";
const  String CREATE_CONTATCTS_TABLE_SCRIPT = 
       "CREATE TABLE contacts ( id INTEGER PRIMARY key, [name] Text, email Text, phone Text, image Text,addressLine1 Text, addressLine2 Text, latlng Text  )";

const String CREATE_CLIENTE_TABLE_SCRIPT = 
       "CREATE TABLE cliente(id integer primary key, [name] Text)";

const String CREATE_DESCARTE_TABLE_SCRIPT = 
       "CREATE TABLE descarte(id integer primary key, [name] Text)";