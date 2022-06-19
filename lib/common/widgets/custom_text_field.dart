import 'package:oepadmin/common/theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:oepadmin/common/theme/text_theme.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final bool obscure;
  final VoidCallback? onTap;
  final VoidCallback? onEditingCompleted;
  final TextInputType keyboardType;
  final ValueChanged<String> onChanged;
  final bool autofocus;
  final bool enabled;
  final String? errorText;
  final String? label;
  final Widget? suffix;
  final Widget? prefix;
  final String? hintText;
  final String? prefixText;
  final int? maxLength;
  final bool? readOnly;
  final int? minLines;
  final int? maxLines;
  final TextCapitalization? textCapitalization;
  final Color? bgColor;

  const CustomTextField(
      {Key? key,
      this.controller,
      this.validator,
      this.keyboardType = TextInputType.text,
      this.obscure = false,
      this.onTap,
      this.autofocus = false,
      this.errorText,
      this.label,
      this.suffix,
      this.prefix,
      this.enabled = true,
      this.hintText,
      this.onEditingCompleted,
      required this.onChanged,
      this.prefixText,
      this.maxLength,
      this.readOnly,
      this.minLines,
      this.textCapitalization,
      this.maxLines = 1,
      this.bgColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: bgColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      child: TextFormField(
          enableInteractiveSelection: true,
          readOnly: readOnly ?? false,
          minLines: minLines,
          maxLines: maxLines,
          onChanged: onChanged,
          onEditingComplete: onEditingCompleted,
          autovalidateMode: AutovalidateMode.disabled,
          autofocus: autofocus,
          maxLength: maxLength,
          onTap: onTap,
          enabled: enabled,
          obscureText: obscure,
          keyboardType: keyboardType,
          controller: controller,
          textCapitalization: textCapitalization ?? TextCapitalization.none,
          decoration: InputDecoration(
              prefixIconColor: AppColors.iconGrey,
              counterText: "",
              hintText: hintText,
              prefixText: prefixText,
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.primaryColor,width: 2),
                  borderRadius: BorderRadius.circular(4)),
              prefixStyle:
                  const TextStyle(color: AppColors.textBlack, fontSize: 16),
              errorText: errorText,
              prefixIcon: prefix,
              suffixIcon: suffix,
              // labelText: label,
              fillColor: AppColors.primaryGrey,
              focusColor: AppColors.primaryGrey,
              hoverColor: AppColors.primaryGrey,
              hintStyle: OMSTextStyles.hintText,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              errorBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none),
          validator: validator),
    );
  }
}
