import 'package:flutter/material.dart';
import 'package:flutter_application_1/loginpage.dart';

class FgtPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Forgot Password'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/fgtpwd.png', // Gambar ilustrasi
                      width: 100,
                      height: 100,
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'Lupa Password?',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Masukkan Email',
                        prefixIcon: Icon(Icons.email),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    ElevatedButton(
                      onPressed: () {
                        // Logika untuk mengirim email pemulihan password
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: Text(
                        'Kirim Email Pemulihan Password',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
            CircleAvatar(
              radius: 30,
              backgroundColor: Color(0xff4c505b),
              child: IconButton(
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pushReplacement(context,
                      MaterialPageRoute(builder:
                          (context) =>
                          MyLogin()
                      )
                    );
                    },
                  icon: Icon(
                    Icons.arrow_back,
                  )

              ),
            )
          ],
        ),
      ),
    );
  }
}
