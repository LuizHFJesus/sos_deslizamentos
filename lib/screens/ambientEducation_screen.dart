//import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sos_deslizamentos_app/tabs/ambientEducation_tab.dart';
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
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20.0,
                  crossAxisSpacing: 20.0,
                  childAspectRatio: 0.8
                ),
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index){
                  AmbientEducationData data =
                  AmbientEducationData.fromDocument(snapshot.data.documents[index]);
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.15),
                          blurRadius: 10,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: FlatButton(
                        onPressed: (){
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context)=>AmbientEducationTab(data)
                              )
                          );
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0)
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Image.network(
                                data.image,
                                height: 90.0,
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                data.title,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            ],
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