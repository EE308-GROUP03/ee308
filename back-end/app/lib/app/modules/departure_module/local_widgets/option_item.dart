import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DepartureOptionItem extends StatelessWidget {
  final Widget label;
  final Color color;
  final String? assets;
  final Function()? fun;

  const DepartureOptionItem(
      {Key? key,
      required this.label,
      required this.color,
      this.assets,
      this.fun})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 367.8.w,
        height: 100.h,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: assets == null
                ? [
                    Material(
                        borderRadius: BorderRadius.circular(10),
                        color: color,
                        child: InkWell(
                            borderRadius: BorderRadius.circular(10),
                            splashColor: Colors.white.withOpacity(0.4),
                            onTap: fun,
                            child: Container(
                                width: 250.w,
                                height: 100.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(width: 4)),
                                child: Center(child: label))))
                  ]
                : [
                    Material(

                      borderRadius: BorderRadius.circular(10),
                      color: color,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        splashColor: Colors.white.withOpacity(0.4),
                        onTap: fun,
                        child: Container(
                            width: 250.w,
                            height: 100.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(width: 4)),
                            child: Center(child: label)),
                      ),
                    ),
                    Image.asset(assets!, width: 100.h, height: 100.h)
                  ]));
  }
}
