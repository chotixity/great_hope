import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Auth/storage.dart';
import 'package:great_hope/widgets/bottom_bar.dart';
import 'package:great_hope/widgets/custom_button.dart';

class SignUp extends StatefulWidget {
  static const routeName = '/sign-up';
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

enum Gender {
  male,
  female,
}

class _SignUpState extends State<SignUp> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _firestoreInstance = Firestore();
  Gender? _gender = Gender.male;

  @override
  void dispose() {
    _firstNameController.dispose();
    _emailController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  bool confirmPassword() {
    if (_passwordController.text.trim() ==
        _confirmPasswordController.text.trim())
      return true;
    else
      return false;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Sign Up'),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: _firstNameController,
                decoration: InputDecoration(
                  labelText: 'First Name',
                  contentPadding: const EdgeInsets.only(left: 8.0),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: theme.primaryColor),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _lastNameController,
                decoration: InputDecoration(
                  labelText: 'last Name',
                  contentPadding: const EdgeInsets.only(left: 8.0),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: theme.primaryColor),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                //style: TextStyle(fontSize: 10),
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'email',
                  contentPadding: const EdgeInsets.only(left: 8.0),
                  border: OutlineInputBorder(
                    gapPadding: 0.0,
                    borderSide: BorderSide(color: theme.primaryColor),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'phone Number',
                  contentPadding: const EdgeInsets.only(left: 8.0),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: theme.primaryColor),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'password',
                  contentPadding: const EdgeInsets.only(left: 8.0),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: theme.primaryColor),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(
                  labelText: 'confirm password',
                  contentPadding: const EdgeInsets.only(left: 8.0),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: theme.primaryColor),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .4,
                    child: ListTile(
                      title: const Text(
                        'Male',
                        style: TextStyle(fontSize: 16),
                      ),
                      leading: Radio<Gender>(
                        value: Gender.male,
                        groupValue: _gender,
                        onChanged: (Gender? Value) {
                          setState(() {
                            _gender = Value;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .45,
                    child: ListTile(
                      title: const Text(
                        'Female',
                        style: TextStyle(fontSize: 16),
                      ),
                      leading: Radio<Gender>(
                        value: Gender.female,
                        groupValue: _gender,
                        onChanged: (Gender? Value) {
                          setState(() {
                            _gender = Value;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              CustomButtton('Next', () async {
                if (confirmPassword()) {
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: _emailController.text.trim(),
                    password: _passwordController.text.trim(),
                  );
                  _firestoreInstance.addUserDetails(
                    _firstNameController.text.trim(),
                    _lastNameController.text.trim(),
                    _phoneController.text.trim(),
                    _emailController.text.trim(),
                    _gender.toString(),
                  );
                  Navigator.of(context)
                      .pushReplacementNamed(Homepage.routeName);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Password does not match'),
                    ),
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
