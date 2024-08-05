import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingKit {
  loadingKit({Color? color, bool? isHorizontal}) {
    if (isHorizontal == true) {
      return SpinKitThreeBounce(
        color: color ?? Colors.white,
        size: 50.0,
      );
    }
    return SpinKitFadingCircle(
      color: color ?? Colors.white,
      size: 50.0,
    );
  }
}
