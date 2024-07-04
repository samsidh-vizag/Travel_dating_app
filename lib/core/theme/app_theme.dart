import 'package:flutter/material.dart';
import 'package:travel_dating_app/core/theme/extensions/box_shadow_extension.dart';
import 'package:travel_dating_app/core/theme/extensions/color_extension.dart';
import 'package:travel_dating_app/core/theme/extensions/space_extension.dart';
import 'package:travel_dating_app/core/theme/extensions/typography_extension.dart';

final class AppTheme {
  final BuildContext context;

  AppTheme.of(this.context);

  AppColorExtension get colors {
    return Theme.of(context).extension<AppColorExtension>()!;
  }

  AppSpaceExtension get spaces {
    return Theme.of(context).extension<AppSpaceExtension>()!;
  }

  AppTypographyExtension get typography {
    return Theme.of(context).extension<AppTypographyExtension>()!;
  }

  AppBoxShadowExtension get boxShadow {
    return Theme.of(context).extension<AppBoxShadowExtension>()!;
  }
}
