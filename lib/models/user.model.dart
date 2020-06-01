class User
{
 String nome; String email; String password;

   User
   ({
       this.nome, this.email,this.password
   });

  Map<String, dynamic> toMap()
  {
    return {
     'nome':nome,
     'email': email,
     'password': password
    };
  }
}
