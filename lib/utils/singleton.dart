class Singleton {
  static Singleton? _instance;
  //Si c'est nul ou ide, prendre o créer une nouvelle instance
  Singleton._internal() {
    _instance = this;
  }

  //Verifier si singleton es nul ou vide, si c'est la cas il crée une nouvelle instance
  factory Singleton() => _instance ?? Singleton._internal();

  String user = '';
  String password = '';

  List titleProducts = [];
  List products = [];

  int num = 0;
  List lista = [];
  String dato = '';

  void iniciarLista() {
    titleProducts.add('Todos');
    titleProducts.add('Combos');
    titleProducts.add('Clasicos');
    titleProducts.add('Adicionales');

    /*titleProducts= [
      'Combos', 'Combos', 'Combos'
  ];*/

    products.add('1#nombre1#estilo#imagen.png#calif#favoritos#categoria');
    products.add('2#nombre2#estilo#imagen.png#calif#favoritos#categoria');
    products.add('3#nombre3#estilo#imagen.png#calif#favoritos#categoria');
    products.add('4#nombre4#estilo#imagen.png#calif#favoritos#categoria');
    products.add('5#nombre5#estilo#imagen.png#calif#favoritos#categoria');
    products.add('6#nombre6#estilo#imagen.png#calif#favoritos#categoria');
    products.add('7#nombre7#estilo#imagen.png#calif#favoritos#categoria');
    products.add('8#nombre8#estilo#imagen.png#calif#favoritos#categoria');

  }

  void clearVariables() {
    int num = 0;
    List lista = [];
    String dato = '';
  }
}
