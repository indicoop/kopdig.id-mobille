import 'package:flutter/material.dart';
import 'package:kopdig/ui/theme/kopdig_theme.dart';

Widget kopdigPrimaryButton({
  required BuildContext context,
  required String text,
  required bool isEnabled,
  required Function() onPressed,
}) {
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: isEnabled ? KopdigTheme.primaryColor : Colors.grey,
    minimumSize: const Size(double.infinity, 50),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
    ),
  );

  return Container(
    height: 55,
    padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
    child: ElevatedButton(
      style: raisedButtonStyle,
      child: Text(
        text,
        style: const TextStyle(fontSize: 15),
      ),
      onPressed: isEnabled ? onPressed : (){},
    ),
  );
}

Widget kopdigButton({
  required BuildContext context,
  required String text,
  required bool isEnabled,
  required Function() onPressed,
}) {
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: isEnabled ? KopdigTheme.primaryColor : Colors.grey,
    minimumSize: const Size(double.infinity, 50),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
    ),
  );

  return Container(
    height: 55,
    padding: const EdgeInsets.fromLTRB(50, 5, 50, 0),
    child: ElevatedButton(
      style: raisedButtonStyle,
      child: Text(
        text,
        style: const TextStyle(fontSize: 15),
      ),
      onPressed: isEnabled ? onPressed : (){},
    ),
  );
}