part of 'pages.dart';

class wellcomePage extends StatefulWidget {
  const wellcomePage({Key? key}) : super(key: key);

  @override
  WellcomePageState createState() => WellcomePageState();
}

class WellcomePageState extends State<wellcomePage> {
  bool isHidden = true;
  bool isHiddenCourse = true;
  bool isHiddenPassword = true;
  bool isHiddenConfirmPassword = true;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var color;
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
            Image.asset(
              'assets/images/tempe_sanan.png',
              height: 333,
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: 15,
            ),
            Text("Welcome",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 20,
            ),
            Text("Keripik Tempe Karina",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 35,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 51,
            ),
            Container(
                height: 60,
                width: MediaQuery.of(context).size.width - 2 * defaultMargin,
                child: ElevatedButton(
                  onPressed: () {
                    // tampilan register
                    showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return StatefulBuilder(
                            builder:
                                (BuildContext context, StateSetter setState) {
                              return Wrap(
                                children: [
                                  Container(
                                    color: Colors.transparent,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: LastColor,
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(40),
                                              topLeft: Radius.circular(40))),
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: defaultMargin),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // jarak
                                            SizedBox(
                                              height: 25,
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Column(
                                                  children: [
                                                    Text(
                                                      "Silahkan Register",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 35,
                                                          color: blackColor),
                                                    ),
                                                  ],
                                                ),
                                                Spacer(),
                                                Center(
                                                  child: InkWell(
                                                    onTap: () {
                                                      //ketika icon ditekan
                                                      Navigator.pop(context);
                                                    },
                                                    child: Image.asset(
                                                      'assets/images/error.png',
                                                      height: 30,
                                                      width: 30,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 25,
                                            ),
                                            TextField(
                                                obscureText: isHidden,
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    hintText:
                                                        "info@example.com",
                                                    labelText: "Email",
                                                    suffixIcon: InkWell(
                                                        onTap:
                                                            toogleUsernameView,
                                                        child: Icon(isHidden
                                                            ? Icons
                                                                .visibility_outlined
                                                            : Icons
                                                                .visibility_off_outlined)))),
                                            SizedBox(
                                              height: 25,
                                            ),
                                            //note untuk course
                                            TextField(
                                                obscureText: isHiddenCourse,
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    hintText: "username",
                                                    labelText: "username",
                                                    suffixIcon: InkWell(
                                                        onTap: toogleCourseView,
                                                        child: Icon(isHiddenCourse
                                                            ? Icons
                                                                .visibility_outlined
                                                            : Icons
                                                                .visibility_off_outlined)))),
                                            SizedBox(
                                              height: 25,
                                            ),
                                            //note untuk password
                                            TextField(
                                                obscureText: isHiddenPassword,
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    hintText: "password",
                                                    labelText: "password",
                                                    suffixIcon: InkWell(
                                                        onTap:
                                                            tooglePasswordView,
                                                        child: Icon(isHiddenPassword
                                                            ? Icons.lock_outline
                                                            : Icons
                                                                .lock_open_outlined)))),
                                            SizedBox(
                                              height: 25,
                                            ),
                                            //note untuk confirm password
                                            TextField(
                                                obscureText:
                                                    isHiddenConfirmPassword,
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    hintText:
                                                        "confirm password",
                                                    labelText:
                                                        "confirm password",
                                                    suffixIcon: InkWell(
                                                        onTap:
                                                            toogleConfirmPasswordView,
                                                        child: Icon(
                                                            isHiddenConfirmPassword
                                                                ? Icons
                                                                    .lock_outlined
                                                                : Icons
                                                                    .lock_open_outlined)))),
                                            SizedBox(
                                              height: 25,
                                            ),
                                            Container(
                                                height: 60,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    2 * defaultMargin,
                                                child: ElevatedButton(
                                                    onPressed: () {},
                                                    child: Text(
                                                      'Register',
                                                      style: TextStyle(
                                                          color:
                                                              whiteColor),
                                                    ),
                                                    style: ElevatedButton.styleFrom(
                                                        primary: blackColor,
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15))))),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Apakah anda mempunyai akun lain?   ",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15),
                                                ),
                                                Text(
                                                  "Login",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: defaultMargin,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              );
                            },
                          );
                        });
                  },
                  child: Text(
                    'Create Acount',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18)
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: LastColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                )),
            SizedBox(
              height: 15,
            ),
            Container(
                height: 60,
                width: MediaQuery.of(context).size.width - 2 * defaultMargin,
                child: ElevatedButton(
                  onPressed: () {
                    // tampilan register
                    showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return StatefulBuilder(
                            builder:
                                (BuildContext context, StateSetter setState) {
                              return Wrap(
                                children: [
                                  Container(
                                    color: Colors.transparent,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: LastColor,
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(40),
                                              topLeft: Radius.circular(40))),
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: defaultMargin),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // jarak
                                            SizedBox(
                                              height: 25,
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Column(
                                                  children: [
                                                    Text(
                                                      "Silahkan Login",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 35,
                                                          color: blackColor),
                                                    ),
                                                  ],
                                                ),
                                                Spacer(),
                                                Center(
                                                  child: InkWell(
                                                    onTap: () {
                                                      //ketika icon ditekan
                                                      Navigator.pop(context);
                                                    },
                                                    child: Image.asset(
                                                      'assets/images/error.png',
                                                      height: 30,
                                                      width: 30,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),

                                            SizedBox(
                                              height: 25,
                                            ),
                                            //note untuk course
                                            TextField(
                                                obscureText: isHiddenCourse,
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    hintText: "username",
                                                    labelText: "username",
                                                    suffixIcon: InkWell(
                                                        onTap: toogleCourseView,
                                                        child: Icon(isHiddenCourse
                                                            ? Icons
                                                                .visibility_outlined
                                                            : Icons
                                                                .visibility_off_outlined)))),
                                            SizedBox(
                                              height: 25,
                                            ),
                                            //note untuk password
                                            TextField(
                                                obscureText: isHiddenPassword,
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    hintText: "password",
                                                    labelText: "password",
                                                    suffixIcon: InkWell(
                                                        onTap:
                                                            tooglePasswordView,
                                                        child: Icon(isHiddenPassword
                                                            ? Icons.lock_outline
                                                            : Icons
                                                                .lock_open_outlined)))),

                                            SizedBox(
                                              height: 25,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  width: 20,
                                                  height: 20,
                                                  decoration: BoxDecoration(
                                                      color: Color(0xFFD7D7D7),
                                                      border: Border.all(
                                                          color: primaryColor,
                                                          width: 3),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: Checkbox(
                                                    value: isChecked,
                                                    checkColor:
                                                        Color(0xFFD7D7D7),
                                                    onChanged: (value) {
                                                      setState(() {
                                                        this.isChecked = value!;
                                                      });
                                                    },
                                                  ),
                                                ),
                                                SizedBox(width: 5),
                                                Text("Remember Me",
                                                    style: TextStyle(
                                                        color: primaryColor,
                                                        fontSize: 12)),
                                                Spacer(),
                                                Text("Forgot Paswword?",
                                                    style: TextStyle(
                                                        color: primaryColor,
                                                        fontSize: 12))
                                              ],
                                            ),
                                            SizedBox(
                                              height: 25,
                                            ),
                                            Container(
                                                height: 60,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    2 * defaultMargin,
                                                child: ElevatedButton(
                                                    onPressed: (){
                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                                                    },
                                                    child: Text(
                                                      'Login',
                                                      style: TextStyle(
                                                          color:
                                                              whiteColor),
                                                    ),
                                                    style: ElevatedButton.styleFrom(
                                                        primary: blackColor,
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15))))),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Don't have an Account?  ",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15),
                                                ),
                                                Text(
                                                  "Register",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: defaultMargin,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              );
                            },
                          );
                        });
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18)
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: LastColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                )),
            SizedBox(
              height: 100,
            ),
            Text(
              'Keripik Tempe Karina',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
            SizedBox(
              height: defaultMargin,
            ),
          ],
        ),
      ),
    );
  }

  void toogleUsernameView() {
    setState(() {
      isHidden = !isHidden;
    });
  }

  void toogleCourseView() {
    setState(() {
      isHiddenCourse = !isHiddenCourse;
    });
  }

  void tooglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  void toogleConfirmPasswordView() {
    setState(() {
      isHiddenConfirmPassword = !isHiddenConfirmPassword;
    });
  }
}
