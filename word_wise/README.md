# Word Wise

O WordWise é um aplicativo intuitivo para listar e gerenciar palavras em inglês, usando a API Free Dictionary API.

Ideal para estudantes e entusiastas do idioma, ele permite consultar definições, marcar palavras favoritas e criar listas personalizadas, facilitando o aprendizado e a revisão de vocabulário de forma organizada e prática.

> This is a challenge by [Coodesh](https://coodesh.com/)

## Getting Started

### Flutter version

Certifique-se de ter a verssão correta instalada em sua maquina. Para o gerenciamento de verssões recomendamos o uso do [FVM](https://fvm.app/).

Atualmente o projeto utiliza a seguinte verssão do Flutter:

```bash
$ fvm flutter --version
> 3.13.9
```

### Workspace scripts

São scripts personalizados que podem ser definidos no contexto de um workspace.

Para o gerenciamento dos scripts estamos utilizando o [Melos](https://melos.invertase.dev/getting-started).

Instalação do Melos:

```bash
dart pub global activate melos
```

```bash
$ melos --version
> Built melos:melos.
> 3.4.0
```

Com isso ganhamos o poder de ter scripts mais fáceis de lembrar ex: em vez de `fvm flutter pub get` temos apenas `melos get`.

Os scripts ficam no arquivo `melos.yaml` na raiz do projet.

Principais scripts:

- get
- tests
