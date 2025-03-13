import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  final String text;
  final Color color1;
  final Color color2;
  final Color textColor1;
  final Color textColor2;
  final VoidCallback onPressed;
  final double width;
  final double height;

  const AnimatedButton({
    super.key,
    required this.text,
    required this.color1,
    required this.color2,
    required this.textColor1,
    required this.textColor2,
    required this.onPressed,
    required this.width,
    required this.height,
    
  });

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> with SingleTickerProviderStateMixin{
  bool selected = false;
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this,
    duration: Duration(milliseconds: 300),
    lowerBound: 0,
    upperBound: 1, 
    );
    
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onPressed();
        setState(() {
          selected = !selected;
        });
      },
      
        child: AnimatedBuilder(
         animation: _animationController,
         builder: (context, child) {
          return Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              color: selected ? widget.color1 : widget.color2,
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 30),
            child: Text(
              widget.text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: selected ? widget.textColor1 : widget.textColor2,
                fontSize: 22,
                fontWeight: FontWeight.w400,
              ),
            ),
          );
        },
      ),
    );
  }
}
