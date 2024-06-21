import 'package:atma_kitchen_app/core/constants/variables.dart';
import 'package:atma_kitchen_app/data/models/response/all_product_customer_response_model.dart';
import 'package:atma_kitchen_app/presentation/ui/extensions/int_ext.dart';
import 'package:atma_kitchen_app/presentation/ui/styles/atma_colors.dart';
import 'package:atma_kitchen_app/presentation/ui/styles/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../product_detail.dart';

class ProductCard extends StatelessWidget {
  final Datum product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final nama = product.produk!.nama!;
    final kategori = product.produk!.kategoriProduk!.nama!;
    final harga = product.produk!.harga!.currencyFormatRp;
    return Container(
      clipBehavior: Clip.hardEdge,
      height: 120,
      margin: const EdgeInsets.only(left: 20, right: 20, top: 24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductDetail(product: product)));
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            product.produk!.foto != null
                ? Image.network(
                    '${Variables.baseImageUrl}/${product.produk!.foto}',
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    "images/placeholder.png",
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 10,
                  bottom: 10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          nama,
                          style: mediumBold,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          kategori,
                          style: grayReqular,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          "Mulai dari",
                          textAlign: TextAlign.end,
                          style: smallGrayReqular,
                        ),
                        Text(
                          harga,
                          textAlign: TextAlign.end,
                          style: mediumBold.copyWith(
                            color: AtmaColors.primary,
                          ),
                        ),
                      ],
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
}
