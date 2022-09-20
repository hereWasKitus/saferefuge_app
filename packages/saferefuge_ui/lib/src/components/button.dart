// ignore_for_file: public_member_api_docs
import 'package:flutter/material.dart';
import 'package:saferefuge_ui/src/colors/sr_colors.dart';

class SRElevetedButton extends StatefulWidget {
  const SRElevetedButton({
    super.key,
    required this.onPressed,
    this.child,
    this.primary = SRColors.primary,
  });

  final VoidCallback onPressed;
  final Widget? child;
  final Color primary;

  @override
  State<SRElevetedButton> createState() => _SRElevetedButtonState();
}

class _SRElevetedButtonState extends State<SRElevetedButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 44),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        primary: widget.primary,
      ),
      child: widget.child,
    );
  }
}
