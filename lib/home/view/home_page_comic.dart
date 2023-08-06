import 'package:comic_book/home/bloc/home_bloc.dart';
import 'package:comic_book/home/view/NavigationDrawBarHome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  final HomeBloc homeBloc = HomeBloc();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    homeBloc.add(HomeInitialEvents());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
        drawer: const NavigationDrawerHome(),
        appBar: AppBar(
          leading: IconButton(
            icon: Image.asset("images/logo.png"),
            onPressed: () { _scaffoldKey.currentState!.openDrawer(); },
          ),
        centerTitle: true,
        title: const Text(
            "Comic Book"
        ),
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        bloc: homeBloc,
        listenWhen: (previous, current) => current is HomeActionState,
        buildWhen: (previous, current) => current is! HomeActionState,
        listener: (context, state) {

        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case HomeLoadedSuccessState:
              final successState = state as HomeLoadedSuccessState;

              return GridView.builder(
                itemCount: successState.comicDataModule.results?.length,
                itemBuilder: (context, index) {
                  var comic = successState.comicDataModule.results;

                  return Column(
                    children: [
                      Container(
                        height: 100,
                        width: double.maxFinite,
                        child: Image(
                          image: NetworkImage(comic![index].image!.superUrl!),
                        ),
                      ),
                      Text(comic![index].volume!.name!),
                    ],
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1
                ),
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}

