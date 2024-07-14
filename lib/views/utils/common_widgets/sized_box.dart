import 'package:flutter/cupertino.dart';

class sizedBoxx extends StatelessWidget {
  double? width;
  double? height;
  Widget? child;

  sizedBoxx({
    super.key,
    this.width,
    this.height,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: child,
    );
  }
}
