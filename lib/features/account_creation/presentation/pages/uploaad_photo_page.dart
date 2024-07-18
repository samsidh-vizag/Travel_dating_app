import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_dating_app/core/constants/account_creation_contants/upload_photo_page_constants.dart';
import 'package:travel_dating_app/core/constants/app_asset_constants.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';
import 'package:travel_dating_app/core/widgets/16px_sizedbox.dart';
import 'package:travel_dating_app/core/widgets/24px_sizedbox.dart';
import 'package:travel_dating_app/core/widgets/32px_sizedbox.dart';
import 'package:travel_dating_app/core/widgets/back_button.dart';
import 'package:travel_dating_app/core/widgets/elevated_button_widget.dart';
import 'package:travel_dating_app/core/widgets/headding_text_widget.dart';
import 'package:travel_dating_app/core/widgets/image_picker_widget.dart';
import 'package:travel_dating_app/core/widgets/progressbar_container.dart';
import 'package:travel_dating_app/core/widgets/sub_heading_text-widget.dart';
import 'package:travel_dating_app/features/account_creation/presentation/pages/location_permission_page.dart';
import 'package:travel_dating_app/features/account_creation/presentation/widget/photo_upload_circle_widget.dart';

class UploaadePhotoPage extends HookConsumerWidget {
  static const routePath = '/uploadPhoto';
  const UploaadePhotoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///constants
    final constants = ref.watch(uploadPhotoPageConstantsProvider);
    final assets = ref.watch(appAssetConstantsProvider);

    ///theme
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color(0xFFFEF7F8), colors.secondary],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Row(
                children: [
                  BackArrowButton(),
                ],
              ),
              HeaddingTextWidget(text: constants.txtHeading),
              SubHeaddingTextWidget(text: constants.txtSubHeading),
              const SizedBox16Widget(),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: spaces.space_400 * 3,
                ),
                child: ProgressbarContainer(
                  stepOne: colors.primary,
                  stepTwo: colors.primary,
                  stepThree: colors.primary,
                  stepFour: colors.primary,
                  stepFive: colors.primary,
                ),
              ),
              const SizedBox32Widget(),
              Stack(
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    height: 340,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            assets.imgBackgroundPhoto,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Container(
                          height: spaces.space_100 * 23,
                          width: spaces.space_100 * 23,
                          decoration: BoxDecoration(
                            color: colors.secondary,
                            shape: BoxShape.circle,
                          ),
                          child: ImagePickerWidget(
                            identifier: 'main',
                            widgets: SizedBox(
                              height: 40,
                              width: 40,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    assets.icAddImage,
                                    // ignore: deprecated_member_use
                                    color: colors.primary,
                                  ),
                                  Text(constants.txtAddImage),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 170,
                    left: 16,
                    child: PhotoUploadCircleWidget(
                      identifier: 'circle1',
                      height: spaces.space_100 * 12,
                      width: spaces.space_100 * 12,
                      radius: spaces.space_50 * 4,
                      iconSize: spaces.space_200,
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: 32,
                    child: PhotoUploadCircleWidget(
                      identifier: 'circle2',
                      height: spaces.space_100 * 10,
                      width: spaces.space_100 * 10,
                      radius: spaces.space_50 * 3,
                      iconSize: spaces.space_50 * 3,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 180,
                    child: PhotoUploadCircleWidget(
                      identifier: 'circle3',
                      height: spaces.space_100 * 9,
                      width: spaces.space_100 * 9,
                      radius: spaces.space_50 * 2.5,
                      iconSize: spaces.space_150,
                    ),
                  ),
                  Positioned(
                    top: 16,
                    left: 120,
                    child: PhotoUploadCircleWidget(
                      identifier: 'circle4',
                      height: spaces.space_100 * 8,
                      width: spaces.space_100 * 8,
                      radius: spaces.space_125,
                      iconSize: spaces.space_125,
                    ),
                  ),
                  Positioned(
                    bottom: 88,
                    right: 60,
                    child: PhotoUploadCircleWidget(
                      identifier: 'circle5',
                      height: spaces.space_100 * 6,
                      width: spaces.space_100 * 6,
                      radius: spaces.space_100,
                      iconSize: spaces.space_100,
                    ),
                  ),
                ],
              ),
              const SizedBox24Widget(),
              SizedBox(
                height: spaces.space_500,
              ),
              ElevatedButtonWidget(
                color: colors.primary,
                text: constants.txtComplete,
                onPressed: () {
                  context.push(LocationPermissionPage.routePath);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
