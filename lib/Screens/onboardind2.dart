import 'package:flutter/material.dart';
import 'package:genie_money/Screens/onboarding3.dart';
import 'package:genie_money/Screens/signin_screen.dart';
import 'package:genie_money/Utils/utils.dart';

class Onboarding2 extends StatefulWidget {
  const Onboarding2({Key? key}) : super(key: key);

  @override
  State<Onboarding2> createState() => _Onboarding2State();
}

class _Onboarding2State extends State<Onboarding2> {
  String which_page='';

  // @override
  // final PageController _pageController = PageController();
  // int _currentPageIndex = 0;
  
//bool _isButtonDisabled = false;

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
  //     _pageController.nextPage(duration: Duration(milliseconds: 5), curve: Curves.ease);
  //   } else {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => Onboarding3()),
  //     );
  //   }
  // }
// void _nextPage() async {
//   if (!_isButtonDisabled && _currentPageIndex < 2) {
//     setState(() {
//       _isButtonDisabled = true;
//     });

//     await _pageController.nextPage(
//       duration: const Duration(milliseconds: 300),
//       curve: Curves.ease,
//     );

//     setState(() {
//       _isButtonDisabled = false;
//     });
//   } else {
//     // Navigate to the next screen
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => const Onboarding3()),
//     );
//   }
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
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
              image: AssetImage("images/WhatsApp Image 2023-07-17 at 6.12.11 PM (1).jpeg"),
              width: 600,
            ),
          ),
          const SizedBox(
            height: 110,
          ),
      const Center(
        


    child: Text(
      "One Stop Solution for all\n basic banking and financial needs",
      style: TextStyle(
        color: navyBlueColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
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
                child:  const Text(
                  "Skip",
                  style: TextStyle(
                    color: navyBlueColor,
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
                //  onPressed: _nextPage,
                     onPressed: () {
                       Navigator.push(
                            context,
                     MaterialPageRoute(builder: (context) => const Onboarding3()),
                       );
                  

                    
                },
                  icon: const Icon(
                    Icons.arrow_forward,
                    size: 24,
                    color: kWhite,
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
          //        Container(
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
