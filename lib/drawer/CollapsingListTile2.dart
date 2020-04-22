import 'package:flutter/material.dart';
import 'package:pnphelpdesk/drawer/theme.dart';

class CollapsingListTile2 extends StatefulWidget {
  final String title;
  final AnimationController animationController;
  final bool isSelected;
  final Function onTap;
  final String picurl;

  CollapsingListTile2(
      {@required this.title,
      @required this.animationController,
      this.isSelected = false,
      @required this.picurl,
      this.onTap});
  @override
  _CollapsingListTile2State createState() => _CollapsingListTile2State(picurl);
}

class _CollapsingListTile2State extends State<CollapsingListTile2> {
  Animation<double> widthAnimation, sizeBoxAnimation;
  final String picurl;
  _CollapsingListTile2State(this.picurl);

  
  

  @override
  void initState() {
    super.initState();
    widthAnimation =
        Tween<double>(begin: 220, end: 70).animate(widget.animationController);
    sizeBoxAnimation =
        Tween<double>(begin: 10, end: 0).animate(widget.animationController);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
          color: widget.isSelected
              ? Colors.transparent.withOpacity(0.3)
              : Colors.transparent,
        ),
        width: widthAnimation.value,
        margin: EdgeInsets.symmetric(
          horizontal: 8,
        ),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Column(
          children: <Widget>[
            Image.network(
              '$picurl',
              // width: 100,
              // height: 100,
            ),
            SizedBox(
              height: 10,
              width: sizeBoxAnimation.value,
            ),
            (widthAnimation.value >= 220)
                ? Text(
                    widget.title,
                    style: widget.isSelected ? infoTextStyle : infoTextStyle,
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
