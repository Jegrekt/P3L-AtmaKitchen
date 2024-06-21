import 'package:atma_kitchen_app/presentation/pages/home/customer/home/widgets/product_card.dart';
import 'package:atma_kitchen_app/presentation/ui/components/snackbar_maker.dart';
import 'package:atma_kitchen_app/presentation/ui/components/spinner_loading.dart';
import 'package:atma_kitchen_app/presentation/ui/styles/atma_colors.dart';
import 'package:atma_kitchen_app/presentation/ui/styles/typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/produk/produk_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Category> categories = [
    Category("All", Icons.dinner_dining),
    Category("Kue", Icons.cake),
    Category("Roti", Icons.breakfast_dining),
    Category("Titipan", Icons.people),
    Category("Hampers", Icons.food_bank),
  ];

  @override
  void initState() {
    super.initState();
    context.read<ProdukBloc>().add(const ProdukEvent.getProduk());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text("Hai, Customer!"),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                fit: StackFit.loose,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: AtmaColors.primary,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        )),
                    height: 114,
                    width: double.infinity,
                  ),
                  Container(
                      height: 152,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          )),
                      margin:
                          const EdgeInsets.only(left: 20, right: 20, top: 24),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "images/home_page.png",
                            height: 100,
                            width: 100,
                          ),
                          const Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Selamat Datang di Atma Kitchen",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "Kami menyediakan berbagai macam makanan dan minuman",
                                  style: smallGrayReqular,
                                )
                              ],
                            ),
                          )
                        ],
                      ))
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Kategori",
                  style: mediumBold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 100,
                child: ListView.builder(
                    itemCount: categories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(
                          left: 20,
                          right: (index == categories.length - 1) ? 20 : 0,
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: const BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: Icon(
                                categories[index].icon,
                                color: AtmaColors.primary,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              categories[index].name,
                              style: smallGrayReqular,
                            )
                          ],
                        ),
                      );
                    }),
              ),
              BlocConsumer<ProdukBloc, ProdukState>(
                listener: (context, state) {
                  state.maybeWhen(
                      orElse: () {},
                      error: (e) {
                        SnackbarMaker.showSnackbar(context, e, Colors.red);
                      });
                },
                builder: (context, state) {
                  return state.maybeWhen(orElse: () {
                    return const SizedBox();
                  }, loading: () {
                    return const Center(child: SpinnerLoading());
                  }, success: (list) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...list.map((e) => ProductCard(
                              product: e,
                            )),
                        const SizedBox(height: 16)
                      ],
                    );
                  });
                },
              )
            ],
          ),
        ));
  }
}

class Category {
  final String name;
  final IconData icon;

  Category(this.name, this.icon);
}
