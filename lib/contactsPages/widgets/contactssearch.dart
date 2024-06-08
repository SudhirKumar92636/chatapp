import 'package:flutter/material.dart';

class ContactsSearch extends StatefulWidget {
  const ContactsSearch({super.key});

  @override
  State<ContactsSearch> createState() => _ContactsSearchState();
}

class _ContactsSearchState extends State<ContactsSearch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(children: [Expanded(
          child: TextFormField(
            textInputAction: TextInputAction.search,
            onSaved: (newValue) => {
              print(newValue),
            },
            decoration: const InputDecoration(
                hintText: 'Search contacts',
                prefixIcon: Icon(Icons.search)
            ),
          ))]),
    );
  }
}
