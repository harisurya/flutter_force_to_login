part of 'widgets.dart';

class AnimatedBottomBarWidget extends StatefulWidget {
  final List<BarItem> barItems;
  final Duration animationDuration;
  final Function onBarTap;
  final BarStyle barStyle;
  final int selectedBarIndex;

  AnimatedBottomBarWidget(
      {this.barItems,
      this.animationDuration,
      this.onBarTap,
      this.barStyle,
      this.selectedBarIndex});
  @override
  _AnimatedBottomBarWidgetState createState() =>
      _AnimatedBottomBarWidgetState();
}

class _AnimatedBottomBarWidgetState extends State<AnimatedBottomBarWidget>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: ClipRRect(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Container(
            padding: const EdgeInsets.only(
                bottom: 12, top: 8.0, left: 8.0, right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: _buildBarItems(),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildBarItems() {
    List<Widget> barItems = List();

    for (int i = 0; i < widget.barItems.length; i++) {
      BarItem item = widget.barItems[i];
      bool isSelected = widget.selectedBarIndex == i;
      barItems.add(
        InkWell(
          splashColor: Colors.transparent,
          onTap: () {
            setState(() {
              widget.onBarTap(i);
            });
          },
          child: AnimatedContainer(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            duration: widget.animationDuration,
            decoration: BoxDecoration(
              color: isSelected
                  ? item.color.withOpacity(0.15)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Row(
              children: <Widget>[
                Icon(
                  item.iconData,
                  color: isSelected ? item.color : Colors.black,
                  size: widget.barStyle.iconSize,
                ),
                AnimatedSize(
                  vsync: this,
                  duration: widget.animationDuration,
                  curve: Curves.easeInOut,
                  child: Text(isSelected ? item.text : "",
                      style: GoogleFonts.raleway().copyWith(
                          color: Colors.black,
                          fontSize: widget.barStyle.fontSize,
                          fontWeight: widget.barStyle.fontWeight)),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return barItems;
  }
}

class BarItem {
  final String text;
  final IconData iconData;
  final Color color;

  BarItem({this.text, this.iconData, this.color});
}

class BarStyle {
  final double fontSize, iconSize;
  final FontWeight fontWeight;

  BarStyle(
      {this.fontSize = 18.0,
      this.fontWeight = FontWeight.bold,
      this.iconSize = 32.0});
}
