import 'package:flutter/material.dart';
import 'package:s_shop_lao/src/services/theme_service.dart';

import 'asset_icon.dart';
import 'button/button.dart';

class InputField extends StatefulWidget {
  const InputField({
    super.key,
    this.hint,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.onClear,
    this.icon,
    this.isActive,
  });
  final String? icon;
  final String? hint;
  final TextEditingController? controller;
  final void Function(String text)? onChanged;
  final void Function(String text)? onSubmitted;
  final void Function()? onClear;
  final bool? isActive;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  late final TextEditingController controller =
      widget.controller ?? TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: widget.isActive ?? true,
      controller: controller,
      onChanged: (value) {
        setState(() {});
        widget.onChanged?.call(value);
      },
      onSubmitted: widget.onSubmitted,
      style: context.typo.headline5.copyWith(
        color: context.color.text,
      ),
      cursorColor: context.color.primary,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
          borderRadius: BorderRadius.circular(12),
        ),

        filled: true,
        fillColor: context.color.hintContainer,

        hintStyle: context.typo.headline5.copyWith(
          fontWeight: context.typo.light,
          color: context.color.onHintContainer,
        ),
        hintText: widget.hint,

        /// padding
        contentPadding: const EdgeInsets.symmetric(
          vertical: 11.5,
          horizontal: 16,
        ),

        prefixIcon: widget.icon != null
            ? Button(
                icon: widget.icon,
                type: ButtonType.flat,
                color: context.color.primary,
                onPressed: () {},
              )
            : null,

        suffixIconColor: context.color.primary,
        suffixIcon: controller.text.isEmpty
            ? null
            : Button(
                icon: 'close',
                type: ButtonType.flat,
                onPressed: () {
                  setState(() {
                    controller.clear();
                    widget.onClear?.call();
                  });
                },
              ),
      ),
    );
  }
}
