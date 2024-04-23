import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text(
              'Forgot Password?',
              style: TextStyle(fontSize: 24.0),
            ),
            const Text(
              'To reset your password, you need your email or\nmobile number that can be authenticated',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
            const TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle reset password button press
                    },
                    child: const Text('RESET PASSWORD'),
                  ),
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Try another way? By Phone Number'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
