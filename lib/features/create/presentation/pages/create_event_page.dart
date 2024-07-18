import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_dating_app/core/constants/create_trip_constants/create_event_page_constants.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';
import 'package:travel_dating_app/core/widgets/16px_sizedbox.dart';
import 'package:travel_dating_app/core/widgets/32px_sizedbox.dart';
import 'package:travel_dating_app/core/widgets/back_button.dart';
import 'package:travel_dating_app/core/widgets/button_eleveted_widget.dart';
import 'package:travel_dating_app/core/widgets/elevated_button_widget.dart';
import 'package:travel_dating_app/core/widgets/textfiels_and_title_widget.dart';
import 'package:travel_dating_app/features/create/presentation/pages/create_schedule_page.dart';
import 'package:travel_dating_app/features/create/presentation/widgets/image_container.dart';

class CreateEventPage extends HookConsumerWidget {
  static const routePath = '/createEvent';
  const CreateEventPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///theme
    final colors = AppTheme.of(context).colors;

    ///constants
    final constants = ref.watch(createEventPageConstantsProvider);

////controller
    final titleController = useTextEditingController();
    final detailsController = useTextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
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
                  const SizedBox16Widget(),
                  const ImageContainer(),
                  TextFieldAndTitleWidget(
                    enabled: true,
                    textFieldTitle: constants.txtTripTitle,
                    hintText: constants.txtEnterTripTitle,
                    controller: titleController,
                  ),
                  TextFieldAndTitleWidget(
                    enabled: true,
                    textFieldTitle: constants.txtTripDetails,
                    hintText: constants.txtEnterTripDetails,
                    controller: detailsController,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width / 2,
                        child: TextFieldAndTitleWidget(
                          enabled: true,
                          textFieldTitle: constants.txtStartDate,
                          hintText: constants.txtDate,
                          controller: titleController,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width / 2,
                        child: TextFieldAndTitleWidget(
                          enabled: true,
                          textFieldTitle: constants.txtEndDate,
                          hintText: constants.txtDate,
                          controller: titleController,
                        ),
                      ),
                    ],
                  ),
                  ButtonElevatedWidget(
                    text: constants.txtSchedule,
                    onPressed: () {
                      context.push(CreateSchedulePage.routePath);
                    },
                  ),
                  const SizedBox32Widget(),
                  ElevatedButtonWidget(
                    text: constants.txtContinue,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
