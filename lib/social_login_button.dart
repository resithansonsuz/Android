import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  final String butonText;
  final Color butonColor;
  final Color TextColor;
  final double radius;
  final double yukseklik;
  final Widget butonIcon;
  final VoidCallback onPressed;

  const SocialLoginButton(
      {Key key,
      @required this.butonText,
      this.butonColor,
      this.TextColor: Colors.white,
      this.radius: 16,
      this.yukseklik: 50,
      this.butonIcon,
      this.onPressed})
      : assert(butonText != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      ),
      child: Row(
        children: <Widget>[
          butonIcon,
          Text(
            butonText,
            style: TextStyle(color: TextColor),
          ),
        ],
      ),
      color: butonColor,
    );
    return Container();
  }
}
