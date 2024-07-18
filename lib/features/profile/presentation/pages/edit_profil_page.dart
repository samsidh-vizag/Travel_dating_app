import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_dating_app/core/constants/profile_constants/edit_profile_page_constants.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';
import 'package:travel_dating_app/core/widgets/16px_sizedbox.dart';
import 'package:travel_dating_app/core/widgets/24px_sizedbox.dart';
import 'package:travel_dating_app/core/widgets/32px_sizedbox.dart';
import 'package:travel_dating_app/core/widgets/8px_sizedbox.dart';
import 'package:travel_dating_app/core/widgets/back_button.dart';
import 'package:travel_dating_app/core/widgets/elevated_button_widget.dart';
import 'package:travel_dating_app/core/widgets/page_title_widget.dart';
import 'package:travel_dating_app/core/widgets/textfiels_and_title_widget.dart';
import 'package:travel_dating_app/features/profile/presentation/widgets/image_picker_circle_widget.dart';
import 'package:travel_dating_app/features/profile/presentation/widgets/upload_image_widget.dart';

class EditProfilPage extends HookConsumerWidget {
  static const routePath = '/editProfile';
  const EditProfilPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///theme
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;
    final typography = AppTheme.of(context).typography;

    ///constants
    final constants = ref.watch(editProfilePageConstantsProvider);

    ///controller

    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    final numberController = useTextEditingController();
    final heightController = useTextEditingController();
    final dateController = useTextEditingController();
    final weightController = useTextEditingController();
    final jobController = useTextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                const SizedBox24Widget(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: spaces.space_300),
                  child: PageTitleWidget(title: constants.txtEditProfile),
                ),
                const SizedBox16Widget(),
                const ImagePickerCircleWidget(),
                const SizedBox8Widget(),
                TextFieldAndTitleWidget(
                  enabled: true,
                  textFieldTitle: constants.txtName,
                  hintText: constants.txtEnterName,
                  controller: nameController,
                ),
                TextFieldAndTitleWidget(
                  enabled: true,
                  textFieldTitle: constants.txtEmail,
                  hintText: constants.txtEnterEmail,
                  controller: emailController,
                ),
                TextFieldAndTitleWidget(
                  enabled: true,
                  textFieldTitle: constants.txtNumber,
                  hintText: constants.txtEnterNumber,
                  controller: numberController,
                ),
                TextFieldAndTitleWidget(
                  enabled: true,
                  textFieldTitle: constants.txtJob,
                  hintText: constants.txtEnterJob,
                  controller: jobController,
                ),
                TextFieldAndTitleWidget(
                  enabled: true,
                  textFieldTitle: constants.txtDateofBirth,
                  hintText: constants.txtDate,
                  controller: dateController,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width / 2,
                      child: TextFieldAndTitleWidget(
                        enabled: true,
                        textFieldTitle: constants.txtHeight,
                        hintText: constants.txtHeight,
                        controller: heightController,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width / 2,
                      child: TextFieldAndTitleWidget(
                        enabled: true,
                        textFieldTitle: constants.txtWeight,
                        hintText: constants.txtWeight,
                        controller: weightController,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: spaces.space_300,
                    vertical: spaces.space_100,
                  ),
                  child: Row(
                    children: [
                      Text(
                        constants.txtUploadPhoto,
                        style: typography.h600,
                      ),
                    ],
                  ),
                ),
                const SizedBox8Widget(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: spaces.space_300),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      UploadPhotWidget(identifier: 'one'),
                      UploadPhotWidget(identifier: 'two'),
                      UploadPhotWidget(identifier: 'three'),
                    ],
                  ),
                ),
                const SizedBox32Widget(),
                ElevatedButtonWidget(text: constants.txtSave, onPressed: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
