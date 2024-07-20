import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:product_api/recipes_api_using_getx/controlller/rescipi_getx.dart';

import '../detail/detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RecipesController recipesController = Get.put(RecipesController());
    return Scaffold(
      body: Obx(() {
        if (recipesController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (recipesController.recipesModal == null) {
            return const Center(
              child: Text('No Data'),
            );
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 980,
                  width: 980,
                  decoration: const BoxDecoration(color: Colors.black),
                  child: Column(
                    children: [
                       Stack(
                        children: [
                          const Image(
                            image: AssetImage('assets/image/bg.png'),
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 150,left: 110),
                            child: Text('Discover',style: GoogleFonts.cabin(textStyle: const TextStyle(color: Colors.black,fontSize: 45,fontWeight: FontWeight.bold,)),),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 210,left: 125),
                            child: Text('Lets find a recipe',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Container(
                          height: double.infinity,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            // borderRadius: BorderRadius.circular(15)
                          ),
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                            itemCount:
                                recipesController.recipesModal!.recipes.length,
                            itemBuilder: (context, index) {
                              var recipes = recipesController
                                  .recipesModal!.recipes[index];
                              return InkWell(
                                onTap: () {
                                  Get.to(DetailScreen(recipes: recipes,));
                                },
                                child: Column(
                                  children: [
                                    Container(
                                        height: 180,
                                        width: 180,
                                        child: Image.network(
                                          recipes.image,
                                          fit: BoxFit.cover,
                                        )),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(recipes.name,style: const TextStyle(fontWeight: FontWeight.bold),),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
