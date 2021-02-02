import "package:flutter/material.dart";
import 'package:scoped_model/scoped_model.dart';
import 'package:sos_deslizamentos_app/models/user_model.dart';
import 'package:sos_deslizamentos_app/widgets/round_button.dart';
import 'package:sos_deslizamentos_app/widgets/text_alternative_question_button.dart';

class DangerForm extends StatefulWidget {
  @override
  _DangerFormState createState() => _DangerFormState();
}

class _DangerFormState extends State<DangerForm> {

  final _pageController = PageController();
  int _currentIndex = 0;
  int _dangerCount = 0;

  void goToNextPage() {
    _currentIndex++;
    _pageController.jumpToPage(_currentIndex);
  }

  Widget Question1(){
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
        child: Column(
          children: <Widget>[
            Text(
              "Qual é o material utilizado na construção de sua moradia?",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0,),
            TextAlternativeQuestionButton(
              buttonText: "Alvenaria",
              functionOnPressed: () {
                _dangerCount+= 0;
                goToNextPage();
              },
            ),
            TextAlternativeQuestionButton(
              buttonText: "Madeira",
              functionOnPressed: () {
                _dangerCount+= 2;
                goToNextPage();
              },
            ),
            TextAlternativeQuestionButton(
              buttonText: "Alvenaria e Madeira",
              functionOnPressed: () {
                _dangerCount+= 1;
                goToNextPage();
              },
            ),
          ],
        ),
      ),
    );
  }
  Widget Question2(){
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
        child: Column(
          children: <Widget>[
            Text(
              "Primeira Pergunta",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0,),

          ],
        ),
      ),
    );
  }




  List<Widget> _screens = [
    Container(decoration: BoxDecoration(color: Colors.redAccent),),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text("Formulário de Risco", style: TextStyle(fontWeight: FontWeight.bold),),
          centerTitle: true,
        ),

        body: ScopedModelDescendant<UserModel>(
            builder: (context, child, model) {

              return PageView(
                controller: _pageController,
                physics:  AlwaysScrollableScrollPhysics(),
                children: <Widget>[
                  Question1(),
                  Question2(),

                ],
                scrollDirection: Axis.horizontal,
              );
            }
        )
    );
  }
}