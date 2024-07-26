import 'package:flutter/material.dart';
import 'package:pingolearn/Providers/homescreenprovider.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData(){
    final homescreenProvider = Provider.of<Homescreenprovider>(listen: false,context);
    homescreenProvider.fetchComments();

  }
  @override
  Widget build(BuildContext context) {
    final homescreenProvider = Provider.of<Homescreenprovider>(listen: false,context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(homescreenProvider.commentsModel?.name ?? "")
          ],
        ),
      ),
    );
  }
}
