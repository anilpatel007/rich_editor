import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rich_editor/rich_editor.dart';

class CustomToolbarDemo extends StatefulWidget {
  @override
  _CustomToolbarDemoState createState() => _CustomToolbarDemoState();
}

class _CustomToolbarDemoState extends State<CustomToolbarDemo> {
  GlobalKey<RichEditorState> keyEditor = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Toolbar Demo'),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2.8,
            child: RichEditor(
              key: keyEditor,
              editorOptions: RichEditorOptions(
                baseTextColor: Colors.black,
                placeholder: 'Write about this',
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                baseFontFamily: 'Roboto',
                barPosition: BarPosition.CUSTOM,
              ),
            ),
          ),
          Flexible(
            child: Container(
              color: Colors.white,
              child: Row(
                children: [
                  TabButton(
                    tooltip: '',
                    icon: Icon(Icons.format_bold),
                    onTap: () async {
                      await keyEditor.currentState!.javascriptExecutor
                          .setBold();
                    },
                  ),
                  TabButton(
                    tooltip: 'Italic',
                    icon: Icon(Icons.format_italic),
                    onTap: () async {
                      await keyEditor.currentState!.javascriptExecutor
                          .setItalic();
                    },
                  ),
                  TabButton(
                    tooltip: 'Underline',
                    icon: Icon(Icons.format_underline),
                    onTap: () async {
                      await keyEditor.currentState!.javascriptExecutor
                          .setUnderline();
                    },
                  ),
                  TabButton(
                    tooltip: 'Bullet List',
                    icon: Icon(Icons.format_list_bulleted),
                    onTap: () async {
                      await keyEditor.currentState!.javascriptExecutor
                          .insertBulletList();
                    },
                  ),
                  TabButton(
                    tooltip: 'Numbered List',
                    icon: Icon(Icons.format_list_numbered),
                    onTap: () async {
                      await keyEditor.currentState!.javascriptExecutor
                          .insertNumberedList();
                    },
                  ),
                ],
              ),
            ),
          ),
          Text(keyEditor.currentState?.html.toString() ?? "")
        ],
      ),
    );
  }
}
