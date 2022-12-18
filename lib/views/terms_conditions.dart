import 'package:flutter/material.dart';
import 'package:thirumathikart_seller/constants/terms_constants.dart';
import 'package:thirumathikart_seller/widgets/app_bar.dart';

class Termspage extends StatelessWidget {
  const Termspage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: appBar(TermsConditions.termstitle),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(10.0),
              ),
              Text(
                TermsConditions.termstitle,
                style: const TextStyle(
                    height: 3, fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0)),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  TermsConditions.termscontent,
                  style: const TextStyle(height: 1.5, fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      );
}
