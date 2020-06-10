class User
{
 String usuario; String email; String password;

   User
   ({
       this.usuario, this.email,this.password
   });

  Map<String, dynamic> toMap()
  {
    return {
     'nome':usuario,
     'email': email,
     'password': password
    };
  }
}
