import 'package:atma_kitchen_app/presentation/pages/home/guest/main_page_guest.dart';
import 'package:atma_kitchen_app/presentation/ui/components/button.dart';
import 'package:atma_kitchen_app/presentation/ui/styles/atma_colors.dart';
import 'package:atma_kitchen_app/presentation/ui/styles/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: AtmaColors.lightPink,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      const Text(
                        "Atma Kitchen",
                        style: subTtitle,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Atma Kitchen: Memasak dengan Cinta. Menyajikan dengan Hati. Menciptakan Kenangan di Setiap Hidangan. Setiap Rasa Adalah Cerita. Kami Hadir untuk Anda. Nikmati Momen Berharga Bersama Kami. Atma Kitchen, Kebahagiaan dalam Setiap Suapan",
                        style: grayReqular,
                      ),
                      const SizedBox(height: 10),
                      Image.asset(
                        'images/landing_page/landing_page.png',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      Text(
                        "Tentang Kami",
                        style: subTtitle.copyWith(
                          color: AtmaColors.primary,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Atma Kitchen adalah tempat di mana setiap hidangan dipersiapkan dengan cinta dan disajikan dengan hati. Kami percaya bahwa setiap rasa adalah cerita, dan kami hadir untuk Anda. Nikmati momen berharga bersama kami. Atma Kitchen, kebahagiaan dalam setiap suapan.",
                        style: grayReqular,
                      ),
                      const SizedBox(height: 10),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'images/close_up.png',
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MainPageGuest()),
                  );
                },
                style: buttonPrimary,
                child: const Text('Mulai Belanja'),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
