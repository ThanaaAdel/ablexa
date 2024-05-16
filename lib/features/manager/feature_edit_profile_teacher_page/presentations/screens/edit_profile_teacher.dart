
import 'package:flutter/material.dart';
import '../../../../../core/shared_widgets/appBar_widget.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../generated/l10n.dart';
import '../widgets/image_and_name_profile_teacher.dart';
import '../widgets/text_form_field_profile_manager.dart';

class EditProfileTeacherPage extends StatefulWidget {
   const EditProfileTeacherPage({Key? key, required this.nameTeacher, required this.emailTeacher, required this.imageTeacher, required this.nationalNumber, required this.token, required this.teacherId});
  final String token,nameTeacher,emailTeacher,imageTeacher,nationalNumber,teacherId;
  @override
  State<EditProfileTeacherPage> createState() => _EditProfileTeacherPageState();
}

class _EditProfileTeacherPageState extends State<EditProfileTeacherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView(
        children: [
          AppBarWidget(pageName: S.of(context).my_profile,),
          verticalSpacing(10),
           ImageAndNameProfileTeacher(
             nameTeacher: widget.nameTeacher,
             emailTeacher: widget.emailTeacher,
             imageTeacher: widget.imageTeacher,
           ),
          verticalSpacing(10),
           TextFormFieldProfileManager(
             teacherId: widget.teacherId,
             token: widget.token,
             emailTeacher: widget.emailTeacher,
             nameTeacher: widget.nameTeacher,
             nationalNumber: widget.nationalNumber,
           ),
          verticalSpacing(20),

        ],
      ),
    );
  }
}

