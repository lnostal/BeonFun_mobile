// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';

class SendMessageBottomView extends StatefulWidget {
  final void Function() onSend;
  final void Function() onAttach;
  Widget childWidget;
  final controller;

  SendMessageBottomView(
      {super.key,
      required this.childWidget,
      required this.controller,
      required this.onSend,
      required this.onAttach});

  @override
  State<SendMessageBottomView> createState() => _SendMessageBottomViewState();
}

class _SendMessageBottomViewState extends State<SendMessageBottomView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: widget.childWidget,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextFormField(
          controller: widget.controller,
          keyboardType: TextInputType.multiline,
          minLines: 1,
          maxLines: 10,
          style:
              TextStyle(color: Theme.of(context).textTheme.bodyMedium!.color),
          decoration: InputDecoration(
            prefixIcon: IconButton(
              icon: const Icon(Icons.attach_file),
              onPressed: widget.onAttach,
            ),
            suffixIcon: IconButton(
                onPressed: widget.onSend,
                icon: const Icon(
                  Icons.send,
                )),
            contentPadding: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
            hintText: "enter comment...",
          ),
        ),
      ),
    );
  }
}
