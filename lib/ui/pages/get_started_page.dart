part of 'pages.dart';

class GetStartedPage extends StatefulWidget {
  @override
  _GetStartedPageState createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  TextEditingController userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Login untuk membuka Halaman Riwayat"),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: userNameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: "Username",
                    hintText: "Masukan nama Anda"),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 150,
                  height: 45,
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      color: Colors.black,
                      child: Text(
                        "Kembali ke Home",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        context.read<PageBloc>().add(GoToMainPage());
                      }),
                ),
                SizedBox(
                  width: 150,
                  height: 45,
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      color: Colors.green,
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        if (userNameController.text.isEmpty) {
                          Flushbar(
                            duration: Duration(seconds: 2),
                            flushbarPosition: FlushbarPosition.TOP,
                            backgroundColor: Colors.red,
                            message: "Nama Anda harus diisi untuk login",
                          )..show(context);
                        } else {
                          setState(() {
                            //set login as successfully login
                            isAlreadyLogin = true;
                            userName = userNameController.text;
                            context.read<PageBloc>().add(GoToMainPage());
                          });
                        }
                      }),
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }
}
