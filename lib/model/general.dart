class ModelGeneral {
  final String codigo;
  final List detalles;

  const ModelGeneral({required this.codigo, required this.detalles});

  factory ModelGeneral.fromJson(Map<String, dynamic> json) {
    return ModelGeneral(
      codigo: json['codigo'],
      detalles: json['detalles'],
    );
  }

  @override
  String toString() => "Codigo: $codigo. Detalle: $detalles.";
}
