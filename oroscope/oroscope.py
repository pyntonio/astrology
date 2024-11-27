from oroscope.natale_card import calcola_carta_natale
from lang.prompts import get_prompts
import openai
import os
from dotenv import load_dotenv

# Carica le variabili d'ambiente dal file .env
load_dotenv()

# Carica la chiave API di OpenAI
openai.api_key = os.getenv("OPENAI_API_KEY")

# Verifica che la chiave API sia stata caricata correttamente
if openai.api_key is None:
    raise ValueError("La chiave API non è stata trovata. Assicurati che il file .env contenga OPENAI_API_KEY.")

async def genera_oroscopo(data: dict):
    try:
        # Estrai i dati dal dizionario
        nome = data["nome"]
        data_nascita = data["data_nascita"]
        ora_nascita = data["ora_nascita"]
        luogo_nascita = data["luogo_nascita"]
        lingua = data.get("lingua", "it")
        tipi = data.get("tipi", "generico")  # Aggiungi un tipi di oroscopo, default "generico"

        # Calcola la carta natale
        carta_natale = calcola_carta_natale(data_nascita, ora_nascita, luogo_nascita)

        # Ottieni i prompt per i tipi di oroscopo richiesti
        prompts = get_prompts(nome, data_nascita, ora_nascita, luogo_nascita, carta_natale, lingua=lingua, tipi=tipi)

        # Creazione della risposta
        oroscopi = {}

        for tipo, lista_prompt in prompts.items():
            oroscopi[tipo] = []

            # Esegui la chiamata API per ciascun prompt separatamente
            for prompt in lista_prompt:
                response = openai.ChatCompletion.create(
                    model="gpt-4o",
                    messages=[{"role": "user", "content": prompt}],
                    max_tokens=2000,
                    temperature=0.7
                )

                # Aggiungi la risposta per il tipo di oroscopo
                oroscopi[tipo].append(response.choices[0].message['content'].strip())

        return {"oroscopi": oroscopi}

    except Exception as e:
        return {"error": str(e)}
