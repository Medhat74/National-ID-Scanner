import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/colors/app_colors.dart';
import '../styles/texts/app_text_styles.dart';

class DefaultTextFormField extends StatefulWidget {
  int? maxLength;
  bool isEnabled;
  bool required;
  bool isPassword;
  bool isFilled;
  bool hasBorder;
  bool autoFocus;
  bool readOnly;
  double contentPaddingVertical;
  double contentPaddingHorizontal;
  double borderRadius;
  double borderSideWidth;
  double enabledBorderRadius;
  Color enabledBorderRadiusColor;
  final String? validationMsg;
  final TextInputType textInputType;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Function? onPressSuffixIcon;
  final Function? onFilledSubmit;
  final Function? onChange;
  final Function? validation;
  final Function? onTap;
  final String labelText;
  final TextEditingController controller;

  DefaultTextFormField({
    Key? key,
    this.isPassword = false,
    this.autoFocus = false,
    this.readOnly = false,
    this.isFilled = false,
    this.hasBorder = false,
    this.required = true,
    this.isEnabled = true,
    this.borderSideWidth = 2.0,
    this.contentPaddingHorizontal = 10.0,
    this.contentPaddingVertical = 10.0,
    this.borderRadius = 10.0,
    this.enabledBorderRadius = 10.0,
    this.enabledBorderRadiusColor = Colors.grey,
    this.maxLength,
    required this.labelText,
    required this.textInputType,
    required this.controller,
    this.onFilledSubmit,
    this.onChange,
    this.onTap,
    this.onPressSuffixIcon,
    this.validation,
    this.suffixIcon,
    this.prefixIcon,
    this.validationMsg,
  }) : super(key: key);

  @override
  State<DefaultTextFormField> createState() => _DefaultTextFormFieldState();
}

class _DefaultTextFormFieldState extends State<DefaultTextFormField> {
  late FocusNode myFocusNode;
  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
    myFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: widget.maxLength,
      style: AppTextStyle.bodyText(),
      readOnly: widget.readOnly,
      obscureText: widget.isPassword,
      focusNode: myFocusNode,
      autofocus: widget.autoFocus,
      enabled: widget.isEnabled,
      controller: widget.controller,
      keyboardType: widget.textInputType,
      onFieldSubmitted: (String? value) {
        if (widget.onFilledSubmit != null) {
          widget.onFilledSubmit!();
        }
      },
      onChanged: (String? value) {
        if (widget.onChange != null) {
          widget.onChange!(value);
        }
      },
      onTap: () {
        if (widget.onTap != null) {
          widget.onTap!();
        }
      },
      validator: (String? value) {
        if (widget.validation != null) {
          return widget.validation!(value);
        } else if (value!.isEmpty && widget.required) {
          return widget.validationMsg ?? " Enter this field";
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: widget.contentPaddingVertical.h,
          horizontal: widget.contentPaddingHorizontal.w,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              widget.borderRadius.r,
            ),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              widget.enabledBorderRadius.r,
            ),
          ),
          borderSide: (!widget.hasBorder)
              ? BorderSide.none
              : BorderSide(
                  color: widget.enabledBorderRadiusColor,
                  width: widget.borderSideWidth,
                ),
        ),
        filled: widget.isFilled,
        fillColor: Colors.grey.withOpacity(0.1),
        labelText: widget.labelText,
        labelStyle: TextStyle(
          color: myFocusNode.hasFocus ? AppColors.primaryColor : Colors.grey,
        ),
        suffixIcon: widget.suffixIcon != null
            ? IconButton(
                onPressed: () {
                  widget.onPressSuffixIcon!();
                },
                icon: Icon(
                  widget.suffixIcon,
                  color: myFocusNode.hasFocus
                      ? AppColors.primaryColor
                      : Colors.grey,
                ),
              )
            : null,
        prefixIcon: widget.prefixIcon != null
            ? Icon(
                widget.prefixIcon,
                color:
                    myFocusNode.hasFocus ? AppColors.primaryColor : Colors.grey,
              )
            : null,
      ),
    );
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }
}
