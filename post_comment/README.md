Questo progetto dimostra come utilizzare Floor, un ORM (Object-Relational Mapping) per Flutter, per semplificare l'interazione con il database SQLite. 

## Struttura del Progetto

- `lib/main.dart`: Il punto di ingresso dell'applicazione, che inizializza il database e fornisce un'interfaccia utente per eseguire operazioni sul database.
- `lib/app_database.dart`: Definisce `AppDatabase`, che è la classe principale del database dell'applicazione. Include le entità e i DAO (Data Access Objects) utilizzati.
- `lib/post.dart`: Contiene la definizione dell'entità `Post`.
- `lib/comment.dart`: Contiene la definizione dell'entità `Comment`.
- `lib/post_dao.dart`: Definisce `PostDao`, il DAO per l'interazione con la tabella `posts`.
- `lib/comment_dao.dart`: Definisce `CommentDao`, il DAO per l'interazione con la tabella `comments`.

## Configurazione

Per utilizzare questo progetto, assicurati di avere Flutter installato sul tuo sistema. Successivamente, aggiungi le seguenti dipendenze nel tuo file `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  floor: ^latest_version
  sqflite: ^latest_version # Necessario per l'uso di Floor

dev_dependencies:
  flutter_test:
    sdk: flutter
  floor_generator: ^latest_version
  build_runner: ^latest_version
