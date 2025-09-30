# 💼 NLP2SQL with Mistral Large 2

![Mistral](https://img.shields.io/badge/Mistral%20AI-Large%202-blue?logo=academia&style=flat-square)
![MySQL](https://img.shields.io/badge/Database-MySQL-blue?logo=mysql&style=flat-square)
![Gradio](https://img.shields.io/badge/UI-Gradio-orange?logo=python&style=flat-square)

🇫🇷 **This project was proudly developed with Mistral AI (French technology).**

---

## 🎯 Objective
This project demonstrates how to integrate a **Mistral AI agent (Mistral Large 2)** with a corporate-style **MySQL database**, enabling natural language queries that are automatically converted into SQL and executed in real time.

Users can simply ask questions like *“Which employees are working on the Migration ERP project?”* and get results as structured tables.

---

## 🏗️ Database Structure
The `entreprise` database contains 4 main tables:

- **employe**: employee information (id, name, service, role)  
- **projet**: project information (id, name, budget, dates, status)  
- **employe_projet**: many-to-many relationship between employees and projects (role, allocation rate)  
- **tache**: tasks linked to projects (description, status, deadline, assignee)  

A **trigger** automatically updates a project status to *Completed* once all tasks are finished.  
A **stored procedure** provides statistics on project progression.

---

## ⚙️ Methodology
- Definition of a **system prompt** to guide the AI agent  
- Use of **Mistral Large 2** as the NLP2SQL engine (API `conversations`)  
- **Gradio** interface for user queries and displaying results as tables  
- Local **MySQL** database populated with realistic, corporate-style data  

---

---

## 🔎 Internal Workflow

The NLP2SQL pipeline is built around 4 main steps:

1. **User input (natural language)**  
   The user types a free-text question (e.g., *“Which projects were completed in 2025?”*).

2. **Translation NLP → SQL**  
   The `query_mistral_agent` function sends the question to the Mistral API.  
   The AI agent returns an SQL query wrapped between `<SQL>...</SQL>` tags, which is automatically extracted by the script.

3. **Execution on the MySQL database**  
   The `execute_sql` function connects to the `entreprise` database, runs the generated query, and retrieves both columns and rows.

4. **Structured output**  
   The `nlp2sql` function orchestrates the whole pipeline: it displays the generated SQL query in Markdown and renders the results as a **Pandas DataFrame** within the Gradio interface.

👉 In short: *Natural language question → SQL query → Concrete results in a table*.

---


## 📂 Repository Structure
```
NLP2SQL_project/
├── README.md                # Main documentation (French)
├── README_En.md             # English translated documentation
├── code/                    # Python scripts and prompts
│   ├── NLP2SQL.py           # Main script (Gradio + Mistral API + MySQL)
│   ├── system_prompt.txt    # System prompt for the AI agent
│   └── requete_NLP.txt      # Example natural language queries
├── database/                # MySQL database
│   └── entreprise.sql       # SQL script to recreate the database
├── screenshots/             # Visual demonstrations
│   ├── NLP_in_action_1.gif  # Demo animation 1
│   ├── NLP_in_action_2.gif  # Demo animation 2
│   └── NLP_screenshot.png   # Static screenshot
```

---

## 📸 Preview
![NLP2SQL Screenshot](screenshots/NLP_screenshot.png)

---

## 🌍 French Version
The French version of this README is available in [README.md](README.md).
