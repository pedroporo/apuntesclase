---
dg-publish: true
---

Ultima Modificacion: `$= dv.current().file.mtime`

Curso: Desarollo de aplicaciones multiplataforma segundo

Titulo de la actividad: **SA4 - Automatización usando n8n + IA**

Alumno: Pedro Guill Ferri

Fecha de entrega: `$= dv.date("today")`


<center><img src="https://picsum.photos/500/700" alt="Portada" /></center>
### Dockerfile para implementar n8n

```yaml
version: '3'
services:
  ollama:
    image: ollama/ollama
    ports:
      - "11434:11434"
    container_name: ollama
    privileged: true
    environment:
      - NVIDIA_VISIBLE_DEVICES=all
      - NVIDIA_DRIVER_CAPABILITIES=compute,utility,graphics
      - OLLAMA_HOST=http://0.0.0.0:11434
    extra_hosts:
      - "host.docker.internal:host-gateway"
    volumes:
      - ./ollama_data:/root/.ollama
  n8n:
    image: n8nio/n8n
    ports:
      - "5678:5678"
    environment:
      - N8N_BASIC_AUTH_ACTIVE=true
      - N8N_BASIC_AUTH_USER=user
      - N8N_BASIC_AUTH_PASSWORD=password
      - DB_TYPE=postgresdb
      - DB_POSTGRESDB_HOST=db
      - DB_POSTGRESDB_PORT=5432
      - DB_POSTGRESDB_DATABASE=n8n
      - DB_POSTGRESDB_USER=n8n
      - DB_POSTGRESDB_PASSWORD=n8n
      - NODE_FUNCTION_ALLOW_EXTERNAL=axios,qs
      - GENERIC_TIMEZONE=Europe/Madrid
      - TZ=Europe/Madrid
    depends_on:
      - db
    restart: unless-stopped
    volumes:
      - ./n8n_data:/home/node/.n8n
      - ./local-files:/files

  db:
    image: postgres:13
    volumes:
      - ./db-data:/var/lib/postgresql/data
    environment:
      - POSTGRES_USER=n8n
      - POSTGRES_PASSWORD=n8n
      - POSTGRES_DB=n8n
    restart: unless-stopped

```

### Json para la importacion del WorkFlow
```json
{
  "name": "My workflow",
  "nodes": [
    {
      "parameters": {
        "rule": {
          "interval": [
            {
              "triggerAtHour": 8,
              "triggerAtMinute": 30
            }
          ]
        }
      },
      "type": "n8n-nodes-base.scheduleTrigger",
      "typeVersion": 1.3,
      "position": [
        0,
        -240
      ],
      "id": "90b54074-7a7f-4baa-8768-3816877e6be0",
      "name": "Schedule Trigger"
    },
    {
      "parameters": {
        "url": "https://fakerapi.it/api/v2/custom",
        "sendQuery": true,
        "queryParameters": {
          "parameters": [
            {
              "name": "_quantity",
              "value": "10"
            },
            {
              "name": "nombre",
              "value": "name"
            },
            {
              "name": "fechaNacimiento",
              "value": "dateTime"
            },
            {
              "name": "ciudad",
              "value": "city"
            }
          ]
        },
        "options": {}
      },
      "type": "n8n-nodes-base.httpRequest",
      "typeVersion": 4.3,
      "position": [
        224,
        -240
      ],
      "id": "0273739a-2cd0-4225-ad04-e8eef3b13efc",
      "name": "HTTP Request"
    },
    {
      "parameters": {
        "jsCode": "// Loop over input items and add a new field called 'myNewField' to the JSON of each one\nlet items=[];\nfor (const item of $input.first().json.data) {\n  var item2={\n    \"nombre\": item.nombre,\n    \"fechaNacimiento\":item.fechaNacimiento.date,\n    \"ciudad\":item.ciudad\n  }\n  items.push(item2);\n}\n\nreturn {\"data\":items};"
      },
      "type": "n8n-nodes-base.code",
      "typeVersion": 2,
      "position": [
        448,
        -240
      ],
      "id": "87aae383-0af2-4a6a-9fdd-f07649cee4cf",
      "name": "Code in JavaScript"
    },
    {
      "parameters": {
        "modelId": {
          "__rl": true,
          "value": "models/gemini-2.0-flash-lite",
          "mode": "list",
          "cachedResultName": "models/gemini-2.0-flash-lite"
        },
        "messages": {
          "values": [
            {
              "content": "Generame un html bonito para mostrar los nombres de las personas, su fecha de nacimiento (en formato que los humanos podamos entender) y en que ciudad viven, devuélveme solo el html sin nadad mas y que contengan todos los usuarios, los datos son los que hay en el json, solo quiero el html y NADA MAS"
            }
          ]
        },
        "jsonOutput": true,
        "options": {}
      },
      "type": "@n8n/n8n-nodes-langchain.googleGemini",
      "typeVersion": 1,
      "position": [
        672,
        -448
      ],
      "id": "3057a0be-e99a-45a1-a748-02ccf1c07139",
      "name": "Message a model",
      "credentials": {
        "googlePalmApi": {
          "id": "JQDdJf3iXO0ZhFY0",
          "name": "Google Gemini(PaLM) Api account"
        }
      }
    },
    {
      "parameters": {
        "sendTo": "pedroguillferri9@gmail.com",
        "subject": "HTML n8n",
        "message": "={{ $json.content }}",
        "options": {}
      },
      "type": "n8n-nodes-base.gmail",
      "typeVersion": 2.2,
      "position": [
        1120,
        -304
      ],
      "id": "696b15ce-65f1-45ef-a3a5-0ec291633055",
      "name": "Send a message",
      "webhookId": "245626da-ffa6-49e2-bc2f-72b688da4cf0",
      "credentials": {
        "gmailOAuth2": {
          "id": "7EMYRQzfSUzq4hX3",
          "name": "Gmail account"
        }
      }
    },
    {
      "parameters": {
        "modelId": {
          "__rl": true,
          "value": "llama3.2:latest",
          "mode": "list",
          "cachedResultName": "llama3.2:latest"
        },
        "messages": {
          "values": [
            {
              "content": "=Hazme un html que muestre estos datos {{ $json.data }}, los campos que tienen cada objeto son nombre, fechaNacimiento y ciudad,lo cual se va a leer como`{{ $json.data[0].nombre}}`,lee los valores de todos los objetos para entender mejor lo que hay que hacer, estos datos se van a enviar por email, asi que ponlo en formato que se puedan enviar por hay, y si tienes que leer todos los datos antes hazlo, devuelveme solo el html sin NADA mas. Si envias algo mas que no sea solo el html me van a despedir del trabajo"
            }
          ]
        },
        "options": {}
      },
      "type": "@n8n/n8n-nodes-langchain.ollama",
      "typeVersion": 1,
      "position": [
        672,
        -240
      ],
      "id": "c9723b8d-7ee1-4709-ace7-1491dc520126",
      "name": "Message a model1",
      "credentials": {
        "ollamaApi": {
          "id": "bEEe3ATta6JLtxvn",
          "name": "Ollama account"
        }
      }
    },
    {
      "parameters": {
        "method": "POST",
        "url": "http://localhost:11434/api/generate",
        "sendBody": true,
        "contentType": "raw",
        "rawContentType": "Content-Type: application/json",
        "body": "={     \"model\": \"llama3.2:latest\",     \"prompt\": \"Generame un html bonito para mostrar los nombres de las personas, su fecha de nacimiento (en formato que los humanos podamos entender) y en que ciudad viven, devuélveme solo el html sin nadad mas y que contengan todos los usuarios, los datos son los que hay en el json, solo quiero el html y NADA MAS, los datos son estos :{{ $json.data }}\",     \"stream\": false } ",
        "options": {}
      },
      "type": "n8n-nodes-base.httpRequest",
      "typeVersion": 4.3,
      "position": [
        704,
        32
      ],
      "id": "c78bc6ca-c5f8-43aa-a222-7bb568ab8cf4",
      "name": "HTTP Request1",
      "alwaysOutputData": false
    }
  ],
  "pinData": {},
  "connections": {
    "Schedule Trigger": {
      "main": [
        [
          {
            "node": "HTTP Request",
            "type": "main",
            "index": 0
          }
        ]
      ]
    },
    "HTTP Request": {
      "main": [
        [
          {
            "node": "Code in JavaScript",
            "type": "main",
            "index": 0
          }
        ]
      ]
    },
    "Code in JavaScript": {
      "main": [
        [
          {
            "node": "Message a model1",
            "type": "main",
            "index": 0
          }
        ]
      ]
    },
    "Message a model": {
      "main": [
        []
      ]
    },
    "Message a model1": {
      "main": [
        [
          {
            "node": "Send a message",
            "type": "main",
            "index": 0
          }
        ]
      ]
    }
  },
  "active": false,
  "settings": {
    "executionOrder": "v1"
  },
  "versionId": "35a5f071-0857-4667-8969-ce7d89fa1afb",
  "meta": {
    "templateCredsSetupCompleted": true,
    "instanceId": "a4bf5c5d78eaab2da287d5fadab59587b41ce1bcb7dbb5917976ab24fb860cf6"
  },
  "id": "5tFMY1wfoDpTbmQ7",
  "tags": []
}
```