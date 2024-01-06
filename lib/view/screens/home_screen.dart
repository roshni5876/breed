import 'package:flutter/material.dart';
import 'package:the_dogapi/model/apis/api_response.dart';
import 'package:the_dogapi/model/models/breed.dart';
import 'package:the_dogapi/view/widgets/breed_list_widget.dart';
import 'package:the_dogapi/view_model/breed_view_model.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  Widget getWidget(BuildContext context, ApiResponse apiResponse) {
    List<Breed>? mediaList = apiResponse.data as List<Breed>?;
    switch (apiResponse.status) {
      case Status.LOADING:
        return const Center(child: CircularProgressIndicator());
      case Status.COMPLETED:
        return BreedListWidget(
          mediaList: mediaList ?? [],
          function: (Breed breed) {},
        );
      case Status.ERROR:
        return const Center(
          child: Text('Please try again latter!!!'),
        );
      case Status.INITIAL:
      default:
        return const Center(child: CircularProgressIndicator());
    }
  }

  @override
  void initState() {
    Provider.of<BreedViewModel>(context, listen: false).fetchMediaData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ApiResponse apiResponse = Provider.of<BreedViewModel>(context).response;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Breed'),
      ),
      body: getWidget(context, apiResponse),
    );
  }
}
