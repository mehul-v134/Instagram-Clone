import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insta_clone/resources/auth_methods.dart';
import 'package:insta_clone/utils/colors.dart';
import 'package:insta_clone/utils/utils.dart';
import 'package:insta_clone/widgets/text_field_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose(); // TODO: implement dispose
    super.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethod().loginUser(
        email: _emailController.text, password: _passController.text);
    setState(() {
      _isLoading = false;
    });
    if (res == "success") {
      showSnackBar("Successful Login", context);
    } else {
      showSnackBar(res, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        width: double.infinity,
        child: Column(
          children: [
            Flexible(
              child: Container(),
              flex: 1,
            ),
            SvgPicture.asset(
              "assets/ic_instagram.svg",
              color: mobilePColor,
              height: 64,
            ),
            SizedBox(height: 64),
            TextFieldInput(
                hintText: "Enter Email",
                textEditingController: _emailController,
                textInputType: TextInputType.emailAddress),
            SizedBox(height: 24),
            TextFieldInput(
              hintText: "Enter Password",
              textEditingController: _passController,
              textInputType: TextInputType.text,
              isPass: true,
            ),
            SizedBox(height: 24),
            GestureDetector(
              onTap: loginUser,
              child: Container(
                  child: _isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                          color: mobilePColor,
                        ))
                      : Text("Login"),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      color: blueColor)),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    child: Text("Dont have an Account?"),
                    padding: EdgeInsets.symmetric(vertical: 10)),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                      child: Text(
                        " Sign Up",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10)),
                )
              ],
            ),
            Flexible(
              child: Container(),
              flex: 1,
            ),
          ],
        ),
      )),
    );
  }
}
