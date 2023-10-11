import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:generate_pdf/generate.dart';

import '../widget/button_widget.dart';
import '../widget/title_widget.dart';

class PdfPage extends StatefulWidget {
  @override
  _PdfPageState createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text(""),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(32),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const TitleWidget(
                  icon: Icons.picture_as_pdf,
                  text: 'Generate Invoice',
                ),
                const SizedBox(height: 48),
                ButtonWidget(
                  text: 'Invoice PDF',
                  onClicked: () async {
                    // final date = DateTime.now();
                    // final dueDate = date.add(Duration(days: 7));

                    // final invoice = Invoice(
                    //   supplier: Supplier(
                    //     name: 'Sarah Field',
                    //     address: 'Sarah Street 9, Beijing, China',
                    //     paymentInfo: 'https://paypal.me/sarahfieldzz',
                    //   ),
                    //   customer: Customer(
                    //     name: 'Apple Inc.',
                    //     address: 'Apple Street, Cupertino, CA 95014',
                    //   ),
                    //   info: InvoiceInfo(
                    //     date: date,
                    //     dueDate: dueDate,
                    //     description: 'My description...',
                    //     number: '${DateTime.now().year}-9999',
                    //   ),
                    //   items: [
                    //     InvoiceItem(
                    //       description: 'Coffee',
                    //       date: DateTime.now(),
                    //       quantity: 3,
                    //       vat: 0.19,
                    //       unitPrice: 5.99,
                    //     ),
                    //     InvoiceItem(
                    //       description: 'Water',
                    //       date: DateTime.now(),
                    //       quantity: 8,
                    //       vat: 0.19,
                    //       unitPrice: 0.99,
                    //     ),
                    //     InvoiceItem(
                    //       description: 'Orange',
                    //       date: DateTime.now(),
                    //       quantity: 3,
                    //       vat: 0.19,
                    //       unitPrice: 2.99,
                    //     ),
                    //     InvoiceItem(
                    //       description: 'Apple',
                    //       date: DateTime.now(),
                    //       quantity: 8,
                    //       vat: 0.19,
                    //       unitPrice: 3.99,
                    //     ),
                    //     InvoiceItem(
                    //       description: 'Mango',
                    //       date: DateTime.now(),
                    //       quantity: 1,
                    //       vat: 0.19,
                    //       unitPrice: 1.59,
                    //     ),
                    //     InvoiceItem(
                    //       description: 'Blue Berries',
                    //       date: DateTime.now(),
                    //       quantity: 5,
                    //       vat: 0.19,
                    //       unitPrice: 0.99,
                    //     ),
                    //     InvoiceItem(
                    //       description: 'Lemon',
                    //       date: DateTime.now(),
                    //       quantity: 4,
                    //       vat: 0.19,
                    //       unitPrice: 1.29,
                    //     ),
                    //   ],
                    // );

                    // final pdfFile = await PdfInvoiceApi.generate(invoice);

                    // PdfApi.openFile(pdfFile);
                    await pdf("MD. Sharif Ullah", "Khilkhet",
                            DateTime.now().toIso8601String(), 1330)
                        .then((file) async {
                      log(file.path);
                      // await showPdf(file.path);
                      showGeneralDialog(
                        context: context,

                        barrierColor:
                            Colors.black12.withOpacity(0.6), // Background color
                        barrierDismissible: false,
                        barrierLabel: 'Dialog',
                        transitionDuration: const Duration(milliseconds: 400),
                        pageBuilder: (_, __, ___) {
                          return showPdf(file.path);
                        },
                      );
                      // await OpenFile.open(file.path);
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      );
}

showPdf(path) {
  return Container(
    child: PDFView(
      filePath: path,
      enableSwipe: true,
      swipeHorizontal: true,
      autoSpacing: false,
      pageFling: false,
      onRender: (_pages) {
        // setState(() {
        //   pages = _pages;
        //   isReady = true;
        // });
      },
      onError: (error) {
        print(error.toString());
      },
      onPageError: (page, error) {
        print('$page: ${error.toString()}');
      },
      onViewCreated: (PDFViewController pdfViewController) {
        // _controller.complete(pdfViewController);
      },
      onPageChanged: (int? page, int? total) {
        print('page change: $page/$total');
      },
    ),
  );
}
