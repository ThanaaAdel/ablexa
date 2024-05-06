import 'package:ablexa/features/manager/feature_home_manager_page/logic/cubits/delete_user_cubit/delete_user_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/Routing/routers.dart';
import '../../../../../core/helper/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/image_manager.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../generated/l10n.dart';
class TeacherCard extends StatelessWidget {
  final String name, type, image,id,token;

  const TeacherCard({
    Key? key,
    required this.name,

    required this.type,
    required this.image, required this.id, required this.token
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorsManager.mainWhite,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25.sp,
               backgroundImage: NetworkImage(image)),
              horizontalSpacing(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(name, style: TextStyles.font12BlackBold),
                  verticalSpacing(10),
                  Text(
                    type,
                    style: TextStyles.font14MediumLightBlack.copyWith(fontSize: 12.sp),
                  ),
                ],
              ),
            ],
          ),
          horizontalSpacing(10), // Add horizontal spacing
          PopupMenuButton<String>(
            onSelected: (String value) {
              if (value == 'view_profile') {
                // Handle view profile action
                print('View Profile selected');
              } else if (value == 'delete') {
                // Handle delete action
                print('Delete selected');
              }
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                onTap: () {

                      context.pushNamed(Routes.teacherProfilePage);
                },
                value: 'view_profile',
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Text(S.of(context).view_profile),
                ),
              ),
              PopupMenuItem(
                onTap: (){
                  context.read<DeleteUserCubit>().emitDeleteUserStates(token: token,userId: id);
                },
                value: 'delete',
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Text(S.of(context).delete),
                ),
              ),
            ],
            icon: Image.asset(ImageManager.settingIcon),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            color: ColorsManager.grey, // Background color
            elevation: 4, // Add elevation for shadow effect
          ),
        ],
      ),
    );
  }
}
