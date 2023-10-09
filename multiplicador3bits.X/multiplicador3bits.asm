;Multiplicador de 3 bits con entrada en PORTA y SALIDA LATA
    
    #include<configWords.inc>
    
    #DEFINE	    DATOA_MASK	B'01110000'
    #DEFINE	    DATOB_MASK	B'00000111'
    
    CBLOCK  .0
    DATOA
    DATOB
    RMUL
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
    SWAPF   WREG,W
    MOVFF   WREG,DATOA
    
GETDATOB
    MOVF PORTA,W
    ANDLW   DATOB_MASK
    MOVFF   WREG,DATOB
    
MUL
    MOVF    DATOA,W
    MULWF   DATOB

GETRESULT
    MOVFF   PRODL,RMUL ;Mueve el LSB del producto a RMUL
    SWAPF	 PRODH,F    ;Intercambia nibbles en MSB del producto
    MOVF	PRODH,W	
    IORWF   RMUL,F	;La compuerta IOR fusiona los bits y obtiene el resultado en 8 bits
    
OUTPUT
    MOVFF   RMUL,LATB
    
FINISH
    GOTO    MAIN
    END





