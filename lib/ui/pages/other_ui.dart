import 'package:flutter/material.dart';

class OtherPage extends StatefulWidget {
  const OtherPage({Key? key}) : super(key: key);

  @override
  State<OtherPage> createState() => _OtherPageState();
}

class _OtherPageState extends State<OtherPage> with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff15C9CB),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff15C9CB),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: size.width * 335 / 428,
              height: size.height * 45 / 926,
              decoration: BoxDecoration(
                  color: Colors.white60,
                  borderRadius: BorderRadius.circular(8)),
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search...',
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              width: size.width * 0.04,
            ),
            Image(
              image: const AssetImage('assets/images/ic_settings.png'),
              width: size.height * 45 / 926,
              height: size.height * 40 / 926,
            ),
          ],
        ),
        bottom: TabBar(
          controller: tabController,
          isScrollable: true,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Colors.white,
          indicatorWeight: 3,
          labelPadding: EdgeInsets.symmetric(horizontal: size.width * 0.15),
          tabs: const[
            Tab(
              child: Text('Today'),
            ),
            Tab(
              child: Text('7 Daily'),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                colors: [
                  Color(0xff15C9CB),
                  Color(0xff1553CB),
                ],
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                colors: [
                  Color(0xff15C9CB),
                  Color(0xff1553CB),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
