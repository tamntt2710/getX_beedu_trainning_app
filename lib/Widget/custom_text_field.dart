// import 'package:beedu_app_training/const/constant.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// class CustomTextField extends StatefulWidget {
//   final String? title;
//   final String? text;
//   final String? placeholder;
//   final TextInputType? type;
//   final bool isObscure;
//   final bool showEye;
//   final String? Function()? errorText;
//   final bool isCapitalized;
//   final TextInputAction textInputAction;
//   final bool Function()? errorPredicate;
//   final bool isRequired;
//   final ValueChanged<String?>? textFieldDidChangeValue;
//   final ValueChanged<String?>? textFieldEndEditing;
//   final int? maxLength;
//   final double? radius;
//   final Color? placeholderColor;
//   final bool isTextFieldDisabled;
//   final TextEditingController? editingController;
//   final bool? autoFocus;
//
//   const CustomTextField(
//       {Key? key,
//         this.title,
//         this.type,
//         this.isObscure = false,
//         this.showEye = true,
//         this.placeholder,
//         this.textFieldDidChangeValue,
//         this.textInputAction = TextInputAction.next,
//         this.errorText,
//         this.text,
//         this.errorPredicate,
//         this.isCapitalized = false,
//         this.isRequired = true,
//         this.textFieldEndEditing,
//         this.maxLength,
//         this.radius,
//         this.placeholderColor,
//         this.isTextFieldDisabled = false,
//         this.editingController, this.autoFocus})
//       : super(key: key);
//
//   @override
//   _CustomTextFieldState createState() => _CustomTextFieldState();
// }
//
// class _CustomTextFieldState extends State<CustomTextField> {
//   bool _obscureText = true;
//   late var shouldValidateData = false;
//   TextEditingController _controller = TextEditingController();
//   late final FocusNode _focusNode = FocusNode();
//
//   @override
//   void initState() {
//     _focusNode.addListener(() {
//       setState(() {});
//     });
//
//     // print("TextField ${widget.text}");
//     // _controller.text = widget.text ?? "";
//
//     _controller = widget.editingController ?? TextEditingController();
//
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         textFieldTitleContainer(),
//         Container(
//             height: 48.w,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(widget.radius ?? 40.w),
//             ),
//             child: Padding(
//                 padding: const EdgeInsets.all(1.0),
//                 child: Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(widget.radius ?? 40.w),
//                       color: ColorConst.primaryColor,
//                     ),
//                     child: Padding(
//                       padding: EdgeInsets.only(left: 16.w, right: widget.isObscure ? 0 : 12.w),
//                       child: TextFormField(
//                           autofocus: widget.autoFocus ?? false,
//                           enabled: !widget.isTextFieldDisabled,
//                           inputFormatters: [
//                             if (widget.maxLength != null)
//                               LengthLimitingTextInputFormatter(widget.maxLength),
//                           ],
//                           controller: _controller,
//                           textCapitalization: widget.isCapitalized ? TextCapitalization.sentences : TextCapitalization.none,
//                           focusNode: _focusNode,
//                           style: ColorConst.textStyleAppBar,
//                           obscureText: _obscureText && widget.isObscure,
//                           keyboardType: widget.type,
//                           textInputAction: widget.textInputAction,
//                           decoration: InputDecoration(
//                               suffixIcon: widget.showEye && widget.isObscure
//                                   ? IconButton(
//                                 padding: EdgeInsets.zero,
//                                 // icon: SvgIconWidget(
//                                 //   name: _obscureText ? ColorConst.iconEyeOpen :
//                                 //   ColorConst.iconEyeClose,
//                                 //   size: 16.w,
//                                 //   color: ColorConst.primaryColor,
//                                 // ),
//                                 onPressed: () {
//                                   _toggle();
//                                 },
//                               )
//                                   : null,
//                               // hintStyle: widget.placeholderColor == null
//                               //     ? ColorConst.styleTextPlaceholder
//                               //     : ColorConst.styleTextPlaceholder.copyWith(color: widget.placeholderColor!),
//                               border: InputBorder.none,
//                               hintText: widget.placeholder),
//                           onTap: () {
//                             if (!shouldValidateData) {
//                               shouldValidateData = true;
//                             }
//                           },
//                           onChanged: (value) => {
//                             setState(() {
//                               widget.textFieldDidChangeValue?.call(value);
//                             })
//                           },
//                           onFieldSubmitted: (value) {
//                             widget.textFieldEndEditing?.call(value);
//                           }),
//                     )))),
//         helperTextContainer()
//       ],
//     );
//   }
//
//   Widget textFieldTitleContainer() {
//     return widget.title != null
//         ? Padding(
//       padding: EdgeInsets.only(bottom: 8.h),
//       child: RichText(
//         text: TextSpan(
//           text: '',
//          // style: ColorConst.styleSecondaryRegularSize14,
//           children: <TextSpan>[TextSpan(text: widget.title), if (widget.isRequired) TextSpan(text: ' *'],
//         ),
//       ),
//     )
//         : Container();
//   }
//
//   Widget helperTextContainer() {
//     if (!shouldValidateData) {
//       // shouldValidateData = true;
//       return Container();
//     }
//
//     /// if we have an [errorPredicate], that means we need an text below
//     /// the [TextField] to provide extra information
//     if (widget.errorPredicate?.call() ?? false) {
//       return Padding(
//           padding: const EdgeInsets.only(top: 8),
//           child: Text(
//             widget.errorText?.call() ?? "",
//             style: _focusNode.hasFocus ? ColorConst.styleTextHelperTextField : ColorConst.styleTextInputError,
//           ));
//     } else {
//       return Container();
//     }
//   }
//
//   void _toggle() {
//     setState(() {
//       _obscureText = !_obscureText;
//     });
//   }
//
//   Color _getBorderColor() {
//     if (widget.errorPredicate == null) {
//       return _focusNode.hasFocus ? ColorConst.textFieldFocusColor : ColorConst.colorLightGray;
//     }
//
//     if (!shouldValidateData || (!widget.errorPredicate!.call() && !_focusNode.hasFocus)) {
//       return ColorConst.colorLightGray;
//     } else if ((_controller.text.isEmpty || !widget.errorPredicate!.call()) && _focusNode.hasFocus) {
//       return ColorConst.textFieldFocusColor;
//     } else {
//       return ColorConst.colorAppError;
//     }
//   }
//
//   bool _isShowBorder() {
//     return _getBorderColor() != ColorConst.colorLightGray;
//   }
//
// // @override
// // void didUpdateWidget(CustomTextField oldWidget) {
// //   super.didUpdateWidget(oldWidget);
// //
// //   if (oldWidget.text != widget.text && !_focusNode.hasFocus) {
// // _controller.text = widget.text ?? "";
// //   }
// // }
// }
