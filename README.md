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
