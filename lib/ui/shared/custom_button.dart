import 'package:flutter/material.dart';
import 'package:provider_task/utils/text_styles.dart';
import '../../utils/colors.dart';

class CustomButton extends StatelessWidget {
  final Function() onPressed;
  final String label;
  final Color? labelColor;
  final Color? outlineColor;
  final double? height;
  final double? width;
  final Color? fillColor;

  const CustomButton({
    Key? key,
    this.labelColor,
    required this.onPressed,
    required this.label,
    this.outlineColor,
    this.height,
    this.width,
    this.fillColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 0,
      focusElevation: 0,
      hoverElevation: 0,
      highlightElevation: 0,
      disabledElevation: 0,
      fillColor:
          outlineColor == null ? AppColors.primaryColor : AppColors.whiteColor,
      constraints: BoxConstraints.tightFor(
        height: height ?? 48,
        width: width ?? MediaQuery.of(context).size.width.clamp(240.0, 560.0),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(4),
        ),
        side: BorderSide(
          color: outlineColor == null ? AppColors.blackColor : outlineColor!,
          width: 1,
        ),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      child: FittedBox(
        child: Text(
          label,
          style: outlineColor == null
              ? AppTextStyles.buttonTextStyle
              : AppTextStyles.buttonTextStyle.copyWith(
                  color: outlineColor,
                ),
        ),
      ),
    );
  }
}
