import 'package:flutter/material.dart';

class Cardbutton extends StatelessWidget {
  final String lable;
  final Function onTap;
  const Cardbutton({super.key, this.lable = "lable", required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          height: 250,
          width: 350,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 197, 197, 197),
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            boxShadow: [BoxShadow()],
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
                child: Text(
              lable,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Color.fromARGB(226, 0, 0, 0), fontSize: 30),
            )),
          ),
        ),
      ),
    );
  }
}
