class Cliente
{

  int id;
  String nome;
  String endereco;
  String telefone;
  String email;
  String image;

   Cliente
   ({
      this.id,
      this.nome,
      this.endereco,
      this.telefone,
      this.email,
      this.image
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
