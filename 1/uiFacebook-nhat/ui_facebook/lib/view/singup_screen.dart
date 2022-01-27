import 'package:flutter/material.dart';

class SigUpScreen extends StatefulWidget {
  const SigUpScreen({Key? key}) : super(key: key);

  @override
  _SigUpScreenState createState() => _SigUpScreenState();
}

class _SigUpScreenState extends State<SigUpScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            backgroundColor: Colors.white30,
            elevation: 0,
            title: Text(
              'Tạo tài khoản mới',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back, color: Colors.black),
            )),
        backgroundColor: Colors.white,
        body: MyCustomFormSigUp(),
      ),
    );
  }
}

class MyCustomFormSigUp extends StatefulWidget {
  @override
  MyCustomFormSigUpState createState() {
    return MyCustomFormSigUpState();
  }
}

class MyCustomFormSigUpState extends State<MyCustomFormSigUp> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.asset('assets/images/bannerReg.jpg'),
              Container(
                margin: const EdgeInsets.only(top: 10),
                alignment: Alignment.center,
                child: Text(
                  'Tham gia facebook',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Text('Chúng tôi sẽ giúp bạn tạo tài khoản mới dễ dàng.'),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Nhập tên của bạn',
                  labelText: 'Họ và tên',
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Nhập số điện thoại',
                  labelText: 'Số điện thoại',
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Nhập mật khẩu',
                  labelText: 'Mật khẩu',
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Nhập ngày sinh của bạn',
                  labelText: 'Ngày sinh',
                ),
              ),
              Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 20),
                  height: 40,
                  color: Color.fromARGB(255, 37, 98, 240),
                  child: FlatButton(
                    child: Text('Tạo tài khoản',
                        style: TextStyle(color: Colors.white)),
                    onPressed: () {},
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
