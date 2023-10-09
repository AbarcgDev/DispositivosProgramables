;Programa que envia la entrada de PORTA directo hacia LATB para probar conexiones

#include <configWords.inc>
    ORG	.0
    
SETTINGS
    CLRF    WREG
;Configurar PORTA como entradas
    CLRF    PORTA
    MOVLW   B'11111111'
    MOVWF   TRISA

;Establecer entradas digitales puertos A,B y E
    MOVLW   .15
    MOVWF   ADCON1
    
;Apagar comparador de voltaje
    MOVLW   .7
    MOVWF   CMCON
    
;Configurar salidas en LATB
    CLRF    LATB 
    CLRF    TRISB
    
MAIN
    
    MOVFF   PORTA,LATB

FINISH
    GOTO    MAIN
    END
    
    
    
    
   

