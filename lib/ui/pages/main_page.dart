part of 'pages.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<BarItem> barItems = [
    BarItem(text: "Home", color: Colors.black, iconData: Icons.home),
    BarItem(text: "Pesanan", color: Colors.black, iconData: Icons.shopping_bag),
    BarItem(text: "Lacak", color: Colors.black, iconData: Icons.search),
    BarItem(text: "Riwayat", color: Colors.black, iconData: Icons.history),
    BarItem(
        text: "Warungku", color: Colors.black, iconData: Icons.point_of_sale)
  ];
  int selectedBarIndex = 0;
  PageController pageController;

  @override
  void initState() {
    super.initState();
    selectedBarIndex = 0;
    pageController = PageController(initialPage: selectedBarIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: (!isAlreadyLogin)
                  ? SizedBox()
                  : Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Hi " + userName,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              color: Colors.red,
                              child: Text(
                                "Logout",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                setState(() {
                                  //set login as successfully logout
                                  isAlreadyLogin = false;
                                  context
                                      .read<PageBloc>()
                                      .add(GoToGetStartedPage());
                                });
                              })
                        ],
                      ),
                    ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.only(top: 50),
                child: PageView(
                  controller: pageController,
                  onPageChanged: (index) {
                    setState(() {
                      selectedBarIndex = index;
                      if (selectedBarIndex == 3 && !isAlreadyLogin) {
                        context.read<PageBloc>().add(GoToGetStartedPage());
                      } else {}
                    });
                  },
                  children: <Widget>[
                    // cashier
                    HomePage(),
                    OrderPage(),
                    FindPage(),
                    HistoryPage(),
                    MyStorePage(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: AnimatedBottomBarWidget(
        barItems: barItems,
        animationDuration: const Duration(milliseconds: 200),
        barStyle: BarStyle(
            fontSize: 18.0, fontWeight: FontWeight.w600, iconSize: 26.0),
        selectedBarIndex: selectedBarIndex,
        onBarTap: (index) {
          selectedBarIndex = index;
          pageController.jumpToPage(selectedBarIndex);
        },
      ),
    );
  }
}
