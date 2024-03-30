import 'package:flutter/material.dart';
import 'package:news_app/core/config/constants.dart';
import 'package:news_app/core/widgets/custom_background_widget.dart';
import 'package:news_app/main.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/pages/home/pages/category_view.dart';
import 'package:news_app/pages/home/widgets/category_item_widget.dart';
import 'package:news_app/pages/home/widgets/custom_drawer.dart';


class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<CategoryModel> categoriesList = [
    CategoryModel(
      id: "sports",
      title: "Sports",
      image: "assets/images/sports_icon.png",
      backgroundColor: const Color(0xFFC91C22),
    ),
    CategoryModel(
      id: "general",
      title: "Politics",
      image: "assets/images/Politics_icon.png",
      backgroundColor: const Color(0xFF003E90),
    ),
    CategoryModel(
      id: "health",
      title: "Health",
      image: "assets/images/health_icon.png",
      backgroundColor: const Color(0xFFED1E79),
    ),
    CategoryModel(
      id: "business",
      title: "Business",
      image: "assets/images/bussines_icon.png",
      backgroundColor: const Color(0xFFCF7E48),
    ),
    CategoryModel(
      id: "environment",
      title: "Environment",
      image: "assets/images/environment_icon.png",
      backgroundColor: const Color(0xFF4882CF),
    ),
    CategoryModel(
      id: "science",
      title: "Science",
      image: "assets/images/science_icon.png",
      backgroundColor: const Color(0xFFF2D352),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundWidget(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            selectedCategory == null ? "News App" : selectedCategory!.title,
            style: Constants.theme.textTheme.titleLarge,
          ),
          actions: [
            if (selectedCategory != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search_rounded,
                    size: 45,
                    color: Colors.white,
                  ),
                ),
              )
          ],
          leadingWidth: 80,
        ),
        drawer: CustomDrawer(
          onDrawerClicked: onDrawerClick,
        ),
        body: selectedCategory == null
            ? Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Pick your category\nof interest",
                      textAlign: TextAlign.start,
                      style: Constants.theme.textTheme.bodyLarge?.copyWith(
                          color: const Color(0xFF4F5A69), height: 1.15),
                    ),
                    Expanded(
                      child: GridView.builder(
                        padding: const EdgeInsets.symmetric(
                          vertical: 25,
                          horizontal: 20,
                        ),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 20,
                                crossAxisSpacing: 20,
                                childAspectRatio: 4 / 5),
                        itemBuilder: (context, index) {
                          return CategoryItemWidget(
                            categoryModel: categoriesList[index],
                            index: index,
                            onCategoryClick: onCategoryClick,
                          );
                        },
                        itemCount: 6,
                      ),
                    ),
                  ],
                ),
              )
            : CategoryView(categoryModel: selectedCategory!),
      ),
    );
  }

  CategoryModel? selectedCategory;

  void onCategoryClick(CategoryModel categoryModel) {
    setState(() {
      selectedCategory = categoryModel;
    });
  }

  void onDrawerClick() {
    setState(() {
      selectedCategory = null;
    });
    navigatorKey.currentState!.pop();
  }


}
