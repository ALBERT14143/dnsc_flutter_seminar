import 'package:flutter/material.dart';
import 'package:flutter_seminar/model/user.dart';
import 'package:flutter_seminar/provider/sql/sqf_testing.dart';

class ActionDialog extends StatefulWidget {
  const ActionDialog({
    required this.actionTesting,
    this.user,
    super.key,
  });

  final User? user;
  final ActionTesting actionTesting;

  @override
  State<ActionDialog> createState() => _ActionDialogState();
}

class _ActionDialogState extends State<ActionDialog> {

  SqlTesting sqlTesting = SqlTesting();

  @override
  void initState() {
    initData();
    super.initState();
  }

  TextEditingController fCtrlr = TextEditingController();
  TextEditingController mCtrlr = TextEditingController();
  TextEditingController lCtrlr = TextEditingController();
  TextEditingController pCtrlr = TextEditingController();


  initData() {
    if (widget.actionTesting == ActionTesting.edit) {
      fCtrlr.text = widget.user!.fName!;
      mCtrlr.text = widget.user!.mName!;
      lCtrlr.text = widget.user!.lName!;
      pCtrlr.text = widget.user!.position!;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppTextField(
            controller: fCtrlr,
            hintText: "First Name",
          ),
          AppTextField(
            controller: mCtrlr,
            hintText: "Middle Name",
          ),
          AppTextField(
            controller: lCtrlr,
            hintText: "Last Name",
          ),
          AppTextField(
            controller: pCtrlr,
            hintText: "Position",
          ),

          widget.actionTesting == ActionTesting.create ? Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 18),
                backgroundColor: Colors.green
              ),
              onPressed: () async {
                var user = User(
                  fName: fCtrlr.text,
                  mName: mCtrlr.text,
                  lName: lCtrlr.text,
                  position: pCtrlr.text
                );
                await sqlTesting.create(user);
                Navigator.pop(context);
              }, 
              child: const Text("CREATE")
            ),
          )
          : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      backgroundColor: Colors.red
                    ),
                    onPressed: () async {
                      await sqlTesting.delete(widget.user!.id!);
                      Navigator.pop(context);
                    }, 
                    child: const Text("DELETE")
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      backgroundColor: Colors.blue
                    ),
                    onPressed: () async {
                      var user = widget.user!.copyWith(
                        fName: fCtrlr.text,
                        mName: mCtrlr.text,
                        lName: lCtrlr.text,
                        position: pCtrlr.text
                      );
                      await sqlTesting.update(user);
                      Navigator.pop(context);
                    }, 
                    child: const Text("UPDATE")
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AppTextField extends StatelessWidget {
  const AppTextField({
    required this.controller,
    required this.hintText,
    super.key,
  });

  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText
        ),
      ),
    );
  }
}

enum ActionTesting{
  create,
  edit
}