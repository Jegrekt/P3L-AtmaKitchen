import 'package:atma_kitchen_app/core/constants/variables.dart';
import 'package:atma_kitchen_app/data/models/response/all_product_customer_response_model.dart';
import 'package:atma_kitchen_app/presentation/ui/extensions/int_ext.dart';
import 'package:atma_kitchen_app/presentation/ui/styles/atma_colors.dart';
import 'package:atma_kitchen_app/presentation/ui/styles/typography.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  final Datum product;
  const ProductDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              product.produk!.foto != null
                  ? Image.network(
                      width: double.infinity,
                      '${Variables.baseImageUrl}/${product.produk!.foto}',
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      width: double.infinity,
                      "images/placeholder.png",
                      fit: BoxFit.cover,
                    ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.black12.withOpacity(0.3),
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text(
                    product.produk!.nama!,
                    style: subTtitle,
                  ),
                  trailing: Chip(
                    backgroundColor: AtmaColors.primary,
                    label: Text(
                      product.produk!.kategoriProduk!.nama!,
                      style: mediumBold.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                product.produk!.deskripsi != null
                    ? Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 4),
                        child: Text(
                          product.produk!.deskripsi!,
                          style: grayReqular,
                        ),
                      )
                    : const SizedBox(),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Divider(
                    thickness: 0.8,
                  ),
                ),
                product.stok != null
                    ? ListTile(
                        title: const Text(
                          "Stok Ready",
                          style: grayReqular,
                        ),
                        trailing:
                            Text(product.stok!.toString(), style: regularBold),
                      )
                    : const SizedBox(),
                product.kuota != null
                    ? ListTile(
                        title: const Text(
                          "Kuota",
                          style: grayReqular,
                        ),
                        trailing:
                            Text(product.kuota!.toString(), style: regularBold),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    "Harga",
                    style: mediumBold,
                  ),
                ),
                product.produk!.hargaSetengahLoyang != null
                    ? ListTile(
                        title: const Text(
                          "Harga Setengah Loyang",
                          style: grayReqular,
                        ),
                        trailing: Text(
                          product.produk!.hargaSetengahLoyang!.currencyFormatRp,
                          style: regularBold.copyWith(
                            color: AtmaColors.primary,
                          ),
                        ),
                      )
                    : const SizedBox(),
                product.produk!.harga != null
                    ? ListTile(
                        title: Text(
                          "Harga per ${product.produk!.kategoriProduk!.satuan!}",
                          style: grayReqular,
                        ),
                        trailing: Text(
                          product.produk!.harga!.currencyFormatRp,
                          style: mediumBold.copyWith(
                            color: AtmaColors.primary,
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
