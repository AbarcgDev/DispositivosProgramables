;Restadar de 3 bits, con entradas en PORTA y SALIDA en LATB
    
    #include<configWords.inc>
   
    #DEFINE	    MINUENDO_MASK	    B'01110000'
    #DEFINE	    SUSTRAENDO_MASK	    B'00000111'
    
    CBLOCK  .0
    MINUENDO
    SUSTRAENDO
    RSUB
    ENDC
    
    ORG	.0
    
SETTINGS
    CLRF    WREG
;Entradas en PORTA
    CLRF    PORTA
    MOVLW   B'11111111'
    MOVWF   TRISA;
;Entradas digitales A.B.E
    MOVLW   .15
    MOVWF   ADCON1
;Apagar comparador de voltaje
    MOVLW   .7
    MOVWF   CMCON
;Salidas LATB
    CLRF    LATB
    CLRF    TRISB
    
MAIN
    
GETMINUENDO
    MOVF    PORTA,W
    ANDLW  MINUENDO_MASK
    SWAPF   WREG
    MOVFF   WREG,MINUENDO
    
GETDATOB
    MOVF PORTA,W
    ANDLW   SUSTRAENDO_MASK
    MOVFF   WREG,SUSTRAENDO
    
RESTA
    MOVF    SUSTRAENDO,W
    SUBWF   MINUENDO,W
    MOVFF   WREG,RSUB
    
OUTPUT
    MOVFF   RSUB,LATB
    
FINISH
    GOTO    MAIN
    END


