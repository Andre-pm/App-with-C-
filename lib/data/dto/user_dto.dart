class UserDto {
  final String email;
  final String senha;
  final String nome;
  final int id;
  UserDto({
    required this.email,
    required this.senha,
    required this.nome,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'email': email});
    result.addAll({'senha': senha});
    result.addAll({'nome': nome});
    result.addAll({'id': id});

    return result;
  }

  factory UserDto.fromMap(Map<String, dynamic> map) {
    return UserDto(
      email: map['email'] ?? '',
      senha: map['senha'] ?? '',
      nome: map['nome'] ?? '',
      id: map['id']?.toInt() ?? 0,
    );
  }
}
