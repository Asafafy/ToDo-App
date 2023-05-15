import 'package:flutter/material.dart';
import 'package:to_do_list/constants/colors.dart';
import 'package:to_do_list/model/todo.dart';
import 'package:to_do_list/widgets/todo_items.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ataoListe = ToDo.todoList();
  final _ataoControlleur = TextEditingController();
  List<ToDo> _foundToDo = [];

  @override
  void initState() {
    _foundToDo = ataoListe;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgColor1,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            width: screenSize.width,
            height: screenSize.height,
            padding: EdgeInsets.only(left: 20, right: 20, top: 15),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: TextField(
                    onChanged: (value) => _runFilter(value),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search, color: tdBlack, size: 20),
                      prefixIconConstraints: BoxConstraints(
                        maxHeight: 20,
                        minWidth: 25,
                      ),
                      border: InputBorder.none,
                      hintText: "Hitady",
                      hintStyle: TextStyle(color: tdGrey),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      titreLisitryNyAsa(),
                      for (ToDo elt in _foundToDo.reversed)
                        TodoItem(
                          atao: elt,
                          onToDoChanged: _handleToDoChange,
                          onDeleteItem: _deleteToDoItem,
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 20.0),
                      margin: EdgeInsets.only(bottom: 20.0, right: 20.0, left: 20.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 10.0,
                            spreadRadius: 0.0,
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: _ataoControlleur,
                        decoration: InputDecoration(
                          hintText: "Mampiditra vaovao",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20.0, right: 20.0),
                  decoration: BoxDecoration(
                    color: tdBlue,
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  child: IconButton(
                    onPressed: () {
                      _addToDoItem(_ataoControlleur.text);
                    },
                    icon: Icon(Icons.add),
                    color: Colors.white,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }





  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.efaVita = !todo.efaVita; //  Changer la valeur de efaVita en son opposé
    });
  }


  void _deleteToDoItem(String id) {
    setState(() {
      ataoListe.removeWhere((elt) => elt.id == id);
    });
  }


  void _addToDoItem(String atao){
    setState(() {
      ataoListe.add(ToDo(id: DateTime.now().millisecond.toString(), asaAtao: atao));
    });
    _ataoControlleur.clear();
  }


  void _runFilter(String enteredKeyword) {
    List<ToDo> resultat = [];
    if (enteredKeyword.isEmpty) {
      resultat = ataoListe;
    } else {
      resultat = ataoListe.where((elt) => elt.asaAtao!.toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
    }
    setState(() {
      _foundToDo = resultat;
    });
  }





  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: bgColor1,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.menu,
            color: tdBlack,
            size: 30,
          ),
          Container(
            width: 40,
            height: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Image.asset('assets/images/utilisateur.png',
                  fit: BoxFit.fill),
            ),
          )
        ],
      ),
    );
  }

}





class titreLisitryNyAsa extends StatelessWidget {
  const titreLisitryNyAsa({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30, bottom: 20),
      child: const Text(
        "Lisitry ny asa",
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
