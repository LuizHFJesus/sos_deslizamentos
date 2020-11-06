import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sos_deslizamentos_app/widgets/functionality_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.0),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[

            Container(
              margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 16.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                gradient: LinearGradient(
                  colors: [
                    Colors.lightBlue[700],
                    Colors.lightBlue[400],
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.7),
                    blurRadius: 6,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: <Widget>[
                    //     Text(
                    //       "Risco de deslizamentos:",
                    //       style: TextStyle(
                    //         fontSize: 16.0,
                    //         color: Colors.white,
                    //         fontWeight: FontWeight.w300
                    //       ),
                    //     ),
                    //     FlatButton(
                    //       padding: EdgeInsets.zero,
                    //       child: Text(
                    //         "Ver detalhes >",
                    //         style: TextStyle(
                    //           fontSize: 12.0,
                    //           color: Colors.white,
                    //           fontWeight: FontWeight.w300
                    //         ),
                    //       ),
                    //       onPressed: (){},
                    //     ),
                    //   ],
                    // ),
                    SizedBox(height: 32.0,),
                    Text(
                      "Em breve...",
                      style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
                    Text(
                      "Nível de risco para deslizamentos.",
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w300
                      ),
                    ),
                    SizedBox(height: 36.0,),
                    // SizedBox(height: 16.0),
                    // Text(
                    //   "9.6/10",
                    //   style: TextStyle(
                    //     fontSize: 16.0,
                    //     color: Colors.white,
                    //     fontWeight: FontWeight.w300
                    //   ),
                    // ),
                    // SizedBox(height: 16.0)
                  ],
                ),
              )
            ),
            Container(decoration: BoxDecoration(color: Colors.grey[200],),height: 16.0,),

            Container(
              margin: EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    "Funcionalidades",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            FunctionalityCard(
              icon: Icon(Icons.book, size: 35.0,),
              title: "Educação Ambiental",
              description: "Informações sobre deslizamentos de terras.",
            ),
            Padding(padding: EdgeInsets.only(left: 67.0), child: Divider(),),
            FunctionalityCard(
              icon: Icon(Icons.report_problem, size: 35.0,),
              title: "Reportar problemas",
              description: "Reporte algum problema em sua região.",
            ),
            Padding(padding: EdgeInsets.only(left: 67.0), child: Divider(),),
            FunctionalityCard(
              icon: Icon(Icons.person, size: 35.0,),
              title: "Perfil",
              description: "Acesse os seus dados ou realize alterações.",
            ),
            SizedBox(height: 8.0,),

            Container(decoration: BoxDecoration(color: Colors.grey[200],),height: 16.0,),


            Container(
              margin: EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    "Disque Defesa Civil",
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Container(
              margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 12.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                gradient: LinearGradient(
                  colors: [
                    Colors.red[700],
                    Colors.red[400],
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.7),
                    blurRadius: 6,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: FlatButton(
                onPressed: (){},
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 20.0,),
                      Text(
                        "199",
                        style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                      ),
                      Text(
                        "Todos estados do Brasil",
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w300
                        ),
                      ),
                      SizedBox(height: 24.0,),
                    ],
                  ),
                )
              )
            ),

          ],
        ),
      ),
    );
  }
}

