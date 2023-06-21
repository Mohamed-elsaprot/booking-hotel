import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pickytour/core/widgets/custom_error_widget.dart';
import 'package:pickytour/core/widgets/loading_indecator.dart';
import 'package:pickytour/features/categories/presentation/cities/view/manager/cities_list_cubit.dart';
import 'package:pickytour/features/categories/presentation/cities/view/manager/cities_list_state.dart';
import '../../../../../../../core/utils/routers.dart';
import '../../../doublicated_widgets/cover_item.dart';
import '../../../doublicated_widgets/title_widget.dart';

class CitiesList extends StatelessWidget {
  const CitiesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CitiesListCubit,CitiesListState>(
        builder: (context,state){
          if(state is CitiesListISuccess){
            return ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                itemCount: state.citiesList.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 10),
                    child: Stack(
                      children: [
                        CoverItem(
                          url: state.citiesList[index].cityPic!,
                          function: (){
                            GoRouter.of(context).push(AppRouter.hotelsScreen,extra: state.citiesList[index]);
                          },
                        ),
                        TitleWidget(title: state.citiesList[index].cityName!,)
                      ],
                    ),
                  );
                });
          }else if(state is CitiesListFailure){
            return CustomErrorWidget(errorMessage: state.errorMessage);
          }else {
            return const LoadingIndicator();
          }
        },
    );

  }
}
