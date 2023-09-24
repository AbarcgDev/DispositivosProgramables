;Programa   que muestra las operaciones posibles entre WREG y una literal k
    LIST    P=18F4550
    #include <p18f4550.inc>
    
    ORG	0x0
    MOVLW	    0x00	;WREG = 0
    
MAIN
;Suma
    MOVLW	    0x07	;WREG = 7
    ADDLW	    0x09	;WREG = 9 + 7 = 16
;Resta
    MOVLW	    0x07	;WREG = 7
    SUBLW	    0x09	;WREG = 9 - 7 = 2
;And
    MOVLW	    B'00101100'
    ANDLW	    B'10010011'	;WREG = 00000000
;Inclusive OR
    MOVLW	    B'00101100'
    IORLW	    B'10010011'	;WREG = 11111111
;Multiplicacion
    MOVLW	    0x07	;WREG = 7
    MULLW	    0x02	;WREG = 7 *2 = 14
;Exclusive OR
    MOVLW	    B'00101100'
    XORLW	    B'10011111'	;WREG = 111110011
					
    
    GOTO	    MAIN
    
    END
    
    
    
    


