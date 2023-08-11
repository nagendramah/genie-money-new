import 'package:flutter/material.dart';
import 'package:genie_money/Screens/onboarding4.dart';
import 'package:genie_money/Screens/signin_screen.dart';
import 'package:genie_money/Utils/utils.dart';

class Onboarding3 extends StatefulWidget {
  const Onboarding3({Key? key}) : super(key: key);

  @override
  State<Onboarding3> createState() => _Onboarding3State();
}

class _Onboarding3State extends State<Onboarding3> {
  String which_page='';

  // final PageController _pageController = PageController();
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
  //   if (_currentPageIndex < 3) {
  //     _pageController.nextPage(
  //       duration: const Duration(milliseconds: 300),
  //       curve: Curves.ease,
  //     );
  //   } else {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => const Onboarding4()),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:kWhite,
      body: Column(
        children: [
          const SizedBox(height: 100),
          const Center(
            child: Image(
              image: AssetImage("images/Logo.png"),
              width: 250,
            ),
          ),
          const SizedBox(height: 10),
          const Center(
            child: Image(
              image: AssetImage("images/WhatsApp Image 2023-07-17 at 6.12.10 PM.jpeg"),
              width: 600,
              //height: 200, // Provide a fixed height or adjust as needed
              fit: BoxFit.cover, // Adjust the image fitting behavior
            ),
          ),
          const SizedBox(height: 70),
           const SizedBox(
              height: 140,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Flexible(
                  child: Text(
                    "Accounts",
                    style: TextStyle(
                      color:navyBlueColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
               SizedBox(height: 4),
                Text(
                  "Open digital accounts sitting right at\n your home or office.",
                  style: TextStyle(
                    color:greyColor,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
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
                  color: navyBlueColor,
                ),
                child: IconButton(
                 // onPressed: _nextPage,
                   onPressed: () {
                     Navigator.push(
                              context,
                            MaterialPageRoute(builder: (context) => const Onboarding4()),
                         );
                  
                },
                  icon: const Icon(
                    Icons.arrow_forward,
                    size: 24,
                    color:kWhite ,
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
          //       color: Colors.grey,
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
          // SizedBox(width: 1),
          // SizedBox(
          //   height: 15, // Provide a fixed height or adjust as needed
          //   child: PageView(
          //     controller: _pageController,
          //     onPageChanged: _onPageChanged,
          //     children: [
          //       Container(
          //         // Add your content for the first page here
          //       ),
          //       Container(
          //         // Add your content for the second page here
          //       ),
          //       Container(
          //         // Add your content for the third page here
          //       ),
          //       Container(
          //         // Add your content for the fourth page here
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
