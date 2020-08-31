import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sos_deslizamentos_app/models/user_model.dart';
import 'package:sos_deslizamentos_app/widgets/custom_textFormField.dart';
import 'package:sos_deslizamentos_app/widgets/round_button.dart';


class SingUpEndTab extends StatefulWidget {
  @override
  _SingUpEndTabState createState() => _SingUpEndTabState();
}

class _SingUpEndTabState extends State<SingUpEndTab> {

  final _cepController = TextEditingController();
  final _logradouroController = TextEditingController();
  final _bairroController = TextEditingController();
  final _cidadeController = TextEditingController();
  final _estadoController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,

          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.keyboard_arrow_right),
                color: Theme.of(context).primaryColor,
                iconSize: 30.0,
                onPressed: (){}
            ),
          ],
        ),

        body: ScopedModelDescendant<UserModel>(
            builder: (context, child, model) {

              return SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                          children: <Widget>[

                            Container(
                              padding: EdgeInsets.only(top: 20.0),
                              child: Text(
                                "Cadatre seu endereço",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.w300
                                ),
                              ),
                            ),

                            CustomTextFormField(
                                title: "Logradouro",
                                controller: _logradouroController,
                                obscureText: false,
                                hintText: "Rua - número",
                                suffixIcon: null,
                                inputType: TextInputType.text,
                                validator: RequiredValidator(errorText: " ")
                            ),
                            Divider(height: 16.0),

                            CustomTextFormField(
                                title: "Bairro",
                                controller: _bairroController,
                                obscureText: false,
                                hintText: "Bairro",
                                suffixIcon: null,
                                inputType: TextInputType.text,
                                validator: RequiredValidator(errorText: " ")
                            ),
                            Divider(height: 16.0),

                            CustomTextFormField(
                                title: "CEP",
                                controller: _cepController,
                                obscureText: false,
                                hintText: "00000-000",
                                suffixIcon: null,
                                inputType: TextInputType.text,
                                validator: RequiredValidator(errorText: " !")
                            ),
                            Divider(height: 16.0),

                            CustomTextFormField(
                                title: "Cidade",
                                controller: _cidadeController,
                                obscureText: false,
                                hintText: " ",
                                suffixIcon: null,
                                inputType: TextInputType.text,
                                validator: RequiredValidator(errorText: " !")
                            ),
                            Divider(height: 16.0,),

                            CustomTextFormField(
                                title: "Estado",
                                controller: _estadoController,
                                obscureText: false,
                                hintText: " ",
                                suffixIcon: null,
                                inputType: TextInputType.text,
                                validator: RequiredValidator(errorText: " !")
                            ),
                            Divider(height: 16.0,),

                            Container( // button login
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.only(top: 10.0),
                              alignment: Alignment.center,
                              child: RoundButton(
                                  buttonText: "Criar Conta",
                                  backgroundColor: Theme.of(context).primaryColor,
                                  textColor: Colors.white,
                                  functionOnPressed: (){}
                              ),
                            ),

                      ]
                  ),
                ),
              ),
              ),
              );
            }
        )
    );
  }
}
