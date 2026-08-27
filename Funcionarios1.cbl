       IDENTIFICATION DIVISION. 
           PROGRAM-ID. ContagemFuncionario.
           AUTHOR. Fabricio Ferreira.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT FUNCIONARIOS ASSIGN TO "FUNCIONARIO".

       DATA DIVISION.
       FILE SECTITON.
       FD FUNCIONARIOS.
       01 DETALHEFUNCIONARIO.
           88 FINALREGISTRO VALEU HIGH-VALUES.
           05 MATRICULA-FUNCIONARIO  PIC 9(5).
           05 NOME-FUNCIONARIO.
                10 PRIMEIRO-NOME     PIC X(20).
                10 ULTIMO-NOME       PIC X(20).
           05 GENERO                 PIC X(1).

       WORKING-STORAGE SECTION.
       01 CONTADORES.
           05 TOTAL-HOMENS           PIC 9(3) VALUE.
           05 TOTAL-MULHERES         PIC 9(3) VALUE.

       01 LEITURA-FINALIZADA         PIC X VALUE "N".
       
       PROCEDURE DIVISION.
       INICIO.
           DISPLAY "========================="
           DISPLAY "Contagem de Funcionários "
           DISPLAY "=========================" 
      
      *Abrir arquivo
           OPEN INPUT FUNCIONARIO.

      *Processamento dos registros arquivos
           PERFORM UNTIL LEITURA-FINALIZADA = "S"
                READ FUNCIONARIOS INTO DETALHEFUNCIONARIO
                   AT END
                      MOVE "S" TO LEITURA-FINALIZADA
                   NOT AT END 
                       INSPECT PRIMEIRO-NOME REPLACING ALL " "BY LOW-VALUES
                       INSPECT ULTIMO-NOME REPLACING ALL " "BY LOW-VALUES
                       DISPLAY MATRICULA-FUNCIONARIO " " GENERO " "
                            PRIMEIRO-NOME " " ULTIMO-NOME
                       IF GENERO = "M"
                           ADD 1 TO TOTAL-HOMENS
                       ELSE
                           IF GENERO = "F"
                                ADD 1 TO TOTAL-MULHERES
                           END-IF     
                       END-IF             
                END READ
           END-PERFORM.

      * Fechar arquivos
           CLOSE FUNCIONARIOS.

      *Exibir Arquivos
       DISPLAY "=============================".
       DISPLAY "Resumo".
       DISPLAY "Total Homens..: " TOTAL-HOMENS.
       DISPLAY "Total Mulheres..: " TOTAL-MULHERES.
       DISPLAY "=============================".

       STOP RUN 
       
       


              