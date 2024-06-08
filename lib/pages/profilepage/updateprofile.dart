import 'package:flutter/material.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Profile"),

      ),
     body: ListView(
       children: [
         Padding(
           padding: const EdgeInsets.all(10.0),
           child: Column(
             children: [
                 Container(
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10),
                     color: Theme.of(context).colorScheme.primaryContainer
                   ),
                   child: Row(
                     children: [
                       Expanded(child: Column(
                         children: [
                           Container(
                             width: 200,
                             height: 250,
                             decoration: BoxDecoration(
                               color: Theme.of(context).colorScheme.background,
                               shape: BoxShape.circle
                             ),
                             child: const Center(
                               child: Icon(Icons.image,size: 50,),
                             ),
                           ),
                          const SizedBox(height: 10,),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text("Personal Information's")
                              ],
                            ),

                          ),
                           const SizedBox(height: 10,),
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Row(
                               children: [
                                 Text("Name",style: Theme.of(context).textTheme.bodyMedium,)
                               ],
                             ),
                           ),
                           const SizedBox(height: 10,),
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: TextFormField(
                               keyboardType: TextInputType.text,
                               decoration: const InputDecoration(
                                 hintText: 'Sudhir Kumar',
                                 prefixIcon: Icon(Icons.person)
                               ),
                             ),
                           ),
                           const SizedBox(height: 10,),

                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Row(
                               children: [
                                 Text("Email Id",style: Theme.of(context).textTheme.bodyMedium,)
                               ],
                             ),
                           ),
                           const SizedBox(height: 10,),
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: TextFormField(
                               keyboardType: TextInputType.emailAddress,

                               decoration: const InputDecoration(
                                 hintText: 'sudhirkumar.edugaon@gmail.com',
                                 prefixIcon: Icon(Icons.email)
                               ),
                             ),
                           ),
                           const SizedBox(height: 10,),
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Row(
                               children: [
                                 Text("Phone Number",style: Theme.of(context).textTheme.bodyMedium,)
                               ],
                             ),
                           ),
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: TextFormField(
                               keyboardType: TextInputType.emailAddress,
                               decoration: const InputDecoration(
                                   hintText: '6206174721',
                                   prefixIcon: Icon(Icons.phone)
                               ),
                             ),
                           ),
                           const SizedBox(height: 10,),
                         ElevatedButton.icon(onPressed: (){},label: const Text('Update'),
                         icon: const Icon(Icons.update),),

                         ],
                       ),

                       )
                     ],
                   ),
                 )
             ],
           ),
         ),
       ],
     ),

    );
  }
}
