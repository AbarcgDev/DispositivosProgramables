;Sumador de 3 bits con entrada en PORTA y SALIDA LATA
    
    #include<configWords.inc>
    
    #DEFINE	    DATOA_MASK	B'01110000'
    #DEFINE	    DATOB_MASK	B'00000111'
    
    CBLOCK  .0
    DATOA
    DATOB
    RSUMA
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
    
GETDATOA
    MOVF    PORTA,W
    ANDLW   DATOA_MASK
    SWAPF   WREG
    MOVFF   WREG,DATOA
    
GETDATOB
    MOVF PORTA,W
    ANDLW   DATOB_MASK
    MOVFF   WREG,DATOB
    
SUMA
    MOVF    DATOA,W
    ADDWF   DATOB,W
    MOVFF   WREG,RSUMA
    
OUTPUT
    MOVFF   RSUMA,LATB
    
FINISH
    GOTO    MAIN
    END


