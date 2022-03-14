class ActionEvent {
  String? data;
  String? categoria;
  String? oQue;
  String? como;
  String? quem;
  String? prazo;
  String? status;
  String? feedBack;
  String? obs;
  String? rowToEdit;
  String? id;

  ActionEvent({
    this.data,
    this.categoria,
    this.oQue,
    this.como,
    this.quem,
    this.prazo,
    this.status,
    this.feedBack,
    this.obs,
    this.rowToEdit,
    this.id,
  });

  factory ActionEvent.fromJson(dynamic json, int rowToEdit) {
    return ActionEvent(
      data: "${json[0]}",
      categoria: "${json[1]}",
      oQue: "${json[2]}",
      como: "${json[3]}",
      quem: "${json[4]}",
      prazo: "${json[5]}",
      status: "${json[6]}",
      feedBack: "${json[7]}",
      obs: "${json[8]}",
      rowToEdit: (rowToEdit + 2).toString(),
    );
  }

  Map toJson() => {
        'data': data ?? "",
        'categoria': categoria ?? "",
        'oQue': oQue ?? "",
        "como": como ?? "",
        'quem': quem ?? "",
        'prazo': prazo ?? "",
        'status': status ?? "",
        'feedBack': feedBack ?? "",
        'obs': obs ?? "",
        'rowToEdit': rowToEdit ?? "",
        'id': id ?? "",
      };
}
