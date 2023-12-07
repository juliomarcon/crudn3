import 'package:crudn3/field_form.dart';
import 'package:crudn3/user.dart';
import 'package:crudn3/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'container_all.dart';



class UserView extends StatelessWidget {
  UserView({super.key});

  String title = "Show User";

  TextEditingController controllerNome = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerSenha = TextEditingController();

  @override
  Widget build(BuildContext) {
    void save() {
      UserProvider userProvider = UserProvider.of(context) as UserProvider;

      int? index;

      if(userProvider.indexUser != null){
        index=userProvider.indexUser;
        controllerNome.text=userProvider.userSelected!.nome;
        controllerEmail.text=userProvider.userSelected!.email;
        controllerSenha.text=userProvider.userSelected!.senha;

        setState (() {
          this.title = "Edit User";
        });
      }

      User user = User(
          nome: controllerNome.text,
          email: controllerEmail.text,
          senha: controllerSenha.text);
      if (index != null) {
        //editar
        userProvider.users[index] = user;
      } else{

      
      int usersLength = userProvider.users.length;

      //Salva um novo usuário
      userProvider.users.insert(usersLength, user);
      }
      Navigator.popAndPushNamed(context, "/list");
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
        actions: [
          Container(
            child: TextButton(
              child: Text('User List'),
              onPressed: (){
                Navigator.popAndPushNamed(context, "/list")
              },
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              border: BorderRadius(Radius.circular(8))
            ),
            margin: EdgeInsets.all(8),
            
          )
        ],
      ),
      body: Center(
        child: Column(children: [
          FieldForm(
            label: 'Nome',
            isSenha: false,
            controller: controllerNome,
          ),
          FieldForm(
            label: 'Email',
            isSenha: false,
            controller: controllerEmail,
          ),
          FieldForm(
            label: 'Senha',
            isSenha: true,
            controller: controllerSenha,
          ),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: save,
              child: Text('Salvar'),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Theme.of(context).primaryColor),
                foregroundColor: MaterialStateProperty.all(Colors.white),
              ),
            ),
          )
        ]),
      ),
    );
    //);
  }
}
