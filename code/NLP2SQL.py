import gradio as gr
import requests
import mysql.connector
import os

# --- CONFIGURATION ---

os.getenv("MISTRAL_API_KEY")
MISTRAL_URL = "https://api.mistral.ai/v1/agents/completions"
AGENT_ID = "ag:94cc4bb3:20250922:test-sql:66ccc087"

DB_CONFIG = {  # l'objet DBCONFIG est utilisé plus loin dans la fonction execute_sql
    "host": "localhost",
    "user": "root",
    "password": "Mot_De_Passe",  #utiliser ici votre Mot de Passe - use your own password here 
    "database": "entreprise"
}

# --- FONCTIONS ---
# Prépare l’appel POST à l’API Mistral.
def query_mistral_agent(question: str) -> str:
    """Envoie une question en langage naturel à l'agent Mistral et récupère la requête SQL."""
    headers = {
        "Authorization": f"Bearer {MISTRAL_API_KEY}",
        "Content-Type": "application/json"
    }
    payload = {
        "agent_id": AGENT_ID,
        "messages": [
            {"role": "user", "content": question}
        ]
    }
    response = requests.post(MISTRAL_URL, headers=headers, json=payload)
    response.raise_for_status() #attend la réponse de l'API Mistral (200 = OK)
    data = response.json() #Récupère la réponse JSON et la stocke sous forme d'un dictionnaire python, plus facile à manipuler.

    # 🔎 Debug : affichage brut de la réponse JSON
    print("=== Réponse brute de Mistral ===")
    print(data)
    print("================================")

    # Récupération du SQL entre <SQL> et </SQL>
    content = data["choices"][0]["message"]["content"] #récupère le contenu de 'content' dans un dictionnaire python (après conversion par response.json())
    start = content.find("<SQL>") + 5
    end = content.find("</SQL>")
    sql_query = content[start:end].strip()

    return sql_query


def execute_sql(sql_query: str):
    """Exécute une requête SQL SELECT sur la base MySQL et renvoie les résultats."""
    conn = mysql.connector.connect(**DB_CONFIG) #Connexion MySQL avec DB_CONFIG.
    cursor = conn.cursor() #ouverture d’un curseur
    cursor.execute(sql_query) #Exécution de la requête (sélective)
    rows = cursor.fetchall() #récupération des lignes
    cols = [desc[0] for desc in cursor.description] #Récupère les colonnes (cursor.description)
    cursor.close() #Ferme proprement curseur et connexion
    conn.close()
    return cols, rows #Retourne colonnes + lignes.

import pandas as pd

def nlp2sql(question: str): #orchestrer le pipeline complet, c'est l'orchestrateur
    try:
        sql_query = query_mistral_agent(question)
        cols, rows = execute_sql(sql_query)

        # Conversion en DataFrame pour un affichage propre
        df = pd.DataFrame(rows, columns=cols)

        result_md = f"**Requête SQL générée :**\n```sql\n{sql_query}\n```\n\n"
        return result_md, df
    except Exception as e:
        return f"Erreur : {e}", None


# --- INTERFACE GRADIO ---

with gr.Blocks() as demo:
    gr.Markdown("# 💼 NLP → SQL (base entreprise)")
    inp = gr.Textbox(label="Posez une question en langage naturel")
    out_sql = gr.Markdown()
    out_table = gr.Dataframe(interactive=False)
    btn = gr.Button("Exécuter")
    btn.click(fn=nlp2sql, inputs=inp, outputs=[out_sql, out_table])

demo.launch()


