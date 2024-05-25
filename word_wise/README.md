# Word Wise

O WordWise é um aplicativo intuitivo para listar e gerenciar palavras em inglês, usando a API Free Dictionary API.

Ideal para estudantes e entusiastas do idioma, ele permite consultar definições, marcar palavras favoritas e criar listas personalizadas, facilitando o aprendizado e a revisão de vocabulário de forma organizada e prática.

> This is a challenge by [Coodesh](https://coodesh.com/)

<hr>

## Indice

1. [Tecnologias](#tecnologias)

   - [Linguagem e framework](#linguagem-e-framework)
   - [Stack](#stack)
   - [Pacotes](#pacotes)
   - [Pacotes de desenvolvimento](#pacotes-de-desenvolvimento)

2. [Pré-Setup](#getting-started)
   - [Flutter version](#flutter-version)
   - [Workspace scripts](#workspace-scripts)
3. [Setup](#setup)

## Tecnologias

### Linguagem e framework

<details>
<summary>Dart - linguagem</summary>
<br/>
<br/>
<img src="https://dart.dev/assets/img/logo/logo-white-text.svg" style="width:200px;">
<br/>
<br/>

An approachable, portable, and productive language for high-quality apps on any platform
Dart is:

- Approachable: Develop with a strongly typed programming language that is consistent, concise, and offers modern language features like null safety and patterns.

- Portable: Compile to ARM, x64, or RISC-V machine code for mobile, desktop, and backend. Compile to JavaScript or WebAssembly for the web.

- Productive: Make changes iteratively: use hot reload to see the result instantly in your running app. Diagnose app issues using DevTools.

- Dart's flexible compiler technology lets you run Dart code in different ways, depending on your target platform and goals:

- Dart Native: For programs targeting devices (mobile, desktop, server, and more), Dart Native includes both a Dart VM with JIT (just-in-time) compilation and an AOT (ahead-of-time) compiler for producing machine code.

- Dart Web: For programs targeting the web, Dart Web includes both a development time compiler (dartdevc) and a production time compiler (dart2js).

</details>

<details>
<summary>Flutter - framework</summary>
<br/>
<br/>
<img src="https://camo.githubusercontent.com/8ca355b5c8a6df04ea30294e513b38128c214075013df41d95609ccd1a745c91/68747470733a2f2f73746f726167652e676f6f676c65617069732e636f6d2f636d732d73746f726167652d6275636b65742f36653139666565366234376233366361363133662e706e67" style="width:200px;">
<br/>
<br/>

Flutter is Google's SDK for crafting beautiful, fast user experiences for mobile, web, and desktop from a single codebase. Flutter works with existing code, is used by developers and organizations around the world, and is free and open source.

</details>

### Stack

<details>
<summary>Cache - Hive</summary>
<br/>
<br/>
<img src="https://raw.githubusercontent.com/hivedb/hive/master/.github/logo_transparent.svg?sanitize=true" style="width:200px;">
<br/>
<br/>

[Hive](https://pub.dev/packages/hive) is a lightweight and blazing fast key-value database written in pure Dart. Inspired by Bitcask.

</details>

<details>
<summary>Autenticação e persistência dos dados online - Supabase</summary>

<img src="https://user-images.githubusercontent.com/8291514/213727225-56186826-bee8-43b5-9b15-86e839d89393.png#gh-dark-mode-only" style="width:600px;">
<br/>
<br/>

[Supabase](https://supabase.com/) is an open source Firebase alternative. We're building the features of Firebase using enterprise-grade open source tools.

</details>

<details>
<summary>Gerenciamento de estado - Bloc/Cubit</summary>
<br/>
<br/>
<img src="https://raw.githubusercontent.com/felangel/bloc/master/assets/logos/flutter_bloc.png" style="width:200px;">
<br/>
<br/>

[Bloc](https://bloclibrary.dev/getting-started/) makes it easy to separate presentation from business logic, making your code fast, easy to test, and reusable.

</details>

### Pacotes

<details>
<summary>bloc</summary>

> Implementa o padrão de arquitetura BLoC (Business Logic Component), usado para gerenciar o estado do aplicativo de forma reativa.

</details>

<details>
<summary>dio</summary>

> Uma poderosa biblioteca HTTP para Flutter e Dart, usada para fazer solicitações de rede.

</details>

<details>
<summary>freezed_annotation</summary>

> Usado para gerar código para classes imutáveis em Dart, útil para modelagem de dados.

</details>

<details>
<summary>flutter_bloc</summary>

> Fornece ferramentas para implementar a arquitetura BLoC de forma mais eficiente em aplicativos Flutter.

</details>

<details>
<summary>flutter_dotenv</summary>

> Permite carregar variáveis de ambiente a partir de um arquivo .env, útil para separar configurações sensíveis do código-fonte.

</details>

<details>
<summary>get_it</summary>

> Um simples serviço de localização para gerenciamento de dependências em aplicativos Flutter.

</details>

<details>
<summary>go_router</summary>

> Uma biblioteca de roteamento para Flutter que fornece uma maneira mais flexível de gerenciar a navegação dentro do aplicativo.

</details>

<details>
<summary>google_fonts</summary>

> Permite o uso de fontes do Google em aplicativos Flutter sem precisar baixá-las e adicioná-las manualmente ao projeto.

</details>

<details>
<summary>hive</summary>

> Um banco de dados de chave-valor rápido, eficiente e fácil de usar para Flutter.

</details>

<details>
<summary>json_annotation</summary>

> Usado para gerar serializadores JSON de forma automática a partir de classes Dart.

</details>

<details>
<summary>just_audio</summary>

> Uma biblioteca de reprodução de áudio para Flutter que fornece uma API simples e poderosa para reproduzir áudio local e remoto.

</details>

<details>
<summary>lottie</summary>

> Permite a exibição de animações Lottie em aplicativos Flutter.

</details>

<details>
<summary>path_provider</summary>

> Fornece uma maneira fácil de acessar diretórios de armazenamento no dispositivo, como diretórios de documentos e cache.

</details>

<details>
<summary>supabase_flutter</summary>

> Uma biblioteca cliente para Supabase, uma plataforma de banco de dados e autenticação.

</details>

### Pacotes de desenvolvimento

<details>
<summary>build_runner</summary>

> Ferramenta que executa geradores de código para gerar código Dart durante o tempo de compilação, usado principalmente com pacotes como json_serializable e freezed para gerar código de serialização.

</details>

<details>

<summary>flutter_gen_runner</summary>

> Um gerador de código para Flutter que facilita a geração de código Dart a partir de arquivos JSON, YAML, etc., usado para gerar classes de recursos a partir de arquivos de recursos.

</details>
<details>
<summary>freezed</summary>

> Uma biblioteca para gerar classes imutáveis em Dart, usada para definir classes de dados imutáveis com facilidade.

</details>
<details>
<summary>json_serializable</summary>

> Usado para gerar código de serialização JSON para classes Dart, tornando mais fácil trabalhar com JSON em Dart.

</details>
<details>
<summary>melos</summary>

> Uma ferramenta para gerenciamento de monorepos Dart/Flutter, usada para trabalhar com projetos Dart/Flutter que contêm vários pacotes em um único repositório.

</details>
<details>
<summary>mocktail</summary>

> Biblioteca de mocks para testes de Flutter/Dart, usada para criar mocks de objetos e funções durante os testes, facilitando a simulação de comportamentos.

</details>

## Getting Started

### Pré-setup

#### 1 - Flutter version

Certifique-se de ter a verssão correta instalada em sua maquina. Para o gerenciamento de verssões recomendamos o uso do [FVM](https://fvm.app/).

Atualmente o projeto utiliza a seguinte verssão do Flutter:

```bash
$ melos $ fvm flutter --version
> 3.13.9
```

#### 2 - Workspace scripts

São scripts personalizados que podem ser definidos no contexto de um workspace.

Para o gerenciamento dos scripts estamos utilizando o [Melos](https://melos.invertase.dev/getting-started).

Instalação do Melos:

```bash
$ melos dart pub global activate melos
```

```bash
$ melos $ melos --version
> Built melos:melos.
> 3.4.0
```

Com isso ganhamos o poder de ter scripts mais fáceis de lembrar ex: em vez de `fvm flutter pub get` temos apenas `melos get`.

Os scripts ficam no arquivo `melos.yaml` na raiz do projet.

Principais scripts:

```bash
$ melos open-ide # abre a sua ide na pasta corrente, esta configurado para vscode, mas pode er alterado no arquivo melos.yaml subistituindo open-ide: "code ." pela ide de sua preferencia ex open-ide: "studio ." para abrir o android studio
```

```bash
$ melos setup-dependencies # instala as dependencias no sistema
```

```bash
$ melos setup-project # limpa o projeto, baixa os pacotes, gera codigos e roda os testes e ao final abre a sua ide
```

```bash
$ melos setup-all # executa os dois setups em sequencia setup-dependencies e setup-project
```

```bash
$ melos get # baixa os pacotes
```

```bash
$ melos l10n # gera arquivos de localizacao
```

```bash
$ melos gen # faz a geracao de codigo
```

```bash
$ melos unit # roda os testes unitarios e ignora golden tests
```

### Setup

Uma vez com a [versão correta do Flutter](#1---flutter-version) em nossa maquina e com o [melos instalado](#2---workspace-scripts) podemos começar.

Dentro da pasta do projeto podemos rodar o comando `melos setup-all` que ele vai se encarregar de deixar o resto das coisas prontas para nós 🤞.

> O comando `melos setup-all` roda outros scripts agregados, então a sugestão em caso de erro é tentar rodar primeiro `melos setup-dependencies` e ver se não gera nenhum erro, em seguida rode `melos setup-project`.

Se tudo occoreu bem o projeto esta pronto para rodar no simulador e codar.

Para o projeto ter acesso a api do Supabase deve ser criado um arquivo `.env` na raiz do projeto com as keys:

```env
SUPABASE_URL="supabaseUrl"
SUPABASE_ANON_KEY="supabaseKey"
```

A estrutura do banco de dados:
