import 'package:flutter/material.dart';
import 'package:news_app/core/config/constants.dart';
import 'package:news_app/core/widgets/custom_background_widget.dart';
import 'package:news_app/main.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/pages/home/widgets/custom_drawer.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
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