import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>
    with TickerProviderStateMixin {
  late AnimationController animationController;

  late Animation<double> sizeAnimation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    sizeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(animationController);

    animationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
            )),
        centerTitle: true,
        title: Text(
          data['name'],
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              RotationTransition(
                turns: sizeAnimation,
                child: Hero(
                  tag: data['tag'],
                  child: Image.asset(data['Image'], height: 400, width: 400),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TweenAnimationBuilder(
                    duration: Duration(seconds: 2),
                    tween: Tween<Offset>(
                        begin: Offset(-150, 0), end: Offset(0, 0)),
                    builder:
                        (BuildContext context, Offset offset, Widget? child) {
                      return Transform.translate(
                        offset: offset,
                        child: Text(
                          "Mass : ${data['mass']}",
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      );
                    },
                  ),
                  TweenAnimationBuilder(
                    duration: Duration(seconds: 2),
                    tween:
                        Tween<Offset>(begin: Offset(150, 0), end: Offset(0, 0)),
                    builder:
                        (BuildContext context, Offset offset, Widget? child) {
                      return Transform.translate(
                        offset: offset,
                        child: Text(
                          "Radius : ${data['radius']}",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      );
                    },
                  ),
                ],
              ),
              TweenAnimationBuilder(
                duration: Duration(seconds: 2),
                tween: Tween<Offset>(begin: Offset(0, 300), end: Offset(0, 0)),
                builder: (BuildContext context, Offset offset, Widget? child) {
                  return Transform.translate(
                    offset: offset,
                    child: Text(
                      "Temperature : ${data['temp']}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  );
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              TweenAnimationBuilder(
                duration: Duration(seconds: 2),
                tween: Tween<Offset>(begin: Offset(150, 0), end: Offset(0, 0)),
                builder: (BuildContext context, Offset offset, Widget? child) {
                  return Transform.translate(
                    offset: offset,
                    child: Text(
                      "Description",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  );
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              TweenAnimationBuilder(
                duration: Duration(seconds: 2),
                tween: Tween<Offset>(begin: Offset(-150, 0), end: Offset(0, 0)),
                builder: (BuildContext context, Offset offset, Widget? child) {
                  return Transform.translate(
                    offset: offset,
                    child: Text(
                      "${data['des']}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
