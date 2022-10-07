import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    required this.label,
    required this.onPressed,
    this.expand = false,
    super.key,
  });

  final String label;
  final VoidCallback onPressed;
  final bool expand;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.orange),
      ),
      onPressed: onPressed,
      child: SizedBox(
        width: expand ? double.infinity : null,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
