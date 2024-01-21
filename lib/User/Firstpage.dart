import 'package:devloperproject1/Widgets/Colour.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

class  Ufirstpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return firstpage();
  }
}

class firstpage extends State<Ufirstpage> {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [ColorConstants.drawercolor, Color(0xFF9dcdd1).withOpacity(0.2)],
          ),
        ),
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 1.0,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        // NOTICE: Uncomment if you want to add shadow behind the page.
        // Keep in mind that it may cause animation jerks.
        // boxShadow: <BoxShadow>[
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 0.0,
        //   ),
        // ],
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      child: Scaffold(
        appBar: AppBar(backgroundColor: ColorConstants.appbarcolor,
          title: const Text(''),
          leading: IconButton(
            onPressed: _handleMenuButtonPressed,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: _advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: Duration(milliseconds: 250),
                  child: Icon(
                    value.visible ? Icons.clear : Icons.menu,
                    key: ValueKey<bool>(value.visible),
                  ),
                );
              },
            ),
          ),
          actions: [Padding(padding: EdgeInsets.all(10),child:Icon(Icons.notifications),)],
        ),
        bottomNavigationBar: BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.business),
    label: 'HOSPITAL',
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.school),
    label: 'School',
    ),
    ],
    selectedItemColor:Color(0xFF0e9096) ,

    ),
        body:SingleChildScrollView(
    scrollDirection: Axis.vertical,

    child: Container(
    alignment: Alignment.topLeft,

    child:  Column(
    children: [
    Center(
    child: Card(margin: EdgeInsets.all(20),
    elevation: 10,shadowColor: Colors.cyan,
    color: Color(0xFF9dcdd1),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(16.0),
    topLeft: Radius.circular(16.0),
    bottomRight: Radius.circular(16.0),
    bottomLeft: Radius.circular(16.0))),
    child: Padding(padding: EdgeInsets.only(left: 40,right: 40,top: 10,bottom: 10),
    child:Column(
    children: [
    Image.asset('assets/image/hospital.png',width: 40,),
    SizedBox(height: 5,),
    Center(child: Text("Make Hospital Appoinment",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
    SizedBox(height: 5,),
    Center(child: Text("Make Appoinment With Hospital For"),),
    Center(child:Text("Tomorrow Without Mannageing Your Current")),
    Center(child:Text("Activity")),
    SizedBox(height: 20,),

    ElevatedButton(onPressed: (){}, child:Text("Find Hospital"),
    style:ElevatedButton.styleFrom(primary: Color(0xFF0e9096),shape: RoundedRectangleBorder(
    borderRadius:BorderRadius.all(Radius.circular(20))
    )),)
    ],
    ),)
    ),
    ),
    SizedBox(
    height: 15,
    ),
    Padding(
    padding: const EdgeInsets.fromLTRB(0, 0, 200, 0),
    child: Text("Nearest Hospital",style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),
    ),
    SizedBox(
    height: 20,
    ),
    Container(
    height: 500,
    child:   GridView.builder(
    itemCount: 4,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    crossAxisSpacing: 5,
    mainAxisSpacing: 5),
    itemBuilder: (BuildContext Context, int index) {
    return Card(

    child: Column(
    children: [
    Image.asset('assets/image/login.jpg'),
    ],
    ),
    );
    })
    )
    ],
    )
    ),
        ),),
      drawer: SafeArea(
        child: Container(
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 128.0,
                  height: 128.0,
                  margin: const EdgeInsets.only(
                    top: 24.0,
                    bottom: 64.0,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/images/flutter_logo.png',
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.account_circle_rounded),
                  title: Text('Profile'),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.favorite),
                  title: Text('Favourites'),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.logout),
                  title: Text('Log out'),
                ),
                Spacer(),
                DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white54,
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 16.0,
                    ),
                    child: Text('Terms of Service | Privacy Policy'),
                  ),
                ),
              ],
            ),),
        ),
      ));
  }
  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}

