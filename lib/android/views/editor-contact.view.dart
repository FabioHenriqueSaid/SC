import 'package:sc/models/contact.model.dart';
import 'package:flutter/material.dart';
import 'package:sc/repositories/contract.repository.dart';

class EditorContactView extends StatefulWidget {
  final ContactModel model;

  EditorContactView({this.model});

  @override
  _EditorContactViewState createState() => _EditorContactViewState();
}

class _EditorContactViewState extends State<EditorContactView> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = new GlobalKey<ScaffoldState>();
  final _repository = ContractRepository();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:_scaffoldKey,
      appBar: AppBar(
        title: widget.model.id == 0 
        ? Text("Novo Contato") 
        : Text("Editar Contato"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          key:_formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Nome",
                ) ,
                keyboardType: TextInputType.text,
                initialValue: widget.model?.name,
                onChanged: (val) {
                  widget.model.name = val;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText:"Telefone",
                ),
                keyboardType: TextInputType.number,
                initialValue: widget.model?.phone,
                onChanged: (val) {
                  widget.model.phone = val;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Email",
                ),
                keyboardType: TextInputType.emailAddress,
                initialValue: widget.model?.email,
                onChanged: (val) {
                  widget.model.email = val;
                },
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 50,
                child: FlatButton.icon(
                  color: Theme.of(context).primaryColor,
                  onPressed: () {},
                  icon: Icon(
                    Icons.save,
                    color: Theme.of(context).accentColor,
                  ),
                  label: Text(
                    "Salvar",
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
