// ignore_for_file: file_names

class Month {
  const Month({required this.numberOfMonth,required this.days});
  
  final int numberOfMonth;
  final int days;

  String getNameMonth() {
    return stringMonths[numberOfMonth];
  }
  
}

const Map stringMonths = {
  1: 'Janeiro',
  2: 'Fevereiro',
  3: 'Março',
  4: 'Abril',
  5: 'Maio',
  6: 'Junho',
  7: 'Julho',
  8: 'Agosto',
  9: 'Setembro',
  10: 'Outubro',
  11: 'Novembro',
  12: 'Dezembro',
  };