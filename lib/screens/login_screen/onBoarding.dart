import 'package:flutter/material.dart';
import 'package:schoolclient/screens/student_list_screen/student-list.dart';
import 'package:schoolclient/screens/login_screen/login.dart';

class OnBoarding extends StatelessWidget {
  static String routeName='OnBoarding';

  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: OnboardingPagePresenter(pages: [
          OnboardingPageModel(
            title: "École virtuelle de Elite",
            description: "La nouvelle école virtuelle facilite l'éducation et la communication",
            imageUrl: 'https://i.ibb.co/LQPph1T/pngegg-1.png',
            bgColor: Color(0xFFEAC7C7),
          ),
          OnboardingPageModel(
            title: 'Cours ',
            description: "Vérifier les cours depuis le téléphone, n'importe où et n'importe quand",
            imageUrl: 'https://i.ibb.co/fHss4yn/pngegg.png',
            bgColor:  Color(0xffA0C3D2),
          ),
          OnboardingPageModel(
            title: 'Travail à domicile',
            description: "Vérifiez le nouveau travail à domicile de vos enfants d'une simple pression sur votre téléphone",
            imageUrl: 'https://i.ibb.co/YPcBtbN/pngegg-2.png',
            bgColor: Color(0xFFFFD4B2),
          ),
          OnboardingPageModel(
            title: 'Actualités',
            description:
                "Vérifiez chaque jour les nouvelles de l'école Elite",
            imageUrl: 'https://i.ibb.co/DbS1Y3g/toppng-com-download-megaphone-flat-icon-448x448.png',
            bgColor: const Color(0xffCEEDC7),
          ),
          
        ]),
      ),
    );
  }
}

class OnboardingPagePresenter extends StatefulWidget {
  final List<OnboardingPageModel> pages;

 

  const OnboardingPagePresenter(
      {Key? key, required this.pages, })
      : super(key: key);

  @override
  State<OnboardingPagePresenter> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPagePresenter> {
  // Store the currently visible page
  int _currentPage = 0;
  // Define a controller for the pageview
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        color: widget.pages[_currentPage].bgColor,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                // Pageview to render each page
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: widget.pages.length,
                  onPageChanged: (idx) {
                    // Change current page when pageview changes
                    setState(() {
                      _currentPage = idx;
                    });
                  },
                  itemBuilder: (context, idx) {
                    final item = widget.pages[idx];
                    return Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(32.0),
                            child: Image.network(
                              item.imageUrl,
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: Column(children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(item.title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: item.textColor,
                                        )),
                              ),
                              Container(
                                constraints:
                                    const BoxConstraints(maxWidth: 280),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0, vertical: 8.0),
                                child: Text(item.description,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        ?.copyWith(
                                          color: item.textColor,
                                        )),
                              )
                            ]))
                      ],
                    );
                  },
                ),
              ),

              // Current page indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.pages
                    .map((item) => AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          width: _currentPage == widget.pages.indexOf(item)
                              ? 30
                              : 8,
                          height: 8,
                          margin: const EdgeInsets.all(2.0),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 0, 0, 0),
                              borderRadius: BorderRadius.circular(10.0)),
                        ))
                    .toList(),
              ),

              // Bottom buttons
              SizedBox(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        style: TextButton.styleFrom(
                            visualDensity: VisualDensity.comfortable,
                            foregroundColor: Color.fromARGB(255, 0, 0, 0),
                            textStyle: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        onPressed: () {
                          Navigator.pushReplacement(context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()));
                        },
                        child: const Text("S'authentifier")),
                    TextButton(
                      style: TextButton.styleFrom(
                          visualDensity: VisualDensity.comfortable,
                          foregroundColor: Color.fromARGB(255, 0, 0, 0),
                          textStyle: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      onPressed: () {
                        if (_currentPage == widget.pages.length - 1) {
                          Navigator.pushReplacement(context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()));
                        } else {
                          _pageController.animateToPage(_currentPage + 1,
                              curve: Curves.easeInOutCubic,
                              duration: const Duration(milliseconds: 250));
                        }
                      },
                      child: Row(
                        children: [
                          Text(
                            _currentPage == widget.pages.length - 1
                                ? "Terminer et s'authentifier"
                                : "Suivant",
                          ),
                          const SizedBox(width: 8),
                          Icon(_currentPage == widget.pages.length - 1
                              ? Icons.done
                              : Icons.arrow_forward),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OnboardingPageModel {
  final String title;
  final String description;
  final String imageUrl;
  final Color bgColor;
  final Color textColor;

  OnboardingPageModel(
      {required this.title,
      required this.description,
      required this.imageUrl,
      this.bgColor = Colors.black,
      this.textColor = Colors.black});
}
