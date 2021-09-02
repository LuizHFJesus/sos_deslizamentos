import 'package:flutter/material.dart';
import 'package:sos_deslizamentos/core/core.dart';
import 'package:sos_deslizamentos/modules/ambient_education/widgets/ambient_education_info/ambient_education_info_page.dart';
import 'package:sos_deslizamentos/shared/models/ambient_education_model.dart';

class InfoCardWidget extends StatelessWidget {
  final AmbientEducationModel data;

  InfoCardWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
            builder: (_) => AmbientEducationInfoPage(
                  image: data.image,
                  title: data.title,
                  description: data.description,
                )));
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(color: AppColors.greyLight),
            borderRadius: BorderRadius.circular(40),
            boxShadow: [AppShadows.shadowSmall]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(child: Image.network(data.image)),
            SizedBox(height: 10),
            Text(data.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontFamily: AppFonts.medium,
                  fontSize: 12,
                ))
          ],
        ),
      ),
    );
  }
}
