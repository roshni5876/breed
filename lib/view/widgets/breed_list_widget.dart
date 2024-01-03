import 'package:flutter/material.dart';
import 'package:the_dogapi/model/models/breed.dart';

class BreedListWidget extends StatefulWidget {
  final List<Breed> mediaList;
  final Function function;

  const BreedListWidget(
      {required this.mediaList, required this.function, super.key});

  @override
  BreedListWidgetState createState() => BreedListWidgetState();
}

class BreedListWidgetState extends State<BreedListWidget> {
  Widget _buildItem(Breed breed) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Row(
        children: <Widget>[
          const SizedBox(
            width: 5.0,
          ),
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    breed.name ?? '',
                    style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    breed.bredFor ?? '',
                    style: const TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    breed.breedGroup ?? '',
                    style: const TextStyle(
                      fontSize: 10.0,
                      color: Colors.grey,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: const SizedBox(
                          width: 50,
                          height: 50,
                          child: Icon(Icons.height_sharp),
                        ),
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        "${breed.height!.imperial}-${breed.height!.metric}",
                        style: const TextStyle(
                          fontSize: 10.0,
                          color: Colors.grey,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: const SizedBox(
                          width: 50,
                          height: 50,
                          child: Icon(Icons.height_sharp),
                        ),
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        "${breed.weight!.imperial}-${breed.weight!.metric}",
                        style: const TextStyle(
                          fontSize: 10.0,
                          color: Colors.grey,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ]),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: widget.mediaList.length,
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemBuilder: (BuildContext context, int index) {
            Breed data = widget.mediaList[index];
            return InkWell(
              onTap: () {
                widget.function(data);
              },
              child: _buildItem(data),
            );
          },
        ),
      ]),
    );
  }
}
