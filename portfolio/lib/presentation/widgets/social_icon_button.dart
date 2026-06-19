import 'package:flutter/material.dart';

class SocialIconButton extends StatelessWidget {
final IconData icon;
final String url;

const SocialIconButton({
super.key,
required this.icon,
required this.url,
});

@override
Widget build(BuildContext context) {
return IconButton(
onPressed: () {},
icon: Icon(icon),
);
}
}
