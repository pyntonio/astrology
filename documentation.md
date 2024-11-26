Ecco la documentazione dell'applicazione creata, con le specifiche delle API, gli input attesi e gli output restituiti, insieme agli esempi di chiamata `curl` per ogni funzionalità.

---

## **Documentazione dell'App**

### **1. Overview**

Questa applicazione FastAPI integra diversi moduli, ognuno dei quali offre funzionalità specifiche come la gestione di un assistente personale, la generazione di contenuti, il supporto psicologico, e tanto altro. Ogni modulo utilizza l'API **OpenAI** per migliorare l'interazione con l'utente.

---

### **2. Funzionalità dell'App e Specifiche API**

#### **2.1. Gestione Promemoria e To-Do List**

**Endpoint:** `/tasks`  
**Metodo:** `GET`  
**Descrizione:** Restituisce la lista dei task presenti.  
**Input:** Nessuno  
**Output:** Una lista di task, ognuno con il nome e la data di scadenza.

**Esempio di risposta:**
```json
[
    {
        "task": "Comprare latte",
        "due_date": "2024-11-22"
    },
    {
        "task": "Finire report",
        "due_date": "2024-11-23"
    }
]
```

**Esempio di chiamata `curl`:**
```bash
curl -X 'GET' 'http://127.0.0.1:8000/tasks'
```

---

**Endpoint:** `/tasks`  
**Metodo:** `POST`  
**Descrizione:** Aggiunge un nuovo task alla lista.  
**Input:**
```json
{
    "task": "Comprare latte",
    "due_date": "2024-11-22"
}
```

**Output:** Un messaggio di conferma.

**Esempio di risposta:**
```json
{
    "message": "Task 'Comprare latte' added."
}
```

**Esempio di chiamata `curl`:**
```bash
curl -X 'POST' 'http://127.0.0.1:8000/tasks' -H 'Content-Type: application/json' -d '{"task": "Comprare latte", "due_date": "2024-11-22"}'
```

---

#### **2.2. Scrittura Creativa e Generazione di Testi**

**Endpoint:** `/generate_story/{theme}`  
**Metodo:** `GET`  
**Descrizione:** Genera una storia creativa in base al tema fornito.  
**Input:**  
- `theme` (Stringa) - Il tema per la storia.

**Output:** La storia generata.

**Esempio di risposta:**
```json
{
    "story": "Once upon a time, in a land far away, there was a kingdom where everyone was happy."
}
```

**Esempio di chiamata `curl`:**
```bash
curl -X 'GET' 'http://127.0.0.1:8000/generate_story/adventure'
```

---

#### **2.3. Traduzione di Testi**

**Endpoint:** `/translate`  
**Metodo:** `GET`  
**Descrizione:** Traduce un testo in una lingua target.  
**Input:**  
- `text` (Stringa) - Il testo da tradurre.
- `target_language` (Stringa) - La lingua di destinazione.

**Output:** Il testo tradotto.

**Esempio di risposta:**
```json
{
    "translated_text": "Hola, ¿cómo estás?"
}
```

**Esempio di chiamata `curl`:**
```bash
curl -X 'GET' 'http://127.0.0.1:8000/translate?text=Hello%20world&target_language=Spanish'
```

---

#### **2.4. Risposte Automate per il Supporto Clienti**

**Endpoint:** `/respond`  
**Metodo:** `GET`  
**Descrizione:** Genera una risposta automatica al messaggio di un cliente.  
**Input:**  
- `message` (Stringa) - Il messaggio del cliente.

**Output:** La risposta generata.

**Esempio di risposta:**
```json
{
    "response": "Thank you for your message! We will get back to you shortly."
}
```

**Esempio di chiamata `curl`:**
```bash
curl -X 'GET' 'http://127.0.0.1:8000/respond?message=I%20have%20a%20question%20about%20my%20order'
```

---

#### **2.5. Generazione di Post per i Social Media**

**Endpoint:** `/social_media`  
**Metodo:** `GET`  
**Descrizione:** Genera un post per i social media basato su un argomento.  
**Input:**  
- `topic` (Stringa) - L'argomento del post.

**Output:** Il contenuto del post generato.

**Esempio di risposta:**
```json
{
    "post": "Check out this amazing new product! It's perfect for your daily needs."
}
```

**Esempio di chiamata `curl`:**
```bash
curl -X 'GET' 'http://127.0.0.1:8000/social_media?topic=New%20Product%20Launch'
```

---

#### **2.6. Messaggi Motivazionali**

**Endpoint:** `/motivational_quote`  
**Metodo:** `GET`  
**Descrizione:** Restituisce una citazione motivazionale casuale.  
**Input:** Nessuno  
**Output:** Una citazione motivazionale.

**Esempio di risposta:**
```json
{
    "quote": "Believe you can and you're halfway there."
}
```

**Esempio di chiamata `curl`:**
```bash
curl -X 'GET' 'http://127.0.0.1:8000/motivational_quote'
```

---

#### **2.7. Analisi Decisionale**

**Endpoint:** `/analyze_decision`  
**Metodo:** `GET`  
**Descrizione:** Fornisce un'analisi sulla decisione basata su pro e contro.  
**Input:**  
- `pros` (Lista di Stringhe) - I vantaggi della decisione.
- `cons` (Lista di Stringhe) - Gli svantaggi della decisione.

**Output:** Una valutazione sulla decisione.

**Esempio di risposta:**
```json
{
    "decision_analysis": "The decision seems favorable based on the pros."
}
```

**Esempio di chiamata `curl`:**
```bash
curl -X 'GET' 'http://127.0.0.1:8000/analyze_decision?pros=["good%20for%20business","quick%20to%20implement"]&cons=["high%20cost"]'
```

---

#### **2.8. Creazione di Piani di Lezione**

**Endpoint:** `/create_lesson_plan`  
**Metodo:** `GET`  
**Descrizione:** Crea un piano di lezione basato su un soggetto, un argomento e una durata.  
**Input:**  
- `subject` (Stringa) - Il soggetto della lezione.
- `topic` (Stringa) - L'argomento della lezione.
- `duration` (Intero) - La durata della lezione in minuti.

**Output:** Il piano di lezione.

**Esempio di risposta:**
```json
{
    "lesson_plan": "Lesson Plan: Subject: Math, Topic: Algebra, Duration: 45 minutes."
}
```

**Esempio di chiamata `curl`:**
```bash
curl -X 'GET' 'http://127.0.0.1:8000/create_lesson_plan?subject=Math&topic=Algebra&duration=45'
```

---

### **3. Come Eseguire l'App**

Per eseguire l'app, puoi avviare il server con il comando:

```bash
uvicorn app:app --reload
```

Ora puoi testare tutte le funzionalità descritte inviando richieste HTTP alle URL degli endpoint.

---

### **Conclusioni**

Questa documentazione fornisce un overview completa delle funzionalità implementate nell'app FastAPI, che utilizza OpenAI per molte delle sue capacità. Puoi estendere ulteriormente l'app aggiungendo più funzionalità o migliorando l'architettura a seconda delle necessità.
