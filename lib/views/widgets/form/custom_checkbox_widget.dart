import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_screen/core/themes/app_colors.dart';

class CustomCheckboxWidget extends StatefulWidget {
  final String label;
  final double? size;
  final double? iconSize;
  final Function onChange;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? borderColor;
  final IconData? icon;
  final bool isChecked;

  const CustomCheckboxWidget({
    super.key,
    required this.label,
    this.size,
    this.iconSize,
    required this.onChange,
    this.backgroundColor,
    this.iconColor,
    this.icon,
    this.borderColor,
    required this.isChecked,
  });

  @override
  State<CustomCheckboxWidget> createState() => _CustomCheckboxWidgetState();
}

class _CustomCheckboxWidgetState extends State<CustomCheckboxWidget> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    isChecked = widget.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
          widget.onChange(isChecked);
        });
      },
      child: Row(
        children: [
          AnimatedContainer(
            height: widget.size ?? 26,
            width: widget.size ?? 26,
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastLinearToSlowEaseIn,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: isChecked
                  ? widget.backgroundColor ?? Colors.blue
                  : Colors.transparent,
              border: Border.all(
                color: widget.borderColor ?? AppColors.secondary,
                width: 1,
              ),
            ),
            child: isChecked
                ? Icon(
                    widget.icon ?? Icons.check,
                    color: widget.iconColor ?? const Color(0xFF000C14),
                    size: widget.iconSize ?? 20,
                  )
                : null,
          ),
          const SizedBox(width: 8),
          Text(
            widget.label,
            style: GoogleFonts.manrope(
              fontSize: 14,
              color: const Color(0xFF000C14),
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
