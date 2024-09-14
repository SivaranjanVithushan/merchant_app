import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:merchant_app/module/shared/custom_stepper.dart';

class OrderDetailsPopup extends StatelessWidget {
  const OrderDetailsPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: const Icon(
                  Icons.close,
                  size: 16,
                  color: Color(0xff2E3A59),
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            Text('View Order Details',
                style: GoogleFonts.inter(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff606060))),
            const SizedBox(height: 16),
            Flexible(
              child: SingleChildScrollView(
                child: CustomStepper(
                  steps: [
                    StepperStep(
                      content: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/icons/invoice.png',
                            width: 68,
                            height: 68,
                          ),
                          const SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 16),
                                decoration: BoxDecoration(
                                    color: const Color(0xffF8FAFF),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Text(
                                  'CF0003034',
                                  style: GoogleFonts.inter(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Text(
                                'COD: Rs.250',
                                style: GoogleFonts.inter(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                'Weight: 1kg',
                                style: GoogleFonts.inter(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                'Created on: 02/06/2023 14:49',
                                style: GoogleFonts.inter(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    StepperStep(
                      title: Text(
                        'Merchant Details',
                        style: GoogleFonts.inter(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Iphone Store',
                            style: GoogleFonts.inter(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'MC-0002',
                            style: GoogleFonts.inter(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'Pickup Address: 280, Duplication Road, Colombo',
                            style: GoogleFonts.inter(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'Origin City: Nugegoda',
                            style: GoogleFonts.inter(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'Origin Warehouse: Trans Express',
                            style: GoogleFonts.inter(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    StepperStep(
                      title: Text(
                        'Customer Details',
                        style: GoogleFonts.inter(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mr. john Deo',
                            style: GoogleFonts.inter(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'Nugegoda',
                            style: GoogleFonts.inter(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'john@gmail.com',
                            style: GoogleFonts.inter(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            '0777678340',
                            style: GoogleFonts.inter(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'Destination City: Colombo 01',
                            style: GoogleFonts.inter(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'Destination Warehouse: Trans Express',
                            style: GoogleFonts.inter(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
                _showAdditionalPopup(context);
              },
              icon: const Icon(
                Icons.keyboard_double_arrow_down,
                color: Color(0xff2E3A59),
              ),
            )
          ],
        ),
      ),
    );
  } // Function to show the additional dialog with tabs

  void _showAdditionalPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: const EdgeInsets.all(16),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.75,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: DefaultTabController(
              length: 3,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: const Icon(
                        Icons.close,
                        size: 16,
                        color: Color(0xff2E3A59),
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                  TabBar(
                    padding: EdgeInsets.zero,
                    labelPadding: EdgeInsets.zero,
                    labelColor: Colors.black,
                    dividerColor: Colors.transparent,
                    dividerHeight: 0,
                    unselectedLabelColor: Colors.black,
                    indicatorColor: Colors.blue,
                    labelStyle: GoogleFonts.inter(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                    ),
                    tabs: const [
                      Tab(text: 'Order History'),
                      Tab(text: 'Invoice History'),
                      Tab(text: 'General Remark'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: TabBarView(
                      children: [
                        _buildOrderHistory(),
                        _buildInvoiceHistory(),
                        _buildGeneralRemark(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Order History Tab content
  Widget _buildOrderHistory() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
      child: SingleChildScrollView(
        child: CustomStepper(
          steps: [
            StepperStep(
              title: Text(
                'DELIVERED',
                style: GoogleFonts.inter(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Collected COD Rs. 250.00. Rider: Test 09 Rider',
                    style: GoogleFonts.inter(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          'assets/images/Ellipse 130.png',
                          width: 32,
                          height: 32,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Column(
                        children: [
                          Text(
                            'Demo Admin',
                            style: GoogleFonts.inter(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'Super Admin',
                            style: GoogleFonts.inter(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            StepperStep(
              title: Text(
                'ASSIGNED TO DESTINATION RIDER',
                style: GoogleFonts.inter(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Collected COD Rs. 250.00. Rider: Test 09 Rider',
                    style: GoogleFonts.inter(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          'assets/images/Ellipse 130.png',
                          width: 32,
                          height: 32,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Column(
                        children: [
                          Text(
                            'Demo Admin',
                            style: GoogleFonts.inter(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'Super Admin',
                            style: GoogleFonts.inter(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            StepperStep(
              title: Text(
                'RECEIVED TO ORIGIN WAREHOUSE',
                style: GoogleFonts.inter(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Collected COD Rs. 250.00. Rider: Test 09 Rider',
                    style: GoogleFonts.inter(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          'assets/images/Ellipse 130.png',
                          width: 32,
                          height: 32,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Column(
                        children: [
                          Text(
                            'Demo Admin',
                            style: GoogleFonts.inter(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'Super Admin',
                            style: GoogleFonts.inter(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            StepperStep(
              title: Text(
                'RECEIVED TO ORIGIN WAREHOUSE',
                style: GoogleFonts.inter(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Collected COD Rs. 250.00. Rider: Test 09 Rider',
                    style: GoogleFonts.inter(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          'assets/images/Ellipse 130.png',
                          width: 32,
                          height: 32,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Column(
                        children: [
                          Text(
                            'Demo Admin',
                            style: GoogleFonts.inter(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'Super Admin',
                            style: GoogleFonts.inter(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Invoice History Tab content
  Widget _buildInvoiceHistory() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
      child: SingleChildScrollView(
        child: CustomStepper(
          steps: [
            StepperStep(
              title: Text(
                'Approved',
                style: GoogleFonts.inter(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'LKR 804',
                    style: GoogleFonts.inter(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          'assets/icons/user.png',
                          width: 31,
                          height: 31,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Column(
                        children: [
                          Text(
                            'Demo Admin',
                            style: GoogleFonts.inter(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'Super Admin',
                            style: GoogleFonts.inter(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            StepperStep(
              title: Text(
                'ASSIGNED TO DESTINATION RIDER',
                style: GoogleFonts.inter(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'LKR 804',
                    style: GoogleFonts.inter(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          'assets/icons/user.png',
                          width: 31,
                          height: 31,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Column(
                        children: [
                          Text(
                            'Demo Admin',
                            style: GoogleFonts.inter(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'Super Admin',
                            style: GoogleFonts.inter(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            StepperStep(
              title: Text(
                'RECEIVED TO ORIGIN WAREHOUSE',
                style: GoogleFonts.inter(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'LKR 804',
                    style: GoogleFonts.inter(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          'assets/icons/user.png',
                          width: 31,
                          height: 31,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Column(
                        children: [
                          Text(
                            'Demo Admin',
                            style: GoogleFonts.inter(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'Super Admin',
                            style: GoogleFonts.inter(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // General Remark Tab content
  Widget _buildGeneralRemark() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
      child: SingleChildScrollView(
        child: CustomStepper(
          steps: [
            StepperStep(
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  item(lable: 'Remarked By', value: 'Mr. John Deo'),
                  item(lable: 'Remark', value: 'Stock sold out'),
                  item(lable: 'Tags', value: 'No Specified Tags', tag: true),
                  item(lable: 'Remark Date', value: '08/06/2023 20:28'),
                  item(lable: 'Read By', value: '1'),
                ],
              ),
            ),
            StepperStep(
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  item(lable: 'Remarked By', value: 'Mr. Emma Deo'),
                  item(lable: 'Remark', value: 'Stock sold out'),
                  item(lable: 'Tags', value: 'No Specified Tags', tag: true),
                  item(lable: 'Remark Date', value: '08/06/2023 20:28'),
                  item(lable: 'Read By', value: '2'),
                ],
              ),
            ),
            StepperStep(
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  item(lable: 'Remarked By', value: 'Mr. John Deo'),
                  item(lable: 'Remark', value: 'Stock sold out'),
                  item(lable: 'Tags', value: 'No Specified Tags', tag: true),
                  item(lable: 'Remark Date', value: '08/06/2023 20:28'),
                  item(lable: 'Read By', value: '3'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget item({required String lable, required String value, bool tag = false}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Expanded(
          flex: 1,
          child: Text(
            lable,
            style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400),
          )),
      const Text('   :   '),
      if (tag) ...[
        Expanded(
            flex: 2,
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                    color: const Color(0xffFDCACA),
                    borderRadius: BorderRadius.circular(6)),
                child: Text(
                  value,
                  style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xffB42323)),
                ))),
      ] else ...[
        Expanded(
            flex: 2,
            child: Text(
              value,
              style:
                  GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400),
            )),
      ],
    ],
  );
}
