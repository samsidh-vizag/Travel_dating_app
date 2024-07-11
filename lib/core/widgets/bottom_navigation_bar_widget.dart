import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_dating_app/core/constants/app_asset_constants.dart';
import 'package:travel_dating_app/core/theme/app_theme.dart';
import 'package:travel_dating_app/core/widgets/under_contaction.dart';
import 'package:travel_dating_app/features/chat/presentation/pages/chat_page.dart';
import 'package:travel_dating_app/features/home/presentation/pages/home_page.dart';

class BottomNaviWidget extends HookConsumerWidget {
  static const routePath = '/bottomNav';
  const BottomNaviWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// Theme data
    final space = AppTheme.of(context).spaces;
    final assets = ref.watch(appAssetConstantsProvider);

    final pageController = usePageController();
    final selectedIndex = ref.watch(navbarSelectedPageProvider);
    final navbarIcons = useMemoized(() => [
          assets.icHome,
          assets.icChat,
          assets.icHeart,
          assets.icAdds,
        ]);

    // Function to handle page changes in a PageView
    void handlePageChange(int value) {
      pageController.animateToPage(
        value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }

    final theme = AppTheme.of(context);
    return Scaffold(
      extendBody: true,
      body: PageView(
        controller: pageController,
        onPageChanged: (value) =>
            ref.read(navbarSelectedPageProvider.notifier).state = value,
        children: const [
          HomePage(),
          ChatPage(),
          UnderConstractionWidget(),
          UnderConstractionWidget(),
        ],
      ),
      bottomNavigationBar: Card(
        margin: EdgeInsets.all(space.space_200),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: theme.colors.bottomNavBorder),
          borderRadius: BorderRadius.circular(
            space.space_150,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        elevation: 5,
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          useLegacyColorScheme: false,
          elevation: 1,
          onTap: (value) {
            handlePageChange(value);
          },
          items: [
            for (var i = 0; i < navbarIcons.length; i++)
              BottomNavigationBarItem(
                  backgroundColor: theme.colors.secondary,
                  icon: Center(
                    child: Container(
                      width: space.space_900,
                      height: space.space_500,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(space.space_100),
                        color: selectedIndex == i
                            ? theme.colors.textSubtlest
                            : theme.colors.secondary,
                      ),
                      child: Center(
                          child: Image.asset(
                        navbarIcons[i],
                        height: space.space_300,
                        width: space.space_300,
                        color: theme.colors.primary,
                      )),
                    ),
                  ),
                  label: ''),
          ],
        ),
      ),
    );
  }
}

final navbarSelectedPageProvider = StateProvider((ref) => 0);
