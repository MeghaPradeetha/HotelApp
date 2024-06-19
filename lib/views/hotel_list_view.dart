import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/hotel_list_viewmodel.dart';
import '../widgets/hotel_card.dart';

class HotelListView extends StatefulWidget {
  const HotelListView({super.key});

  @override
  State<HotelListView> createState() => _HotelListViewState();
}

class _HotelListViewState extends State<HotelListView> {
  final HotelListViewModel model = HotelListViewModel();

  SizedBox sizeBox(double size) => SizedBox(height: size);

  @override
  void initState() {
    super.initState();
    model.fetchHotels();
  }

  Widget hotelsList() => Container(
      height: MediaQuery.of(context).size.height / 1.1,
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 120.0),
      child: model.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : model.filteredHotels.isNotEmpty
              ? Scrollbar(
                  thickness: 9,
                  interactive: true,
                  thumbVisibility: true,
                  radius: const Radius.circular(4),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: model.filteredHotels.length,
                      itemBuilder: (context, index) {
                        return HotelCard(hotel: model.filteredHotels[index]);
                      },
                      separatorBuilder: (context, index) {
                        return const Divider(
                          indent: 5,
                          endIndent: 5,
                          color: Colors.grey,
                        );
                      },
                    ),
                  ),
                )
              : const Center(
                  child: Text(
                    'No hotels available.',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ));

  Widget mainBody(BuildContext context) => Stack(
        children: [
          hotelsList(),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Hotels List',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await model.signOut(context);
                      },
                      child: const Text("Logout"),
                    ),
                  ],
                ),
                sizeBox(10.0),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search hotels...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    prefixIcon: const Icon(Icons.search),
                  ),
                  onChanged: (query) {
                    model.searchHotels(query);
                  },
                ),
              ],
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: model,
      child: Consumer<HotelListViewModel>(
        builder: (context, model, _) => Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: mainBody(context),
          ),
        ),
      ),
    );
  }
}
