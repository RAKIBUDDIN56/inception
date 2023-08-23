import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inception/archiveExams/screens/archive_exams_screen.dart';
import 'package:inception/home/bloc/home_bloc.dart';
import 'package:inception/home/repository/home_repository.dart';
import 'package:intl/intl.dart';
import 'package:inception/routes/app_routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: scaffoldKey,
      drawer: const DrawerWidget(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appBar(scaffoldKey: scaffoldKey),
            liveExamsCategoryWidget(),
            BlocProvider(
              create: (context) =>
                  HomeBloc(HomeRepository())..add(LiveExamsEvent()),
              child: liveExamsWidget(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'আর্কাইভ এক্সাম',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    'আর্কাইভ এক্সাম সবগুলো',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 14,
                        decoration: TextDecoration.underline),
                  ),
                ],
              ),
            ),
            BlocProvider(
              create: (context) =>
                  HomeBloc(HomeRepository())..add(ArchiveCategoryEvent()),
              child: archiveCategoryWidget(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'আপনার প্যাকেজ ',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    'সকল প্যাকেজ ',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 14,
                        decoration: TextDecoration.underline),
                  ),
                ],
              ),
            ),
            BlocProvider(
              create: (context) =>
                  HomeBloc(HomeRepository())..add(PackagesEvent()),
              child: packagesWidget(),
            ),
          ],
        ),
      ),
    );
  }

  Padding liveExamsCategoryWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            'লাইভ এক্সাম',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            'লাইভ এক্সাম সবগুলো',
            style: TextStyle(
                color: Colors.blue,
                fontSize: 14,
                decoration: TextDecoration.underline),
          ),
        ],
      ),
    );
  }

  Container packagesWidget() {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 260,
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is PackagesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is PackagesLoaded) {
            return ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: state.packageList.length,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.only(right: 8),
                width: 280,
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    border: Border.all(color: Colors.grey),
                    borderRadius: const BorderRadius.all(Radius.circular(15))),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.white),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0, top: 8),
                              child: Text(
                                "প্যাকেজের নাম: ${state.packageList[index].name}",
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                "প্যাকেজের মেয়াদ: ${state.packageList[index].period} দিন",
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                "প্যাকেজের মূল্য: ${state.packageList[index].price} টাকা",
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                state.packageList[index].description,
                                maxLines: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 50,
                        padding: const EdgeInsets.only(top: 20),
                        decoration: const BoxDecoration(color: Colors.blueGrey),
                        child: Center(
                          child: OutlinedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 59, 164, 164)),
                            onPressed: () {},
                            child: const Text(
                              "প্যাকেজ কিনতে ক্লিক করেন",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ]),
              ),
            );
          }
          if (state is ArchiveExamsLoadingError) {
            return Center(
              child: Text(state.error),
            );
          }

          return Container();
        },
      ),
    );
  }

  Container archiveCategoryWidget() {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 140,
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is ArchiveCategoryLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ArchiveCategoryLoaded) {
            return ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: state.archiveCategoryList.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  print(state.archiveCategoryList[index].id);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ArchiveExamsCategoryScreen(
                          id: state.archiveCategoryList[index].id),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 8),
                  width: 220,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15))),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 220,
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(15),
                                  topLeft: Radius.circular(15))),
                          height: 60,
                          child: Text(
                            state.archiveCategoryList[index].name,
                            style: const TextStyle(color: Colors.white),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              state.archiveCategoryList[index].description ??
                                  ""),
                        ),
                      ]),
                ),
              ),
            );
          }
          if (state is ArchiveExamsLoadingError) {
            return Center(
              child: Text(state.error),
            );
          }

          return Container();
        },
      ),
    );
  }

  Container liveExamsWidget() {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 140,
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is LiveExamsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is LiveExamsLoaded) {
            return ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: state.allLiveExmas.length,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.only(right: 8),
                width: 220,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: const BorderRadius.all(Radius.circular(15))),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // state.allLiveExmas[index].onLive != 0
                      //     ? Row(
                      //         mainAxisAlignment: MainAxisAlignment.end,
                      //         children: [
                      //           Lottie.asset('assets/lottie/red_dot.json',
                      //               height: 60, width: 60),
                      //         ],
                      //       )
                      //     : Container(),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15),
                                topLeft: Radius.circular(15))),
                        height: 60,
                        child: Text(
                          state.allLiveExmas[index].title,
                          style: const TextStyle(color: Colors.white),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            'প্রশ্ন: ${state.allLiveExmas[index].totalQuestion} টি - ${state.allLiveExmas[index].duration} মিনিট'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                            "সময়: ${DateFormat('hh:mm:ss dd-MM-yyyy').format(state.allLiveExmas[index].startingTime)}"),
                      ),
                    ]),
              ),
            );
          }
          if (state is LiveExamsLoadingError) {
            return Center(
              child: Text(state.error),
            );
          }

          return Container();
        },
      ),
    );
  }
}

class appBar extends StatelessWidget {
  const appBar({
    super.key,
    required this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          icon: const Icon(
            Icons.sort_sharp,
            color: Colors.blue,
          ),
          onPressed: () {
            if (scaffoldKey.currentState!.isDrawerOpen) {
              scaffoldKey.currentState!.closeDrawer();
            } else {
              scaffoldKey.currentState!.openDrawer();
            }
          },
        ),
        const SizedBox(
          width: 20,
        ),
        const Text(
          'Inception Online Exam',
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(
          width: 60,
        ),
        Stack(
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_outlined,
                  color: Colors.black,
                )),
            Positioned(
              top: 16,
              left: 25,
              child: Container(
                height: 8,
                width: 8,
                decoration: const BoxDecoration(
                    color: Colors.red, shape: BoxShape.circle),
              ),
            )
          ],
        )
      ],
    );
  }
}

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text("Rakib Uddin"),
            accountEmail: Text("rsrakib404@gmail.com"),
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage('assets/images/drawer_img.jpg'),
                  fit: BoxFit.cover,
                ),
                color: Colors.blueGrey),
            currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://randomuser.me/api/portraits/men/46.jpg")),
          ),
          ListTile(
              leading: const Icon(Icons.event_note_outlined),
              title: const Text("Routines"),
              onTap: () {
                Navigator.pushNamed(context, Routes.ROUTINES);
              }),
          ListTile(
              leading: const Icon(Icons.note_alt_outlined),
              title: const Text("Notes"),
              onTap: () {
                Navigator.pushNamed(context, Routes.NOTES);
              }),
          ListTile(
              leading: const Icon(Icons.article_outlined),
              title: const Text("Results"),
              onTap: () {
                Navigator.pop(context);
              }),
          ListTile(
              leading: const Icon(Icons.format_list_bulleted_outlined),
              title: const Text("Meit Lists"),
              onTap: () {
                Navigator.pop(context);
              }),
          ListTile(
              leading: const Icon(Icons.note_outlined),
              title: const Text("Notes"),
              onTap: () {
                Navigator.pop(context);
              }),
          ListTile(
              leading: const Icon(Icons.bookmarks_outlined),
              title: const Text("Bookmarks"),
              onTap: () {
                Navigator.pop(context);
              }),
          const Divider(),
          ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text("About"),
              onTap: () {
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}
