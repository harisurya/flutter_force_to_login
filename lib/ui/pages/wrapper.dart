part of 'pages.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    // if (!isAlreadyLogin) {
    //   context.watch<PageBloc>().add(GoToGetStartedPage());
    // }

    return BlocBuilder<PageBloc, PageState>(builder: (_, pageState) {
      if (pageState is OnGetStartedPage) {
        return GetStartedPage();
      } else {
        return MainPage();
      }
    });
  }
}
