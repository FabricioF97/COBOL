# 💻 COBOL no Windows com GnuCOBOL + MSYS2 UCRT64 + VS Code

Este guia mostra, do zero, como preparar um computador Windows para desenvolver programas em **COBOL** utilizando:

* Windows 10 ou Windows 11
* MSYS2
* Terminal UCRT64
* GnuCOBOL
* Visual Studio Code
* Tema Dracula
* Terminal UCRT64 integrado ao VS Code

O objetivo é chegar ao ponto em que seja possível criar um arquivo:

```text
Helloworld.cbl
```

Compilar:

```bash
cobc -x Helloworld.cbl
```

E executar:

```bash
./Helloworld.exe
```

Obtendo:

```text
Hello WORLD!
```

---

# 📚 1. O que será instalado

Antes de começar, é importante entender para que serve cada ferramenta.

### GnuCOBOL

É o compilador que transforma nosso código COBOL em um programa executável.

O comando principal utilizado será:

```bash
cobc
```

### MSYS2

O MSYS2 fornece um ambiente de terminal e pacotes de desenvolvimento para Windows.

Neste projeto utilizaremos especificamente:

```text
UCRT64
```

### Visual Studio Code

Será nosso editor para escrever os programas COBOL.

### Dracula

É apenas o tema visual utilizado no VS Code.

Não é necessário para executar COBOL, mas deixa o ambiente mais agradável.

---

# 🟦 2. Instalar o Visual Studio Code

Acesse o site oficial do **Visual Studio Code**.

Para a maioria dos computadores Windows atuais, escolha:

```text
Windows
User Installer
x64
```

Execute o instalador.

Durante a instalação, é recomendado permitir que o VS Code seja adicionado ao PATH.

Depois finalize normalmente a instalação.

---

# 🟪 3. Instalar o MSYS2

Acesse o site oficial do:

```text
MSYS2
```

Baixe o instalador para Windows.

O arquivo terá um nome semelhante a:

```text
msys2-x86_64-latest.exe
```

Execute o instalador.

É recomendado manter o diretório padrão:

```text
C:\msys64
```

Depois conclua a instalação.

---

# 🟨 4. Abrir o terminal correto

Este passo é MUITO importante.

Depois de instalar o MSYS2, procure no Menu Iniciar por:

```text
MSYS2 UCRT64
```

Abra:

```text
MSYS2 UCRT64
```

Não utilize o PowerShell para esta primeira configuração.

O terminal deverá apresentar algo parecido com:

```text
Fabricio@DESKTOP UCRT64 ~
$
```

O importante é aparecer:

```text
UCRT64
```

---

# 🔄 5. Atualizar o MSYS2

No terminal UCRT64 execute:

```bash
pacman -Syu
```

O MSYS2 poderá perguntar:

```text
Proceed with installation? [Y/n]
```

Digite:

```text
Y
```

e pressione ENTER.

Se durante a atualização o MSYS2 pedir para fechar o terminal, feche.

Depois abra novamente:

```text
MSYS2 UCRT64
```

e execute novamente:

```bash
pacman -Syu
```

até finalizar todas as atualizações.

---

# 🟩 6. Instalar o GnuCOBOL

Agora instale o GnuCOBOL específico para o ambiente UCRT64.

Execute:

```bash
pacman -S mingw-w64-ucrt-x86_64-gnucobol
```

Quando aparecer:

```text
Proceed with installation? [Y/n]
```

Digite:

```text
Y
```

Pressione ENTER e aguarde.

---

# ✅ 7. Verificar se o GnuCOBOL foi instalado

Execute:

```bash
cobc --version
```

Um resultado semelhante a este deverá aparecer:

```text
cobc (GnuCOBOL) 3.2.0
```

Isso significa que o compilador está instalado.

---

# 🔎 8. Verificar o arquivo de configuração

Também podemos verificar se o arquivo principal de configuração do GnuCOBOL foi instalado.

Execute:

```bash
ls /ucrt64/share/gnucobol/config/default.conf
```

O resultado deverá ser semelhante a:

```text
/ucrt64/share/gnucobol/config/default.conf
```

Se aparecer:

```text
No such file or directory
```

reinstale o GnuCOBOL:

```bash
pacman -S mingw-w64-ucrt-x86_64-gnucobol
```

Depois teste novamente:

```bash
ls /ucrt64/share/gnucobol/config/default.conf
```

---

# 📁 9. Criar uma pasta para os programas COBOL

No Windows, crie uma pasta.

Exemplo:

```text
C:\Users\SEU-USUARIO\Desktop\COBOL
```

No meu caso:

```text
C:\Users\Fabricio\Desktop\COBOL
```

Dentro dela ficarão nossos arquivos:

```text
COBOL
│
├── Helloworld.cbl
├── IMC.cbl
├── Funcionario.cbl
└── outros programas...
```

---

# 📂 10. Acessar a pasta pelo MSYS2 UCRT64

No terminal UCRT64, uma pasta do Windows como:

```text
C:\Users\Fabricio\Desktop\COBOL
```

é acessada utilizando:

```bash
cd /c/Users/Fabricio/Desktop/COBOL
```

Troque:

```text
Fabricio
```

pelo nome do seu usuário do Windows.

Depois execute:

```bash
ls
```

Os arquivos da pasta serão mostrados.

---

# 👨‍💻 11. Criar o primeiro programa COBOL

Abra o VS Code.

Abra a pasta:

```text
COBOL
```

Crie um arquivo chamado:

```text
Helloworld.cbl
```

Coloque:

```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. HELLOWORLD.

       PROCEDURE DIVISION.
           DISPLAY "Hello WORLD!".
           STOP RUN.
```

Salve com:

```text
Ctrl + S
```

---

# ⚙️ 12. Compilar o primeiro programa

Volte para o terminal UCRT64.

Entre na pasta do projeto:

```bash
cd /c/Users/Fabricio/Desktop/COBOL
```

Confira os arquivos:

```bash
ls
```

Agora compile:

```bash
cobc -x Helloworld.cbl
```

Se não aparecer nenhum erro, a compilação funcionou.

Execute novamente:

```bash
ls
```

Agora deverá existir:

```text
Helloworld.cbl
Helloworld.exe
```

---

# ▶️ 13. Executar o programa

Execute:

```bash
./Helloworld.exe
```

Resultado esperado:

```text
Hello WORLD!
```

🎉 Pronto!

Seu primeiro programa COBOL foi compilado e executado.

---

# ⚠️ Atenção ao nome dos arquivos

O nome deve ser digitado corretamente.

Se existe:

```text
Helloworld.cbl
```

não execute:

```bash
cobc -x Helloword.cbl
```

Observe que está faltando uma letra:

```text
Helloword
HelloWorld
```

O mesmo acontece com o `.exe`.

Correto:

```bash
./Helloworld.exe
```

Errado:

```bash
./Helloword.exe
```

Se receber:

```text
No such file or directory
```

execute:

```bash
ls
```

e confira o nome verdadeiro do arquivo.

---

# 🖥️ 14. Configurar o UCRT64 dentro do VS Code

Agora vamos fazer o próprio terminal do VS Code utilizar o MSYS2 UCRT64.

Abra o VS Code.

Pressione:

```text
Ctrl + Shift + P
```

Procure:

```text
Preferences: Open User Settings (JSON)
```

Abra o arquivo.

Adicione:

```json
{
    "terminal.integrated.profiles.windows": {
        "MSYS2 UCRT64": {
            "path": "C:\\msys64\\usr\\bin\\bash.exe",
            "args": [
                "--login",
                "-i"
            ],
            "env": {
                "MSYSTEM": "UCRT64",
                "CHERE_INVOKING": "1"
            }
        }
    },

    "terminal.integrated.defaultProfile.windows": "MSYS2 UCRT64"
}
```

Salve:

```text
Ctrl + S
```

Feche o terminal antigo do VS Code.

Depois abra:

```text
Terminal
→ New Terminal
```

O terminal deverá apresentar:

```text
UCRT64
```

---

# 🧪 15. Testar o GnuCOBOL dentro do VS Code

Agora faça o teste diretamente no terminal do VS Code:

```bash
cobc --version
```

O resultado deverá apresentar:

```text
cobc (GnuCOBOL) 3.2.0
```

Isso confirma que:

```text
VS Code
   ↓
MSYS2
   ↓
UCRT64
   ↓
GnuCOBOL
```

estão se comunicando corretamente.

---

# 🧪 16. Compilar diretamente pelo VS Code

Dentro do terminal integrado do VS Code execute:

```bash
cobc -x Helloworld.cbl
```

Depois:

```bash
./Helloworld.exe
```

Resultado:

```text
Hello WORLD!
```

Agora não é mais necessário abrir o MSYS2 separadamente.

---

# 🎨 17. Instalar o tema Dracula

No VS Code pressione:

```text
Ctrl + Shift + X
```

Isso abrirá:

```text
Extensions
```

Pesquise:

```text
Dracula Official
```

Instale o tema oficial para Visual Studio Code.

Depois pressione:

```text
Ctrl + Shift + P
```

Pesquise:

```text
Preferences: Color Theme
```

Escolha:

```text
Dracula
```

---

# 🎨 18. Colocar Dracula diretamente no settings.json

Também podemos configurar o tema pelo arquivo JSON.

O arquivo completo poderá ficar assim:

```json
{
    "terminal.integrated.profiles.windows": {
        "MSYS2 UCRT64": {
            "path": "C:\\msys64\\usr\\bin\\bash.exe",
            "args": [
                "--login",
                "-i"
            ],
            "env": {
                "MSYSTEM": "UCRT64",
                "CHERE_INVOKING": "1"
            }
        }
    },

    "terminal.integrated.defaultProfile.windows": "MSYS2 UCRT64",

    "workbench.colorTheme": "Dracula"
}
```

Salve:

```text
Ctrl + S
```

---

# 🌈 19. Fazer o VS Code reconhecer arquivos COBOL

Abra:

```text
Extensions
```

utilizando:

```text
Ctrl + Shift + X
```

Pesquise:

```text
COBOL
```

Instale uma extensão de suporte à linguagem COBOL.

Depois abra:

```text
Helloworld.cbl
```

O VS Code deverá reconhecer o arquivo como COBOL em vez de:

```text
Plain Text
```

Caso ainda apareça:

```text
Plain Text
```

clique nessa opção no canto inferior direito do VS Code.

Pesquise:

```text
COBOL
```

e selecione a linguagem.

---

# ✅ 20. Teste completo da instalação

Execute estes comandos no terminal integrado do VS Code.

### Verificar o ambiente

```bash
echo $MSYSTEM
```

Resultado esperado:

```text
UCRT64
```

### Verificar o compilador

```bash
cobc --version
```

Deve apresentar informações do GnuCOBOL.

### Verificar os arquivos

```bash
ls
```

### Compilar

```bash
cobc -x Helloworld.cbl
```

### Executar

```bash
./Helloworld.exe
```

Resultado:

```text
Hello WORLD!
```

Se todos esses passos funcionarem, o ambiente está pronto.

---

# 🛠️ 21. Comandos importantes

### Ver versão do COBOL

```bash
cobc --version
```

### Mostrar arquivos da pasta

```bash
ls
```

### Entrar em uma pasta

```bash
cd /c/Users/SEU-USUARIO/Desktop/COBOL
```

### Compilar programa

```bash
cobc -x programa.cbl
```

### Executar programa

```bash
./programa.exe
```

### Atualizar MSYS2

```bash
pacman -Syu
```

### Instalar/reinstalar GnuCOBOL

```bash
pacman -S mingw-w64-ucrt-x86_64-gnucobol
```

### Limpar terminal

```bash
clear
```

---

# 🚨 22. Problemas comuns

## `cobc: command not found`

Provavelmente você está no terminal errado.

Verifique se aparece:

```text
UCRT64
```

Teste:

```bash
echo $MSYSTEM
```

Resultado esperado:

```text
UCRT64
```

---

## `cobc` não funciona no PowerShell

Isso pode acontecer porque o GnuCOBOL foi instalado dentro do ambiente MSYS2.

Neste guia não precisamos utilizar o PowerShell para compilar.

Utilizamos:

```text
MSYS2 UCRT64
```

ou o terminal:

```text
MSYS2 UCRT64
```

configurado dentro do VS Code.

---

## `default.conf: No such file or directory`

Exemplo:

```text
configuration error:
default.conf: No such file or directory
```

Reinstale:

```bash
pacman -S mingw-w64-ucrt-x86_64-gnucobol
```

Depois verifique:

```bash
ls /ucrt64/share/gnucobol/config/default.conf
```

---

## `No such file or directory`

Confira primeiro:

```bash
ls
```

O erro muitas vezes acontece simplesmente porque o nome foi digitado errado.

Por exemplo:

```text
Helloworld.exe
```

é diferente de:

```text
Helloword.exe
```

---

## `command not found` ao executar o `.exe`

Não utilize apenas:

```bash
Helloworld.exe
```

Utilize:

```bash
./Helloworld.exe
```

O:

```text
./
```

indica que queremos executar um programa localizado na pasta atual.

---

# 📋 23. Checklist final

Antes de começar a estudar COBOL, confira:

* [ ] Visual Studio Code instalado
* [ ] MSYS2 instalado
* [ ] Terminal UCRT64 funcionando
* [ ] MSYS2 atualizado
* [ ] GnuCOBOL instalado
* [ ] `cobc --version` funcionando
* [ ] Pasta COBOL criada
* [ ] Arquivo `.cbl` criado
* [ ] Programa compilando
* [ ] Arquivo `.exe` sendo criado
* [ ] Programa executando
* [ ] UCRT64 configurado no VS Code
* [ ] Terminal integrado reconhecendo `cobc`
* [ ] Tema Dracula instalado
* [ ] VS Code reconhecendo arquivos COBOL

---

# 🏁 Estrutura final

Depois de tudo configurado, teremos:

```text
Windows
│
├── Visual Studio Code
│   │
│   ├── Tema Dracula
│   ├── Suporte COBOL
│   │
│   └── Terminal MSYS2 UCRT64
│
├── MSYS2
│   │
│   └── UCRT64
│       │
│       └── GnuCOBOL
│
└── Projetos
    │
    └── COBOL
        │
        ├── Helloworld.cbl
        ├── Helloworld.exe
        ├── IMC.cbl
        ├── Funcionario.cbl
        └── outros programas
```

---

# 🎯 Fluxo de trabalho diário

Depois que tudo estiver instalado, você NÃO precisa repetir toda a instalação.

No dia a dia basta:

### 1. Abrir o VS Code

### 2. Abrir sua pasta COBOL

### 3. Criar ou editar:

```text
Programa.cbl
```

### 4. Abrir o terminal

```text
Ctrl + `
```

### 5. Compilar

```bash
cobc -x Programa.cbl
```

### 6. Executar

```bash
./Programa.exe
```

Pronto.

---

# 📖 Exemplo

Arquivo:

```text
MeuPrograma.cbl
```

Código:

```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. MEU-PROGRAMA.

       PROCEDURE DIVISION.
           DISPLAY "MEU AMBIENTE COBOL ESTA FUNCIONANDO!".
           STOP RUN.
```

Compilar:

```bash
cobc -x MeuPrograma.cbl
```

Executar:

```bash
./MeuPrograma.exe
```

Resultado:

```text
MEU AMBIENTE COBOL ESTA FUNCIONANDO!
```

---

# 📌 Tecnologias utilizadas

| Tecnologia | Utilização                                |
| ---------- | ----------------------------------------- |
| COBOL      | Linguagem de programação                  |
| GnuCOBOL   | Compilador                                |
| MSYS2      | Ambiente de desenvolvimento no Windows    |
| UCRT64     | Ambiente utilizado pelo MSYS2             |
| VS Code    | Editor de código                          |
| Dracula    | Tema visual                               |
| Git        | Versionamento                             |
| GitHub     | Armazenamento e documentação dos projetos |

---

# 🎓 Objetivo

Este repositório pode ser utilizado para acompanhar a evolução dos estudos em COBOL, desde os primeiros programas até aplicações mais avançadas.

A proposta é manter exemplos simples, comentados e organizados para que outros estudantes também consigam configurar o ambiente e começar a programar em COBOL no Windows.

---

## 🚀 Ambiente pronto!

Se:

```bash
cobc --version
```

funciona,

e:

```bash
cobc -x Helloworld.cbl
./Helloworld.exe
```

retorna:

```text
Hello WORLD!
```

então o ambiente está configurado corretamente.

**Bons estudos de COBOL!**
