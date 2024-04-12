import 'package:flutter/cupertino.dart';

import 'header_desktop.dart';
import 'header_mobile.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width > 600
        ? const HeaderDesktop()
        : const HeaderMobile();
  }
}