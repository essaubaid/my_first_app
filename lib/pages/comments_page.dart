import 'package:flutter/material.dart';
import 'package:my_first_app/API/apiService.dart';

class CommentPage extends StatefulWidget {
  CommentPage({super.key});

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  late Future<List<ApiClass>> futureAPI;

  @override
  void initState() {
    super.initState();
    futureAPI = ApiService().getAPI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Comments List"),
          centerTitle: true,
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            List<ApiClass> data = await ApiService().getAPI();
            data.shuffle();

            setState(() {
              futureAPI = Future.value(data);
            });
          },
          child: listData(),
        ));
  }

  Center listData() {
    return Center(
      child: FutureBuilder<List<ApiClass>>(
        future: futureAPI,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              itemBuilder: (context, index) {
                ApiClass api = snapshot.data![index];

                return ListTile(
                  title: Text(api.name),
                  onTap: () => showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    context: context,
                    builder: (BuildContext context) {
                      return SizedBox(
                        height: 200,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Name: ${api.name}"),
                              Text("Email: ${api.email}"),
                              Text("Body: ${api.body}"),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  leading: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).primaryColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '$index',
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: snapshot.data!.length,
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}


// ListView.builder(
//         itemCount: items.length,
//         itemBuilder: (context, index) {
//           final item = items[index];
//           return ListTile(
//             title: Text('Item $item'),
//             subtitle: const Text('my subtitle'),
//             trailing: const Icon(Icons.chevron_right_outlined),
//           );
//         },
//       ),