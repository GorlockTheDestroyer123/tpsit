# cronometroeric

Relazione sull'Applicazione Timer/Cronometro in Flutter

Ho sviluppato un'applicazione di Timer/Cronometro utilizzando il Flutter. L'obiettivo principale del progetto era creare un timer che potesse tracciare il tempo trascorso e visualizzarlo in formato ore, minuti e secondi, mettendo un bottone che mi permettesse di metterlo in pausa, riprendere e resettare il timer. 

Logica dell’Applicazione

Utilizzo di Stream e StreamController: Ho utilizzato un StreamController denominato _tickController come componente centrale dell'applicazione. Questo controller genera eventi di "tick" a intervalli regolari (ogni secondo) che sono utilizzati per aggiornare il tempo trascorso.

Gestione del Tempo: Il tempo trascorso è mantenuto nella variabile _elapsedSeconds, espressa in secondi. La funzione formatTime converte questi secondi in un formato leggibile con ore, minuti e secondi.

Gestione del Timer: Ho implementato la funzione startTimer per avviare un timer periodico utilizzando Timer.periodic. Questo timer genera gli eventi di "tick" ogni secondo e aggiorna il tempo trascorso.

Pausa e Ripresa del Timer: Ho introdotto una variabile _isPaused per tenere traccia dello stato di pausa del timer. Quando il timer è in pausa, i secondi non vengono incrementati. Le funzioni pauseTimer e resumeTimer modificano questa variabile per gestire la pausa e la ripresa.

Reset del Timer: La funzione resetTimer reimposta il tempo trascorso a zero quando si preme il pulsante "Reset".

Interfaccia Utente: Ho progettato l'interfaccia utente utilizzando il framework Flutter, con una barra dell'app che mostra il titolo, e una sezione centrale che visualizza il tempo trascorso e i pulsanti per controllare il timer.

