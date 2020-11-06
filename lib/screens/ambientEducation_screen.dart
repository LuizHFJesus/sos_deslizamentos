import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sos_deslizamentos_app/ambientEducation_tab.dart';
import 'package:sos_deslizamentos_app/data/ambientEducation_data.dart';

class AmbientEducationScreen extends StatefulWidget {
  @override
  _AmbientEducationScreenState createState() => _AmbientEducationScreenState();
}

class _AmbientEducationScreenState extends State<AmbientEducationScreen> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: Firestore.instance.collection('ambientEducation').getDocuments(),
      builder: (context, snapshot){
        if(!snapshot.hasData){
          return Center(child: CircularProgressIndicator(),);
        } else {
          return GridView.builder(
            padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              childAspectRatio: 0.68
            ),
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index){
              AmbientEducationData data = AmbientEducationData.fromDocument(snapshot.data.documents[index]);
              return Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 6,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: InkWell(
                      onTap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context)=>AmbientEducationTab(data)
                          )
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: Image.network(
                                    data.image,
                                    fit: BoxFit.cover
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  data.title,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                  ),
              );
            }
          );
        }
      }
    );
  }
}
