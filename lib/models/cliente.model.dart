class Cliente
{

  int id;
  String nome;
  String endereco;
  String telefone;
  String email;

   Cliente
   ({
      this.id,
      this.nome,
      this.endereco,
      this.telefone,
      this.email
   });

 
  Map<String, dynamic> toMap()
  {
    return {
     'id': id,
     'name': nome,
     'phone': endereco,
     'email': telefone,
     'image': email,
    };
  }
}
