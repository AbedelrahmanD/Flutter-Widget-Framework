import 'package:flutter/material.dart';

class CmAppBar extends StatelessWidget {
  final Widget title;
  final dynamic scaffoldKey;
  final bool goBack;

  const CmAppBar(
      {Key? key, required this.title, this.scaffoldKey, this.goBack = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: Colors.grey[300], borderRadius: BorderRadius.circular(100)),
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                goBack
                    ? IconButton(
                         onPressed: ()=>{Navigator.pop(context)},

                        icon: const Icon(Icons.arrow_back_ios))
                    : IconButton(
                        // onPressed: ()=>{},
                        onPressed: () => scaffoldKey.currentState!.openDrawer(),
                        icon: const Icon(Icons.blur_circular_outlined)),
                const SizedBox(
                  width: 10,
                ),
                title,
              ],
            ),
            Row(
              children: const [
                Icon(Icons.square),
                Icon(Icons.square),
              ],
            )
          ],
        ),
      ),
    );
  }
}
