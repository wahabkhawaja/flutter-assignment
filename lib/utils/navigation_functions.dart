import 'package:flutter/cupertino.dart';
import 'package:flutter_assignment/main.dart';

pushCupertinoNavigation(Widget newPage) async {
  if (navigatorKey.currentContext != null) {
    await Navigator.of(navigatorKey.currentContext!).push(
      CupertinoPageRoute(
        builder: (context) => newPage,
      ),
    );
  } else {
    debugPrint("IOS push NAVIGATION FUNCTION IS UNABLE TO FIND CONTEXT");
  }
}

void replaceCupertinoNavigation(Widget newPage) {
  if (navigatorKey.currentContext != null) {
    Navigator.of(navigatorKey.currentContext!).pushAndRemoveUntil(
      CupertinoPageRoute(
        builder: (context) => newPage,
      ),
      (val) => false,
    );
  } else {
    debugPrint("IOS Replace NAVIGATION FUNCTION IS UNABLE TO FIND CONTEXT");
  }
}

void removeCupertinoNavigation(Widget newPage) {
  if (navigatorKey.currentContext != null) {
    Navigator.of(navigatorKey.currentContext!).pushReplacement(
      CupertinoPageRoute(
        builder: (context) => newPage,
      ),
    );
  } else {
    debugPrint("IOS Replace NAVIGATION FUNCTION IS UNABLE TO FIND CONTEXT");
  }
}

Future<void> pushFadeNavigation(Widget newPage) async {
  if (navigatorKey.currentContext != null) {
    await Navigator.of(navigatorKey.currentContext!).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 600),
        pageBuilder: (context, animation, secondaryAnimation) => newPage,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final fadeIn = CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          );
          final fadeOut = CurvedAnimation(
            parent: secondaryAnimation,
            curve: Curves.easeInOut,
          );

          return FadeTransition(
            opacity: fadeIn,
            child: FadeTransition(
              opacity: Tween<double>(begin: 1.0, end: 0.0).animate(fadeOut),
              child: child,
            ),
          );
        },
      ),
    );
  } else {
    debugPrint("FADE NAVIGATION FUNCTION IS UNABLE TO FIND CONTEXT");
  }
}

void replaceFadeNavigation(Widget newPage) {
  if (navigatorKey.currentContext != null) {
    Navigator.of(navigatorKey.currentContext!).pushAndRemoveUntil(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 600),
        pageBuilder: (context, animation, secondaryAnimation) => newPage,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final fadeIn = CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          );
          final fadeOut = CurvedAnimation(
            parent: secondaryAnimation,
            curve: Curves.easeInOut,
          );

          return FadeTransition(
            opacity: fadeIn,
            child: FadeTransition(
              opacity: Tween<double>(begin: 1.0, end: 0.0).animate(fadeOut),
              child: child,
            ),
          );
        },
      ),
      (val) => false,
    );
  } else {
    debugPrint("FADE NAVIGATION FUNCTION IS UNABLE TO FIND CONTEXT");
  }
}
