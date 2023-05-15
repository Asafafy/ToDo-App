class ToDo {
  String? id;
  String? asaAtao;
  bool efaVita;

  ToDo({
    required this.id,
    required this.asaAtao,
    this.efaVita = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', asaAtao: "Manao t-shirt", efaVita: false),
      ToDo(id: '02', asaAtao: "Manadio Cabine", efaVita: true),
      ToDo(id: '03', asaAtao: "Manadio fitaovana", efaVita: false),
      ToDo(id: '04', asaAtao: "Manao fety"),
      ToDo(id: '05', asaAtao: "Manao fandaharana"),
      ToDo(id: '06', asaAtao: "Manao t-shirt", efaVita: false),
      ToDo(id: '07', asaAtao: "Manadio Cabine", efaVita: true),
      ToDo(id: '08', asaAtao: "Manadio fitaovana", efaVita: false),
      ToDo(id: '09', asaAtao: "Manao fety"),
      ToDo(id: '10', asaAtao: "Manao fandaharana")
    ];
  }
}
