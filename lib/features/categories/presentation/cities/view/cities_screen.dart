import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickytour/features/categories/presentation/cities/view/manager/cities_list_cubit.dart';
import 'package:pickytour/features/categories/presentation/cities/view/wiggets/cities_screen_body.dart';


class CitiesScreen extends StatefulWidget {
  const CitiesScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return BookDetailsViewState();
  }
}

class BookDetailsViewState extends State {

  @override
  void initState() {
     BlocProvider.of<CitiesListCubit>(context).fetchCities();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CitiesScreenBody(),
    );
  }
}
