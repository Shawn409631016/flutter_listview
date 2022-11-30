import 'package:flutter/material.dart';

void main() {
  runApp(ListViewApp());
}

class ListViewApp extends StatefulWidget {
  const ListViewApp({Key? key}) : super(key: key);

  @override
  State<ListViewApp> createState() => _ListViewAppState();
}

class _ListViewAppState extends State<ListViewApp> {
  final List<String> entries = [
    '第一位',
    '第二位',
    '第三位',
    '第四位',
    '第五位',
    '第六位',
    '第七位',
    '第八位'
  ];
  final List<String> subs = [
    '0955342342',
    '0955377742',
    '0955888842',
    '0933344742',
    '0957899842',
    '0923465742',
    '0956865642',
    '0955555542'
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ListView Example'),
        ),
        body: entries.length > 0
            ? ListView.separated(
                itemCount: entries.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.account_circle_rounded, size: 45),
                    title: Text(entries[index]),
                    subtitle: Text(subs[index]),
                    onTap: () {
                      final snackBar = SnackBar(
                        duration: const Duration(seconds: 1),
                        content: Text('即將撥打給 ${entries[index]}',
                            style: const TextStyle(fontSize: 24)),
                        backgroundColor: Colors.blueGrey,
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                  );
                },
                separatorBuilder: (context, index) => const Divider(
                  color: Colors.blueGrey,
                ),
              )
            : const Center(
                child: Text('null'),
              ),
      ),
    );
  }
}
