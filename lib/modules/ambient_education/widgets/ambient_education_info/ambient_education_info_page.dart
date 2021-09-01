import 'package:flutter/material.dart';
import 'package:sos_deslizamentos/core/core.dart';
import 'package:sos_deslizamentos/shared/shared_widgets.dart';

class AmbientEducationInfoPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const AmbientEducationInfoPage({
    Key? key,
    required this.image,
    required this.title,
    required this.description
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackground,
      appBar: AppBarWidget(
          typeLeftButton: "back",
          onTappedLeftButton: () { Navigator.pop(context); },
          onTappedRightButton: () { }),
      body: DefaultPageWidget(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            height: 200,
            width: 200,
            decoration: BoxDecoration(
                color: AppColors.yellowLight,
                borderRadius: BorderRadius.circular(40)
            ),
            child: Image.network(image),
          ),
          SizedBox(height: 50),
          Text(title,
              style: TextStyle(
                color: AppColors.textPrimary,
                fontFamily: AppFonts.semiBold,
                fontSize: 24,
              )),
          SizedBox(height: 10),
          Text("     $description",
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: AppColors.textPrimary,
                fontFamily: AppFonts.light,
                fontSize: 14,
              )),
        ],
      ),
    );
  }
}
