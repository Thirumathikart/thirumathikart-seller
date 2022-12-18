import 'package:flutter/material.dart';
import 'package:thirumathikart_seller/widgets/button/register_button.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: deviceHeight,
            ),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Color.fromRGBO(251, 242, 207, 1),
              ),
              child: Center(
                child: Card(
                  elevation: 12,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          'Thirumathikart',
                          style: TextStyle(
                              fontSize: 40,
                              color: Colors.black54,
                              fontFamily: 'Avenir',
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.only(
                                    top: 20, left: 10, right: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Material(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  elevation: 2,
                                  child: Center(
                                    child: TextFormField(
                                      style: const TextStyle(
                                          // fontSize: 19,
                                          ),
                                      decoration: const InputDecoration(
                                        hintText: 'First Name',
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.only(
                                          left: 20.0,
                                        ),
                                      ),
                                      keyboardType: TextInputType.name,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    top: 20, left: 10, right: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Material(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  elevation: 2,
                                  child: Center(
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        hintText: 'Last Name',
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.only(
                                          left: 20.0,
                                        ),
                                      ),
                                      keyboardType: TextInputType.name,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    top: 20, left: 10, right: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Material(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  elevation: 2,
                                  child: Center(
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        hintText: 'Enter Email',
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.only(
                                          left: 20.0,
                                        ),
                                      ),
                                      keyboardType: TextInputType.emailAddress,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    top: 20, left: 10, right: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Material(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  elevation: 2,
                                  child: Center(
                                    child: TextFormField(
                                      obscureText: true,
                                      decoration: const InputDecoration(
                                        hintText: 'Enter Password',
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.only(
                                          left: 20.0,
                                        ),
                                      ),
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    top: 20, left: 10, right: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Material(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  elevation: 2,
                                  child: Expanded(
                                    child: Center(
                                      child: TextFormField(
                                        obscureText: true,
                                        decoration: const InputDecoration(
                                          hintText: 'Reenter Password',
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.only(
                                            left: 20.0,
                                          ),
                                        ),
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const RegisterButton(),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
