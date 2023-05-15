import 'package:flutter/material.dart';
import 'package:to_do_list/constants/colors.dart';
import 'package:to_do_list/model/todo.dart';

class TodoItem extends StatelessWidget {
  final ToDo atao;
  final onToDoChanged;
  final onDeleteItem;

  const TodoItem({
    Key? key,
    required this.atao,
    required this.onToDoChanged,
    required this.onDeleteItem
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: ListTile(
        onTap: () {
          onToDoChanged(atao);
        },
        shape: StadiumBorder(),
        tileColor: Colors.blueGrey.shade200,
        contentPadding: EdgeInsets.only(right: 20.0, left: 30),
        leading: Icon(
          atao.efaVita? Icons.check_box : Icons.check_box_outline_blank,
          color: tdBlue,
        ),
        title: Text(
          atao.asaAtao!,
          style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              decoration: atao.efaVita?  TextDecoration.lineThrough : null,
          ),
        ),
        trailing: IconButton(
          onPressed: () {
            onDeleteItem(atao.id);
          },
          color: Colors.red, 
          icon: Icon(Icons.delete),
        ),
      ),
    );
  }
}
