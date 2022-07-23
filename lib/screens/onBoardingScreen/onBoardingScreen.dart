import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meet/cubits/onBoardingCubit/cubit.dart';
import 'package:meet/cubits/onBoardingCubit/states.dart';
import 'package:meet/screens/loginScreen/loginScreen.dart';
import 'package:meet/shared/local/cacheHelper.dart';
import 'package:meet/shared/styles/icon_broken.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget{
  OnBoardingScreen({Key? key}) : super(key: key);
  final onBoardingController=PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: (){
                CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const LoginScreen()), (route) => false);
                });

              },
              child: const Text("SKIP")),
          const SizedBox(width: 15,)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: PageView.builder(
                  controller: onBoardingController,
                  physics: const BouncingScrollPhysics(),

                  onPageChanged: (index){
                    if(index==(OnBoardingCubit.get(context).onBoarding.length-1)){
                      OnBoardingCubit.get(context).changePageLast(index);
                    }

                  },
                  itemBuilder: (context,index)=>buildOnBoardingItem(OnBoardingCubit.get(context).onBoarding[index],context),
                  itemCount:OnBoardingCubit.get(context).onBoarding.length ),
            ),
            const SizedBox(height: 40,),
            Row(
              children: [
                SmoothPageIndicator(
                  controller:onBoardingController ,
                  count: OnBoardingCubit.get(context).onBoarding.length,
                  effect: const ExpandingDotsEffect(
                    dotColor: Colors.blueGrey,
                    activeDotColor: Colors.lightBlue,
                    dotHeight: 10,
                    expansionFactor: 5,
                    dotWidth: 10,
                    spacing: 5,
                  ),
                ),
                const Spacer(),
                BlocConsumer<OnBoardingCubit,OnBoardingStates>(
                  listener: (context,state){},
                  builder: (context,state){
                    return FloatingActionButton(
                      onPressed: (){
                        if(state is OnBoardingLastPageState){
                          CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const LoginScreen()), (route) => false);
                          });
                          //  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginScreen()), (route) => false);
                        }
                        else{
                          onBoardingController.nextPage(duration: const Duration(milliseconds: 1000),
                              curve:Curves.easeInToLinear );
                        }
                      },
                      child: const Icon(IconBroken.Arrow___Right),

                    );
                  },

                ),
              ],
            ),

          ],
        ),
      ),

    );


  }
  Widget buildOnBoardingItem (model,context)=>Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Image(
          image: AssetImage('${model.image}'),
          // fit: BoxFit.cover,

        ),
      ),
      Text("${model.title}",
          style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 24,fontWeight: FontWeight.bold,)),
      const SizedBox(
        height: 15,),
      Text("${model.body}",
          style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 20,fontWeight: FontWeight.bold,)
      ),
      const SizedBox(
        height: 5,),
    ],
  );
}