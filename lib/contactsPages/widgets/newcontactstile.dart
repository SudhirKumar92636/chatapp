import 'package:flutter/material.dart';

class NewContactsTile extends StatefulWidget {
  final String btnName;
  final IconData icon;
  final VoidCallback ontap;
  const NewContactsTile({Key? key, required this.btnName, required this.icon, required this.ontap}) : super(key: key);
  @override
  State<NewContactsTile> createState() => _NewContactsTileState();
}
class _NewContactsTileState extends State<NewContactsTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.ontap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Icon(widget.icon, size: 30),
            ),
            const SizedBox(width: 20),
            Text(widget.btnName, style: Theme.of(context).textTheme.bodyText1),
          ],
        ),
      ),
    );
  }
}
