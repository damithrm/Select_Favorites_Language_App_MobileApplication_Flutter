import 'package:flutter/material.dart';

class LoadLanguage extends StatefulWidget {
  const LoadLanguage({super.key});

  @override
  State<LoadLanguage> createState() => _LoadLanguageState();
}

class _LoadLanguageState extends State<LoadLanguage> {
  final List<String> entries = <String>[
    'Java',
    'Python',
    'JavaScript',
    'PHP',
    'Ruby',
    'SQL',
    'C++',
    'Perl',
    'Assembly language',
    'Swift',
    'HTML',
    'Objective-C',
    'Scala',
    'Rust',
    'Swift',
    'Lisp',
    'COBOL',
    'Ada',
    'Kotlin',
    'TypeScript',
    'Fortran',
    'Dart',
    'BASIC'
  ];
  final _saveEntries = Set<String>();

  Widget _buildList() {
    return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildRow(entries[index]);
          // return Container(
          //   height: 50,
          //   color: Colors.amber[600],
          //   child: Center(child: Text('Entry ${entries[index]}')),
          // );
        });
  }

  Widget _buildRow(String pair) {
    final alreadySaved = _saveEntries.contains(pair);

    return ListTile(
      title: Text(pair, style: TextStyle(fontSize: 18.0)),
      trailing: Icon(alreadySaved ? Icons.favorite : Icons.favorite_border,
          color: alreadySaved ? Colors.red : null),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saveEntries.remove(pair);
          } else {
            _saveEntries.add(pair);
          }
        });
      },
    );
  }

  void _pushSaved() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      final Iterable<ListTile> tiles = _saveEntries.map((String pair) {
        return ListTile(title: Text(pair, style: TextStyle(fontSize: 16.0)));
      });
      final List<Widget> divided =
          ListTile.divideTiles(context: context, tiles: tiles).toList();
      return Scaffold(
          appBar: AppBar(title: Text('Save Languages')),
          body: ListView(children: divided));
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Language Selecter'),
          actions: <Widget>[
            IconButton(onPressed: _pushSaved, icon: Icon(Icons.list))
          ],
        ),
        body: _buildList());
  }
}
