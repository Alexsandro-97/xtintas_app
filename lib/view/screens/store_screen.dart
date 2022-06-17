import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import 'package:xtintas_app/view/widgets/rounded_button_widget.dart';

import '/utils/colors/app_colors.dart';
import '../../controller/stores/paint_store.dart';
import '../widgets/diferencials_widget.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  PaintStore paintStore = PaintStore();

  final PageController controller = PageController(
    initialPage: 1,
    viewportFraction: 0.9,
  );

  @override
  void initState() {
    paintStore.getPaints();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int indexReference = 0;
    final sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Opções de tintas',
          style: TextStyle(
            color: Colors.black,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Observer(builder: (context) {
        return paintStore.paints.isNotEmpty
            ? Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      child: PageView.builder(
                        onPageChanged: (index) {
                          setState(() {
                            indexReference = index;
                            print("IndexReference: $indexReference");
                          });
                        },
                        controller: controller,
                        itemCount: paintStore.paints.length,
                        itemBuilder: (context, index) => Card(
                          margin: const EdgeInsets.only(
                            top: 30,
                            bottom: 5,
                            left: 10,
                            right: 10,
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    width: sizeScreen.width * 0.2,
                                    height: sizeScreen.height * 0.05,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child:
                                        const Center(child: Text('Indicação')),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      icon:
                                          const Icon(Icons.arrow_back_rounded),
                                      onPressed: () {
                                        controller.previousPage(
                                          duration:
                                              const Duration(milliseconds: 500),
                                          curve: Curves.easeIn,
                                        );
                                      },
                                      iconSize: 25,
                                    ),
                                    SizedBox(
                                      height: 100,
                                      width: 100,
                                      child: Image.network(
                                          paintStore.paints[index].image!),
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                          Icons.arrow_forward_rounded),
                                      onPressed: () {
                                        controller.nextPage(
                                          duration:
                                              const Duration(milliseconds: 500),
                                          curve: Curves.easeIn,
                                        );
                                      },
                                      iconSize: 25,
                                    ),
                                  ],
                                ),
                                Text(
                                  paintStore.paints[index].name!,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 35,
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      decoration: BoxDecoration(
                                        color: AppColors.backgroundSignInColor,
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(50),
                                            bottomLeft: Radius.circular(50)),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'Como pintar',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 3),
                                    Container(
                                      height: 35,
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.5),
                                        borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(50),
                                            bottomRight: Radius.circular(50)),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'Tirar dúvidas',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Card(
                      margin: const EdgeInsets.only(
                        left: 30.0,
                        right: 30.0,
                        top: 5,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Expanded(
                              child: Text(
                                'Diferenciais',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(height: 20),
                                itemCount: paintStore
                                    .paints[indexReference].benefits!.length,
                                itemBuilder: (context, index) =>
                                    DiferencialsList(
                                  icon: Icons.format_color_fill,
                                  title: paintStore.paints[indexReference]
                                      .benefits![index].name!,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: RoundedButton(
                        backgroundColor: AppColors.backgroundSignInColor,
                        onTapButton: () {
                          print(
                              "Lista de diferenciais: ${paintStore.paints[indexReference].benefits![1].name!}");
                          print("indexDiferenciais: $indexReference");
                        },
                        child: const Text(
                          'Adicionar ao carrinho',
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Center(
                child: Lottie.network(
                    'https://assets7.lottiefiles.com/packages/lf20_sjcbakkb.json'));
      }),
    );
  }
}
