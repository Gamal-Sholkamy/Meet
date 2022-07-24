import 'package:flutter/material.dart';

import '../../shared/styles/icon_broken.dart';

class ProfileScreen extends StatelessWidget{
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),

        child: Column(
          children: [
            Container(
              height: 205,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: 180,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/3.jpg",),
                        ),
                          borderRadius:  BorderRadius.only(
                            topRight: Radius.circular(8),
                             topLeft : Radius.circular(8)
                          )  ),
                    ),
                  ),

                  const CircleAvatar(
                    radius: 41,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage("assets/images/6.jpg"),
                    ),
                  ),

                ],
              ),
            ),
            const SizedBox(height: 10,),
            Text("Gamal Sholkamy",
              style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 22,),
            ),
            const SizedBox(height: 10,),
            Text("Flutter Developer....",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 17,color: Colors.grey[600]),
            ),
            const SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text("462",style: Theme.of(context).textTheme.bodyText1?.copyWith(color:Colors.grey[600],fontSize: 18),),
                      Text("Post",style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 18),),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      Text("52",style: Theme.of(context).textTheme.bodyText1?.copyWith(color:Colors.grey[600],fontSize: 18),),
                      Text("Photo",style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 18),),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      Text("869",style: Theme.of(context).textTheme.bodyText1?.copyWith(color:Colors.grey[600],fontSize: 18),),
                      Text("Friend",style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 18),),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      Text("1496",style: Theme.of(context).textTheme.bodyText1?.copyWith(color:Colors.grey[600],fontSize: 18),),
                      Text("Follower",style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 18),),
                    ],
                  ),

                ],
              ),
            ),
            const SizedBox(height: 15,),
            OutlinedButton(onPressed: (){},
                child: Text("Edit Profile",style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 18),)),
            ListView.separated(
                  shrinkWrap: true,

                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    physics:const BouncingScrollPhysics (),
                    itemBuilder: (context,index)=>buildPostItem(context),
                    separatorBuilder:(context,index)=>const SizedBox(
                      height: 4,),
                    itemCount: 25),

          ],
        ),
      ),
    );
  }
  Widget buildPostItem (context)=>Card(

    color: Theme.of(context).appBarTheme.backgroundColor,
    elevation: 0.0,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage("assets/images/4.jpg"),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[

                  Row(
                    children: [

                      Text("Gamal Sholkamy",
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 19,),
                      ),
                      const SizedBox(width: 6,),
                      const Icon(Icons.check_circle,size: 18,color: Colors.blue,),
                    ],
                  ),
                  Text("17 mar",
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize:16 ,color: Colors.grey),)
                ],
              ),
              const Spacer(),
              IconButton(
                  onPressed: (){},
                  icon: const Icon(IconBroken.More_Circle)),

            ],
          ),
          const SizedBox(
            height: 4,),
          SizedBox(
            child:Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey,
            ) ,

          ),
          const SizedBox(
            height: 4,),
          Text("In my career, I have been very privileged to be in a role in which there is always an abundance of complex situations and problems to be solved, but also positive people looking to solve these problems together",
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
              fontSize: 18,
              height: 1.2,

            ),
          ),
          const SizedBox(
            height: 5,),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            spacing: 2,
            runSpacing: 1,clipBehavior: Clip.antiAliasWithSaveLayer,
            direction: Axis.horizontal,
            children: const [
              Text("#Flutter",style: TextStyle(fontSize: 18,color: Colors.blue),),
              Text("#Mobile Developer",style: TextStyle(fontSize: 18,color: Colors.blue),),
              Text("#Software Engineering",style: TextStyle(fontSize: 18,color: Colors.blue),),
            ],
          ),
          const SizedBox(height: 5,),
          Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 0.0,
            child: Container(
              width: double.infinity,
              height: 180,
              decoration:const BoxDecoration(
                image:  DecorationImage(
                  image: AssetImage("assets/images/1.jpg"),
                  fit: BoxFit.cover,

                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:  [
                const Icon(IconBroken.Heart,size: 28,),
                Text("1456",style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 18),),
                const Spacer(),
                const Icon(IconBroken.Swap,size: 28,),
                Text("125",style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 18),),
              ],
            ),
          ),
          const SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: (){},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [
                          const Icon(IconBroken.Heart,size: 28,),
                          Text(
                            "Like",style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 18),),
                        ],
                      ),
                    ),
                  ),

                  Expanded(
                    child: InkWell(
                      onTap: (){},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(IconBroken.Swap,size: 28,),
                          Text(
                            "Comment",style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 18),),
                        ],
                      ),
                    ),
                  ),

                  Expanded(
                    child: InkWell(
                      onTap: (){},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,

                        children: [
                          const Icon(IconBroken.Upload,size: 28,),
                          Text(
                            "Share",style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 18),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    ),

  );
}
