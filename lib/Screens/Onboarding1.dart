import 'package:flutter/material.dart';
import 'package:genie_money/Screens/onboardind2.dart';
import 'package:genie_money/Screens/signin_screen.dart';
import 'package:genie_money/Utils/utils.dart';

class Onboarding1 extends StatefulWidget {
    
  const Onboarding1({Key? key}) : super(key: key);

  @override
  State<Onboarding1> createState() => _Onboarding1State();

}

class _Onboarding1State extends State<Onboarding1> {
   String which_page=''; 
  //final PageController _pageController = PageController();
 // int _currentPageIndex = 0;

  // @override
  // void dispose() {
  //   _pageController.dispose();
  //   super.dispose();
  // }

  // void _onPageChanged(int index) {
  //   setState(() {
  //     _currentPageIndex = index;
  //   });
  // }

  // void _nextPage() {
  //   if (_currentPageIndex < 1) {
  //     _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
  //   } else {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => const Onboarding2()),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:kWhite,
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          const Center(
            child: Image(
              image: AssetImage("images/Logo.png"),
              width: 250,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Center(
            child: Image(
              image: AssetImage("images/WhatsApp Image 2023-07-17 at 6.12.11 PM.jpeg"),
              width: 600,
            ),
          ),
          const SizedBox(
            height: 110,
          ),
          const Center(
            child: Text(
              "Asia's first hybrid Neo Bank",
              style: TextStyle(
                color:navyBlueColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 70),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: () {
            Navigator.push(
                             context,
                   MaterialPageRoute(builder: (context) => SignInScreen(which_page)),
                          );
                  

                    
                },
                child: const Text(
                  "Skip",
                  style: TextStyle(
                       color:navyBlueColor,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(width: 180),
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                    color:navyBlueColor,
                ),
                child: IconButton(
                 // onPressed: _nextPage,
                   onPressed: () {
                     Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Onboarding2()),
      );

                    
                },
                  icon: const Icon(
                    Icons.arrow_forward,
                    size: 24,
                    color:kWhite
                  ),
                ),
              ),
            ],
          ),
          // const SizedBox(height: 20),
          // Visibility(
          //   visible: _currentPageIndex == 0,
          //   child: Container(
          //     width: 10,
          //     height: 10,
          //     margin: const EdgeInsets.only(bottom: 10),
          //     decoration: const BoxDecoration(
          //       shape: BoxShape.circle,
          //       color:greyColor,
          //     ),
          //   ),
          // ),
          // Visibility(
          //   visible: _currentPageIndex == 1,
          //   child: Container(
          //     width: 20,
          //     height: 10,
          //     margin: const EdgeInsets.only(bottom: 10),
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(5),
          //       color:greyColor,
          //     ),
          //   ),
          // ),
          // const SizedBox(width: 50),
          // Expanded(
          //   child: PageView(
          //     controller: _pageController,
          //     onPageChanged: _onPageChanged,
          //     children: [
          //       // First page content
          //       Container(
          //         // Add your content for the first page here
          //       //  child: Text("First Page"),
          //       ),
          //       // Second page content
          //       Container(
          //         // Add your content for the second page here
          //       //  child: Text("Second Page"),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}

