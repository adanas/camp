import 'package:camp_database/signup/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'login_model.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mailController = TextEditingController();
    final passwordController = TextEditingController();

    return ChangeNotifierProvider<LoginModel>(
      create: (_) => LoginModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('login'),
        ),
        body: Consumer<LoginModel>(
            builder: (context, model, child) {
              return Column(children: <Widget>[
                // email
                TextField(
                  controller: mailController,
                  decoration: InputDecoration(hintText: 'example@hoge.com'),
                  onChanged: (text){
                    model.mail = text;
                    //TextField();
                  },
                ),
                // password
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(hintText: 'password'),
                  obscureText: true,
                  onChanged: (text){
                    model.password = text;
                    //TextField();
                  },
                ),
                // ログイン
                SizedBox(
                  width: 90,
                  child: ElevatedButton(
                    child: Text('login'),
                    onPressed: () async {
                      try {
                        //await model.login();
                        //_showDialog(context, 'ログイン完了');
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => BookListPage()),
                        // );
                        // todo ログイン処理
                      }
                      catch(e) {
                        _showDialog(context, e.toString());
                      }

                    },
                  ),
                ),
                // 新規登録
                SizedBox(
                  width: 90,
                  child: ElevatedButton(
                    child: Text('sign up'),
                    onPressed: () async {
                       Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => SignUpPage()),
                       );
                    },
                  ),
                ),
              ],
              );
            }
        ),
      ),
    );
  }
}

Future<void> _showDialog(BuildContext context, String title) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title:Text(title),
        actions: <Widget>[
          ElevatedButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );

  return null;
}
