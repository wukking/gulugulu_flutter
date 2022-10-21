import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(this.label,{super.key,this.onPressed});
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){}, child: Text(label));
  }
}
