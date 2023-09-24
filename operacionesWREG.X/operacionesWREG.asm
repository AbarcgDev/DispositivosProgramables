;Programa que muestra las operaciones que se pueden realizar con WREG en el pic18f4550
    LIST    P=18f4550
    #include<p18f4550.inc>
    
    ORG	0x00
    
    MOVLW   0x00
    
MAIN	;Suma
	MOVLW	0x07
	ADDLW	0x09
	;Resta
	MOVWL	0x07



