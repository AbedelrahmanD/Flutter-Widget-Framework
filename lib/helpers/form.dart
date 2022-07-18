// import 'package:ajman_gas/functions/form.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:dropdown_search/dropdown_search.dart';
// import 'common.dart';
//
// Color inputColor = const Color(0xffeeeeee);
//
// cmInput({
//   String label = "",
//   String? error,
//   TextEditingController? controller,
//   Icon? icon,
//   bool obscureText = false,
//   dynamic filter,
//   int minLines = 1,
//   int maxLines = 1,
//   dynamic keyboardType = TextInputType.text,
//   bool enabled = true,
// }) {
//   return Center(
//     child: Container(
//       margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
//       width: Get.width * 0.9,
//       child: TextField(
//         enabled: enabled,
//         minLines: minLines,
//         maxLines: maxLines,
//         obscureText: obscureText,
//         controller: controller,
//         keyboardType: keyboardType,
//         inputFormatters: [
//           filter ?? FilteringTextInputFormatter.deny(RegExp('[]')),
//         ],
//         decoration: InputDecoration(
//           prefixIcon: icon,
//           hintText: label,
//           fillColor: inputColor,
//           filled: true,
//           errorText: error,
//           errorMaxLines: 3,
//           focusedErrorBorder: OutlineInputBorder(
//             borderSide: const BorderSide(color: Colors.red, width: 1.0),
//             borderRadius: BorderRadius.circular(100.0),
//           ),
//           errorBorder: OutlineInputBorder(
//             borderSide: const BorderSide(color: Colors.red, width: 1.0),
//             borderRadius: BorderRadius.circular(100.0),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: inputColor, width: 0.0),
//             borderRadius: BorderRadius.circular(100.0),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: primary, width: 1.0),
//             borderRadius: BorderRadius.circular(100.0),
//           ),
//           disabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: inputColor, width: 0.0),
//             borderRadius: BorderRadius.circular(100.0),
//           ),
//         ),
//       ),
//     ),
//   );
// }
//
// cmButton({
//   String text = "",
//   double textSize=14.0,
//   Icon? icon,
//   VoidCallback? callFunction,
//   double width = 200,
//   double padding = 15,
//   Color? buttonColor,
//   Color textColor = Colors.white,
//   double borderWidth = 0,
//   double marginTopBottom = 10,
//   String? assetsImagePath,
// }) {
//   return Container(
//     margin: EdgeInsets.fromLTRB(0, marginTopBottom, 0, marginTopBottom),
//     width: width,
//     child: ElevatedButton(
//       onPressed: callFunction,
//       child: Stack(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const SizedBox(width: 10),
//               Text(
//                 text,
//                 style: TextStyle(color: textColor,fontSize: textSize),
//               ),
//               const SizedBox(width: 10),
//               icon ??
//                   const SizedBox(
//                     width: 0,
//                   )
//             ],
//           ),
//           assetsImagePath == null
//               ? const SizedBox(width: 0)
//               : cmPositioned(
//                   start: 20,
//                   end: null,
//                   child: Image.asset(
//                     assetsImagePath,
//                     width: 20,
//                   ),
//                 ),
//         ],
//       ),
//       style: ElevatedButton.styleFrom(
//         elevation: 0,
//         primary: buttonColor,
//         padding: EdgeInsets.all(padding),
//         shape: RoundedRectangleBorder(
//           side: BorderSide(
//               width: borderWidth,
//               color: borderWidth > 0 ? primary : Colors.transparent),
//           borderRadius: BorderRadius.circular(100.0),
//         ),
//       ),
//     ),
//   );
// }
// //
// // cmDropDown({
// //   required List<String> list,
// //   Widget icon = const Icon(Icons.home),
// //   String label = "choose",
// //   String? selectedItem,
// //   String dropDownFor = "city",
// //   bool enabled = true,
// //   Color? borderColor,
// // }) {
// //   return Container(
// //     clipBehavior: Clip.hardEdge,
// //     height: 60,
// //     width: Get.width * 0.9,
// //     margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
// //     decoration: BoxDecoration(
// //       color: inputColor,
// //       borderRadius: BorderRadius.circular(100),
// //       border: Border.all(width: 1, color: borderColor ?? Colors.red),
// //     ),
// //     child: Transform.translate(
// //       offset: const Offset(0, 5),
// //       child: Stack(
// //         children: [
// //           DropdownSearch<String>(
// //             enabled: enabled,
// //             showAsSuffixIcons: true,
// //             mode: Mode.DIALOG,
// //             showSearchBox: true,
// //             showSelectedItems: true,
// //             items: list,
// //             selectedItem: selectedItem,
// //             onChanged: (selectedCity) {
// //               userFormCityName = selectedCity;
// //             },
// //             dropdownSearchDecoration: InputDecoration(
// //               contentPadding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
// //               enabledBorder: UnderlineInputBorder(
// //                   borderSide: BorderSide(color: inputColor)),
// //               prefixIcon: icon,
// //               fillColor: inputColor,
// //               filled: true,
// //               hintText: label,
// //             ),
// //           ),
// //           if (enabled == false)
// //             cmPositioned(
// //             end: 0,
// //             start: Get.width * 0.8,
// //             child: Container(
// //               width: 30,
// //               height: 30,
// //               color: inputColor
// //             ),
// //           )
// //         ],
// //       ),
// //     ),
// //   );
// // }
// //
//
// cmDropDown({
//   required List<String> list,
//   Widget icon = const Icon(Icons.home),
//   String label = "choose",
//   String? selectedItem,
//   String dropDownFor = "city",
//   bool enabled = true,
//   Color? borderColor,
// }) {
//   return Container(
//     height: 60,
//     width: Get.width * 0.9,
//     margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
//     decoration: BoxDecoration(
//       color: inputColor,
//       borderRadius: BorderRadius.circular(100),
//       border: Border.all(width: 1, color: borderColor ?? Colors.red),
//     ),
//     child: Stack(
//       children: [
//         Transform.translate(
//           offset: const Offset(0, 5),
//           child: DropdownSearch<String>(
//             enabled: enabled,
//
//             showAsSuffixIcons: true,
//             mode: Mode.DIALOG,
//             showSearchBox: true,
//             showSelectedItems: true,
//             items: list,
//             selectedItem: selectedItem,
//             onChanged: (selectedCity) {
//               userFormCityName = selectedCity;
//             },
//             dropdownSearchDecoration: InputDecoration(
//               contentPadding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
//               disabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(100),
//                   borderSide: BorderSide(color: inputColor)),
//               focusedErrorBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(100),
//                   borderSide: BorderSide(color: inputColor)),
//               focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(100),
//                   borderSide: BorderSide(color: inputColor)),
//               errorBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(100),
//                   borderSide: BorderSide(color: inputColor)),
//               enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(100),
//                   borderSide: BorderSide(color: inputColor)),
//               prefixIcon: icon,
//               fillColor: inputColor,
//               filled: true,
//               hintText: label,
//             ),
//           ),
//         ),
//         if (enabled == false)
//           cmPositioned(
//             end: 10,
//             top: 5,
//             bottom: 5,
//             start: Get.width * 0.8,
//             child: Container(
//               decoration: BoxDecoration(
//                   color: inputColor, borderRadius: BorderRadius.circular(100)),
//             ),
//           )
//       ],
//     ),
//   );
// }
//
// cmTextError(String errorMessage) {
//   return Transform.translate(
//     offset: const Offset(0, -5),
//     child: SizedBox(
//       width: Get.width * 0.8,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Text(
//             errorMessage,
//             textAlign: TextAlign.start,
//             style: const TextStyle(
//               color: Colors.red,
//               fontSize: 12,
//             ),
//           )
//         ],
//       ),
//     ),
//   );
// }
