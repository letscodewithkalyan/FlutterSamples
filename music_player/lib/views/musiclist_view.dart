import 'package:flutter/material.dart';
import 'package:music_player/viewmodels/musiclist_viewmodel.dart';
import 'package:provider/provider.dart';

class MusicListView extends StatefulWidget {
  const MusicListView({super.key});

  @override
  State<MusicListView> createState() => _MusicListViewState();
}

class _MusicListViewState extends State<MusicListView> {
  MusicListViewModel viewModel = MusicListViewModel();
  String keyword = '';
  void onQueryChanged(String newText) {
    keyword = newText;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Music List")),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SearchBar(
            onChanged: onQueryChanged,
            trailing: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Icon(Icons.search),
              )
            ],
            elevation: MaterialStateProperty.all(1),
          ),
        ),
        Expanded(
          child: ChangeNotifierProvider<MusicListViewModel>(
            create: (context) => viewModel,
            child:
                Consumer<MusicListViewModel>(builder: (context, value, child) {
              return ListView.builder(
                  itemCount: value.musicList.length,
                  itemBuilder: (context, index) {
                    return Card(
                        child: ListTile(
                      title: Text(value.musicList[index].wrapperType),
                      subtitle: Text(value.musicList[index].artistName),
                      leading: Image.network(
                        value.musicList[index].artworkUrl100,
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ));
                  });
            }),
          ),
        ),
        ElevatedButton(
            onPressed: () {
              viewModel.loadMusicList(keyword, context);
            },
            child: Text("Search"))
      ]),
    );
  }
}
