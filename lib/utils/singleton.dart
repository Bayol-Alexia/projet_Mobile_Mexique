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

  double latitud = 0.0;
  double longitud = 0.0;

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

    products.add('1#nombre1#estilo#../images/Hamburguesa1.png#calif#favoritos#Clasicos');
    products.add('2#nombre2#estilo#../images/Hamburguesa2.png#calif#favoritos#Clasicos');
    products.add('3#nombre3#estilo#../images/Hamburguesa1.png#calif#favoritos#Clasicos');
    products.add('4#nombre4#estilo#../images/Hamburguesa2.png#calif#favoritos#Combos');
    products.add('5#nombre5#estilo#../images/Hamburguesa1.png#calif#favoritos#Clasicos');
    products.add('6#nombre6#estilo#../images/Hamburguesa2.png#calif#favoritos#Combos');
    products.add('7#nombre7#estilo#../images/Hamburguesa1.png#calif#favoritos#Adicionales');
    products.add('8#nombre8#estilo#../images/Hamburguesa2.png#calif#favoritos#Adicionales');

  }

  void clearVariables() {
    int num = 0;
    List lista = [];
    String dato = '';
  }
}