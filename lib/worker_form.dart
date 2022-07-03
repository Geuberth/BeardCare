import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WorkerFormPage extends StatefulWidget {
  const WorkerFormPage({Key? key}) : super(key: key);

  @override
  State<WorkerFormPage> createState() => _WorkerFormPageState();
}

class _WorkerFormPageState extends State<WorkerFormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('Barber Form', style: TextStyle(color: Colors.amber)),
      ),
      body: Form(
        child: Column(
          children: [
            Container(),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'Geuberth Ibvanovich',
                labelText: 'Name',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.description),
                hintText: 'I\'m a fucking whore',
                labelText: 'About you',
              ),
            ),
            DataTable(columns: [
              DataColumn(
                  label: Text(
                'Style',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
              DataColumn(
                  label: Text(
                'Cost',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
            ], rows: [
              DataRow(cells: [
                DataCell(Text('Beard')),
                DataCell(Container(
                  width: 200,
                  height: 50,
                  child: TextFormField(
                    inputFormatters: [
                      ThousandsSeparatorInputFormatter(),
                    ],
                    decoration: InputDecoration(hintText: '10000'),
                    keyboardType: TextInputType.number,
                  ),
                ))
              ]),
              DataRow(cells: [
                DataCell(Text('The Sevens')),
                DataCell(Container(
                  width: 200,
                  height: 50,
                  child: TextFormField(
                    inputFormatters: [
                      ThousandsSeparatorInputFormatter(),
                    ],
                    decoration: InputDecoration(hintText: '10000'),
                    keyboardType: TextInputType.number,
                  ),
                ))
              ]),
              DataRow(cells: [
                DataCell(Text('Brows')),
                DataCell(Container(
                  width: 200,
                  height: 50,
                  child: TextFormField(
                    inputFormatters: [
                      ThousandsSeparatorInputFormatter(),
                    ],
                    decoration: InputDecoration(hintText: '10000'),
                    keyboardType: TextInputType.number,
                  ),
                ))
              ]),
            ]),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    color: Colors.amber,
                    padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 5),
                    onPressed: () {},
                    child: const Text('Create'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ThousandsSeparatorInputFormatter extends TextInputFormatter {
  static const separator = ','; // Change this to '.' for other locales

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Short-circuit if the new value is empty
    if (newValue.text.length == 0) {
      return newValue.copyWith(text: '');
    }

    // Handle "deletion" of separator character
    String oldValueText = oldValue.text.replaceAll(separator, '');
    String newValueText = newValue.text.replaceAll(separator, '');

    if (oldValue.text.endsWith(separator) &&
        oldValue.text.length == newValue.text.length + 1) {
      newValueText = newValueText.substring(0, newValueText.length - 1);
    }

    // Only process if the old value and new value are different
    if (oldValueText != newValueText) {
      int selectionIndex =
          newValue.text.length - newValue.selection.extentOffset;
      final chars = newValueText.split('');

      String newString = '';
      for (int i = chars.length - 1; i >= 0; i--) {
        if ((chars.length - 1 - i) % 3 == 0 && i != chars.length - 1)
          newString = separator + newString;
        newString = chars[i] + newString;
      }

      return TextEditingValue(
        text: newString.toString(),
        selection: TextSelection.collapsed(
          offset: newString.length - selectionIndex,
        ),
      );
    }

    // If the new value and old value are the same, just return as-is
    return newValue;
  }
}
