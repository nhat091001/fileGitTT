import 'package:flutter/material.dart';
import 'package:ui_facebook/view/home_screen.dart';
import 'package:ui_facebook/view/singup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //
  static Future<User?> loginUsingEmailPassword({required String email, required String password, required BuildContext context}) async {
    FirebaseAuth auth=FirebaseAuth.instance;
    User? user;
    try{
      UserCredential userCredential=await auth.signInWithEmailAndPassword(email: email, password: password);
      user=userCredential.user;

    }on FirebaseAuthException catch(e){
      if(e.code =="user-not-found"){
        print('No user found for that email');
      }
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    //
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Image.asset('assets/images/banner.jpg'),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Text('English • 中文(台灣) •',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                            )),
                      ),
                      Container(
                        child: TextButton(
                          child: Text(
                            "Xem thêm...",
                            style: TextStyle(fontSize: 15),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(24.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        hintText: 'Số điện thoại hoặc email',
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 24, left: 24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                        hintText: 'Mật khẩu',
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  height: 40,
                  padding: const EdgeInsets.only(right: 24, left: 24),
                  child: FlatButton(
                    color: Color.fromARGB(255, 37, 98, 240),
                    child: Text(
                      'Đăng Nhập',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () async {

                      User ?user=await  loginUsingEmailPassword(email: _emailController.text, password: _passwordController.text, context: context);
                      print(user);
                      if(user!=null){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      }

                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      primary: Color.fromARGB(255, 0, 49, 165),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Quên Mật khẩu ?',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(right: 24, left: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 1,
                        child: Text(
                          '---------------------------------------------',
                          style:
                              TextStyle(backgroundColor: Colors.grey.shade400),
                        ),
                      ),
                      Container(
                        child: Text(
                          ' HOẶC ',
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 1,
                        child: Text(
                          '---------------------------------------------',
                          style:
                              TextStyle(backgroundColor: Colors.grey.shade400),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 35,
                  padding: const EdgeInsets.only(right: 24, left: 24),
                  child: FlatButton(
                    color: Color.fromARGB(255, 12, 167, 63),
                    child: Text(
                      'Tạo tài khoản Facebook mới',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SigUpScreen()));
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
