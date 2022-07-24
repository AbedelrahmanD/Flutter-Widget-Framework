<h1>
Flutter Custom Widget
</h1>
<p>This project is about set of classes that make styling easier by providing shorter syntax inspired by css, some of the classes depends on other packages like <a href="https://pub.dev/packages/get">getx</a>, <a href="https://pub.dev/packages/cached_network_image">cached_network_image</a>...</p>
<p>There is <code>config.dart</code> file that is used to set style globally like css classes and there is support for ltr and rtl directionality</p>
<p>
These custome widgets contains:
<ul>
<li>CmContainer</li>
<li>CmText</li>
<li>CmTextField</li>
<li>CmButton</li>
<li>CmDropDown</li>
<li>CmCachedNetworkImage</li>
<li>CmExtendedImage</li>
<li>CmPositioned</li>
<li>CmDirectionality</li>
</ul>
</p>

<h1>Comparision Bwteen Flutter Widgets and Custom Widgets</h1>
<h3>Flutter Widgets</h3>

```
              Container(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.blueAccent,
                    ),
                    hintText: "Enter Your Name",
                    labelText: "Name",
                    fillColor: Colors.white,
                    filled: true,
                    focusedErrorBorder:   OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red, width: 1.0),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    errorBorder:   OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red, width: 1.0),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:const  BorderSide(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    focusedBorder:  OutlineInputBorder(
                      borderSide:const BorderSide(color: Colors.blueAccent, width: 1.0),
                      borderRadius: BorderRadius.circular(100),
                    ),

                  ),
                ),
              ),
  ```
  
<h3>Custom Widgets</h3>              

```
CmContainer(
                paddingAll: 15,
                child: CmTextField(
                  iconData: Icons.person,
                  hintText: "Enter Your Name",
                  labelText: "Name",
                ),
              ),
```
<h3>And In <code>config.dart</code> You Put</h3>

```
const Color cmTextFieldHintTextColor = primaryColor;
const Color cmTextFieldLabelTextColor = primaryColor;
const Color cmTextFieldInputColor = Colors.transparent;
const Color cmTextFieldBorderColor = Colors.grey;
const Color cmTextFieldFocusBorderColor = primaryColor;
const Color cmTextFieldIconColor = primaryColor;
const double cmTextFieldBorderRadius = 100;
const double cmTextFieldWidth = 300;
const double cmTextFieldMarginTop = 10;
const double cmTextFieldMarginBottom = 10;
```

<h1>Full Example Of <code>config.dart</code></h1>

```
import 'package:flutter/material.dart';
import 'package:get/get.dart';
var appDir = "ltr".obs;
const Color primaryColor = Colors.deepPurple;
final Map<int, Color> primaryColorMap = {
  50: primaryColor,
  100: primaryColor,
  200: primaryColor,
  300: primaryColor,
  400: primaryColor,
  500:primaryColor,
  600: primaryColor,
  700: primaryColor,
  800: primaryColor,
  900: primaryColor,
};
final MaterialColor primaryColorSwatch = MaterialColor(50, primaryColorMap);

///***CmTextField
const Color cmTextFieldHintTextColor = primaryColor;
const Color cmTextFieldLabelTextColor = primaryColor;
const Color cmTextFieldInputColor = Colors.transparent;
const Color cmTextFieldBorderColor = Colors.grey;
const Color cmTextFieldFocusBorderColor = primaryColor;
const Color cmTextFieldIconColor = primaryColor;
const double cmTextFieldBorderRadius = 100;
const double cmTextFieldWidth = 300;
const double cmTextFieldMarginTop = 10;
const double cmTextFieldMarginBottom = 10;


///***CmButton
const Color cmButtonColor = Colors.white;
const Color cmButtonBackgroundColor = primaryColor;
const Color cmButtonBorderColor = Colors.white;
const Color cmButtonBoxShadowColor = Colors.grey;
const double cmButtonPadding = 15.0;
const double cmButtonBorderRadius = 100;
const double cmButtonBorderWidth = 2;
const double cmButtonWidth = 300;
const double cmButtonMarginTop = 10;
const double cmButtonMarginBottom = 10;

///***CmCachedNetworkImage
const Widget cmCachedNetworkImagePlaceholder=CircularProgressIndicator();

///***fontFamily
const String textFontFamily="";
const List<String> textFontFamilyFallback=["Droid.Arabic.Kufi"];
```
<h1>Install the project to check the other classes like <code>CmDropDown</code>, <code>CmCachedNetworkImage</code>...</h1>
