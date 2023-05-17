import 'package:chatapp/Features/chat/presentation/manger/chat_cubit/chat_cubit.dart';
import 'package:chatapp/core/utils/constants/functions.dart';
import 'package:chatapp/core/utils/constants/styles.dart';
import 'package:chatapp/core/widgets/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/variables.dart';
import '../../data/models/user_model.dart';
import 'drawer_widgets/header.dart';
import 'drawer_widgets/settings.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
    required this.userdata,
  }) : super(key: key);

  final UserModel? userdata;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit, ChatState>(listener: (context, state) {
      if (state is ChatErrorLogoutState) {
        myToast(state: state.errMessage, toastState: ToastState.error);
      } else if (state is ChatSuccessLogoutState) {
        AppFunctions.leave(context: context);
      } else if (state is ChatLoadingLogoutState) {
        AppFunctions.loadingPage(context: context);
      }
    }, builder: (context, state) {
      return Drawer(
        //backgroundColor: AppColors.deepDark,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            HeaderDrawer(userdata: userdata),
            SizedBox(
              height: 20.h,
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: AppColors.lightDark,
                size: 35.sp,
              ),
              title: Text(
                'Settings',
                style: AppStyles.drawerStyles,
              ),
              onTap: () {
                AppFunctions.push(
                    context: context, screen: const SettingScreen());
              },
            ),
            SizedBox(
              height: 10.h,
            ),
            ListTile(
              leading: Icon(
                Icons.share,
                color: AppColors.lightDark,
                size: 35.sp,
              ),
              title: Text(
                'Share',
                style: AppStyles.drawerStyles,
              ),
              onTap: () {
                Share.share(
                    '''*Rasel app*\nU can develop it from my github \n https://github.com/Ahmd1Khald/chat_app ''');
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 10.h,
            ),
            ListTile(
              leading: Icon(
                Icons.rate_review,
                color: AppColors.lightDark,
                size: 35.sp,
              ),
              title: Text(
                'Rate',
                style: AppStyles.drawerStyles,
              ),
              onTap: () async {
                if (!await launchUrl(AppVariables.appUrl,
                    mode: LaunchMode.externalApplication)) {
                  throw 'Could not launch ${AppVariables.appUrl}';
                }
              },
            ),
            SizedBox(
              height: 10.h,
            ),
            ListTile(
              leading: Icon(
                Icons.login,
                color: AppColors.lightDark,
                size: 35.sp,
              ),
              title: Text(
                'Logout',
                style: AppStyles.drawerStyles,
              ),
              onTap: () {
                ChatCubit.get(context).logout();
              },
            ),
          ],
        ),
      );
    });
  }
}
