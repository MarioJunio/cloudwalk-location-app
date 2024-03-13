# My location

<div style="display: flex; justify-content: center;">
<img src="https://github.com/MarioJunio/cloudwalk-location-app/blob/develop/images/img1.jpeg" width="200" style="margin-right: 10px;">

<img src="https://github.com/MarioJunio/cloudwalk-location-app/blob/develop/images/img2.jpeg" width="200" style="margin-right: 10px;">

<img src="https://github.com/MarioJunio/cloudwalk-location-app/blob/develop/images/img3.jpeg" width="200" style="margin-right: 10px;">

<img src="https://github.com/MarioJunio/cloudwalk-location-app/blob/develop/images/img4.jpeg" width="200" style="margin-right: 10px;">
</div>

### Objetivo do app
O objetivo do app é rodar tanto em Android quanto iOS, para apresentar a localização atual do usuário no mapa tanto com o serviço de localização ativo quanto inativo, caso esteja inativa a localização será requisitada em uma API e ela devolverá a localização aproximada e então um marcador será adicionado ao mapa, caso o usuário esteja sem internet a ultima localização retornada por essa API será apresentada.


### Requerimentos do app
* O GPS deve ser usado para recuperar a localização atual (testar com o GPS ativado e desativado)
* Deve ser exibido um marcador no mapa indicando o local atual
* O App deve funcionar offline (testar sem internet)
* Deve suportar múltiplas resoluções

## Rodando a aplicação

### Pré requisitos:
```text
* Flutter
```

Para iniciar a aplicação você pode utilizar o comando abaixo na raiz do projeto e selecionar qual dispositivo ou emulador você deseja rodar a aplicação:

```bat
flutter run
```

## Arquitetura
Para melhor entedimento, legibilidade, manuntenabilidade e para seguirmos os príncipios do SOLID eu escolhi utilizar a arquitetura limpa(clean architecture) que já é consolidada em projetos flutter e que podem ser segregados em vários microapps sem grandes dificuldades, segue abaixo um esboço dessa arquitetura:

![](https://github.com/MarioJunio/cloudwalk-location-app/blob/develop/images/clean_arc_flutter.png)

### Gerenciamento de estado
O gerenciamento de estado da aplicação foi feito utilizando ChangeNotifier, eu decidi utilizá-lo pela simplicidade, por faz parte do Flutter framework, e se integra bem com as features do flutter, com ele conseguimos segregar a regra de negócio da view e coloca-lá em um controller e sempre que precisarmos fazer alguma atualização de estado na tela podemos fazer isso invidualmente em cada Widget sem precisar reconstruir a árvore de widgets novamente para atualizar somente um widget específico, e alem de possuir uma curva de aprendizado bem rápida.

![](https://github.com/MarioJunio/cloudwalk-location-app/blob/develop/images/change_notifier.jpeg)

### Freezed - Data class
Para criação de entitidades e modelos que serão utilizados para recuperar e exibir dados de forma estruturada foi utilizado a lib freezed que auxilia na criação e geração dessas classes de modelo para os dados, para realizar a geração dessas classes basta rodar o seguinte comando:
```bat
dart run build_runner build --delete-conflicting-outputs
```

### Módulos e injeção de dependências
Para modularizar a aplicação e pensando na expansão a longo prazo eu decidi separar as features por domínio e dentro de cada domínio(módulo) temos um arquivo para registrar as depêndencias com a seguinte nomenclatura `<nome módulo>_di.dart` foi utilizado a lib `get_it` para fazer o controle do registro e injeção de dependências, dessa forma a separação de responsabilidades é alcançada e subdividir em módulos com diferentes propósitos melhora a sustentação do app a longo prazo sendo possível equipes distintas trabalharem em módulos específicos. A injeção de dependências e segregação em módulos também pode ser feita utilizando o `flutter_modular` pois ele permite que você faça os binds dos seus datasources, repositórios, usecases e controllers dentro de cada módulo. 

![](https://github.com/MarioJunio/cloudwalk-location-app/blob/develop/images/module_architecture.png)

### Cache de dados
O cache de dados foi feito utilizando a lib `hive` que é um banco de dados de chave-valor rápido, a chamada de busca pela localização utilizando a API é interceptada e a resposta é gravada no banco de dados com a chave estruturada da seguinte forma: `<http_method:http_path>` = `<http_response>`, então caso não haja conexão com a internet será obtido os dados em cache da última requisição http para a API bem sucedida.

### Testes
Para realizar os testes unitários eu utilizei a biblioteca `mockito` que oferece suporte para criação de mocks e stubs de uma maneira rápida e eficiente, para rodar os testes basta executar o seguinte comando abaixo na raiz do projeto:

```bat
flutter test
```

### Observações
Foram utilizando os seguintes plugins com suas respectivas versões:
  google_maps_flutter: 2.6.0
  geolocator: ^7.1.0
  get_it: ^7.2.0
  dio: ^5.4.1
  freezed: ^2.4.7
  freezed_annotation: ^2.4.1
  dart_either: 1.0.0
  hive: 2.2.3
  path_provider: 2.1.1

Ao clicar no botão para recuperar a localização na tela, será apresentado uma janela de diálogo pedindo para conceder a permissão de localização e enquanto a permissão não for concedida a janela  continuara sendo apresentada para o usuário até que a permissão seja totalmente negada, e se isso acontecer será aberto o app nas configurações para o usuário manualmente conceder a permissão, pois a permissão é necessária para o correto funcionamento do app.