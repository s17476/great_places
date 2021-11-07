import 'package:flutter/material.dart';
import 'package:great_places/providers/places_provider.dart';
import 'package:great_places/screens/add_place_screen.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your places'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: FutureBuilder(
        future:
            Provider.of<PlacesProvider>(context, listen: false).fetchAndSet(),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<PlacesProvider>(
                child: const Center(
                  child: Text('Got no places yet'),
                ),
                builder: (ctx, placesProvider, ch) => placesProvider
                        .items.isEmpty
                    ? ch!
                    : ListView.builder(
                        itemCount: placesProvider.items.length,
                        itemBuilder: (ctx, index) => ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                FileImage(placesProvider.items[index].image),
                          ),
                          title: Text(placesProvider.items[index].title),
                          onTap: () {},
                          // go to details page
                        ),
                      ),
              ),
      ),
    );
  }
}
