import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:template/widgets/sobre.dart';

final Color notSelected = Colors.green.shade800.withOpacity(0.7);
final Color selected = Colors.teal.shade600;
bool _isOpen = false;

class SmallScreenAppBar extends StatefulWidget with PreferredSizeWidget {
  const SmallScreenAppBar({Key key}) : super(key: key);

  @override
  _SmallScreenAppBarState createState() => _SmallScreenAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(600);
}

class _SmallScreenAppBarState extends State<SmallScreenAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        fit: StackFit.loose,
        children: [_smallPageAppBar(), _sectionLandingPage()],
      ),
    );
  }

// _sectionLandingPage(),
  Container _smallPageAppBar() {
    return Container(
      width: double.infinity,
      height: 170,
      decoration: BoxDecoration(color: Color(0xFF151c26)),
      child: Column(
        children: [
          Sobre(),
          Divider(color: Colors.white),
          Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _logoJPD(),
                const Spacer(),
                _AnimatedMenu(
                  onPressed: () {
                    (_isOpen) ? setState(() {}) : setState(() {});
                  },
                )
              ]),
        ],
      ),
    );
  }

  AnimatedContainer _sectionLandingPage() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 350),

      decoration: BoxDecoration(color: Colors.blueGrey[800]),
      height: (_isOpen) ? 200.0 : 0.0,
      // color: Colors.transparent,
      alignment: Alignment.bottomRight,
      margin: EdgeInsets.only(top: 150.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(child: _SmallNavBarItem(itemText: 'Inicio')),
            Divider(
              color: Colors.black,
            ),
            Expanded(child: _SmallNavBarItem(itemText: 'Menú')),
            Divider(
              color: Colors.black,
            ),
            Expanded(child: _SmallNavBarItem(itemText: 'Acerca')),
            Divider(
              color: Colors.black,
            ),
            Expanded(child: _SmallNavBarItem(itemText: 'Contacto')),
            Divider(
              color: Colors.black,
            ),
            Expanded(child: _SmallNavBarItem(itemText: 'Reserva')),
            SizedBox(height: 5.0)
          ]),
    );
  }
}

class _AnimatedMenu extends StatefulWidget {
  final Function onPressed;
  _AnimatedMenu({@required this.onPressed});
  // _AnimatedMenu({Key key}) : super(key: key);

  @override
  __AnimatedMenuState createState() => __AnimatedMenuState();
}

class __AnimatedMenuState extends State<_AnimatedMenu>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 450),
        animationBehavior: AnimationBehavior.preserve);
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_close,
        progress: _animationController,
        color: Colors.white70,
      ),
      iconSize: 30,
      splashColor: Colors.blueAccent.withOpacity(0.5),
      onPressed: () => _handleOnPressed(),
    );
  }

  void _handleOnPressed() {
    widget.onPressed();
    setState(() {
      _isOpen = !_isOpen;
      _isOpen ? _animationController.forward() : _animationController.reverse();
    });
  }
}

class _SmallNavBarItem extends StatefulWidget {
  final String itemText;
  _SmallNavBarItem({@required this.itemText});

  @override
  __SmallNavBarItemState createState() => __SmallNavBarItemState();
}

class __SmallNavBarItemState extends State<_SmallNavBarItem> {
  Color color = notSelected;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (value) => setState(() {
        color = Colors.white60;
      }),
      onExit: (value) => setState(() {
        color = notSelected;
      }),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.green[100],
          onTap: () {},
          child: Container(
            height: 60.0,
            alignment: Alignment.centerLeft,
            child: Text(
              widget.itemText,
              style: TextStyle(
                  fontSize: 22.0, color: Colors.white, letterSpacing: 1.5),
            ),
          ),
        ),
      ),
    );
  }
}

class MediumScreenAppBar extends StatelessWidget with PreferredSizeWidget {
  const MediumScreenAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      color: Color(0xFF151c26),
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: [
          Sobre(),
          Divider(color: Colors.white),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _logoJPD(),
              _menuNavBar(),
            ],
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(200);
}

class LargeScreenAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      color: Color(0xFF151c26),
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: [
          Sobre(),
          Divider(color: Colors.white),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _logoJPD(),
              _menuNavBar(),
            ],
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(200);
}

Widget _logoJPD() {
  return Image(
    image: AssetImage('assets/logo.png'),
    width: 200,
    height: 100,
    alignment: Alignment.center,
    filterQuality: FilterQuality.high,
  );
}

Widget _menuNavBar() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      _containerText('Inicio'),
      _containerText('Menú'),
      _containerText('Acerca'),
      _containerText('Contacto'),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.red,
        ),
        child: Text(
          'Reserva',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        onPressed: () {},
      )
    ],
  );
}

Container _containerText(String title) {
  return Container(
      child: TextButton(
    onPressed: () {},
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Text(title, style: TextStyle(color: Colors.white, fontSize: 15)),
    ),
  ));
}
