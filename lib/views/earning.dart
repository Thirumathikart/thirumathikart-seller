import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumathikart_seller/controllers/earning_controller.dart';
import 'package:thirumathikart_seller/widgets/app_bar.dart';
import 'package:thirumathikart_seller/constants/earning_constants.dart';
import 'package:thirumathikart_seller/config/themes.dart';

class EarningPage extends GetView<EarningController> {
  const EarningPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: appBar('Earning'),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Total Earnings: ${list.length * 35.35}',
                  style: TextStyle(
                      fontSize: 20,
                      color: AppTheme.textPrimary,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                child: Text(
                  'No. of Orders Completed: ${list.length}',
                  style: TextStyle(
                      fontSize: 20,
                      color: AppTheme.textPrimary,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.fromLTRB(100, 100, 100, 100),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/tklogo.jpeg')))),
              Divider(
                  color: AppTheme.divider,
                  thickness: 1),
              ListView.builder(
                itemBuilder: (context, index) => Card(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 32,
                      bottom: 32,
                      left: 16,
                      right: 16,
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Order #',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: AppTheme.textPrimary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                list[index]['order'].toString(),
                                style: TextStyle(
                                  fontSize: 17,
                                  color: AppTheme.textPrimary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Date: ',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: AppTheme.textPrimary,
                                ),
                              ),
                              Text(
                                list[index]['date'].toString(),
                                style: TextStyle(
                                  fontSize: 15,
                                  color: AppTheme.textPrimary,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Earnings: ',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: AppTheme.textPrimary,
                                ),
                              ),
                              Text(
                                list[index]['earning'].toString(),
                                style: TextStyle(
                                  fontSize: 15,
                                  color: AppTheme.textPrimary,
                                ),
                              ),
                            ],
                          ),
                        ]),
                  ),
                ),
                itemCount: list.length,
                primary: false,
                shrinkWrap: true,
              ),
              Divider(
                color: AppTheme.searchBar,
                thickness: 1,
                indent: 20,
                endIndent: 20,
              ),
            ],
          ),
        ),
      );
}
