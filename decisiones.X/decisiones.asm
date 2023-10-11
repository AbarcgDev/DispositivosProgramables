;Programa que utiliza la instrucciones orientadas a bit para leer un bit de entrada en RA6
; Porteriormente la instruccion de decision BTSFSC para apagar o encender un LED en RB5
; segun el estado del bit RA6
    
    #include<configWord.inc>
    
    #define	SWITCH	 PORTA,RB6
    #define	LED	 PORTB,RB5
    
    ORG	.0
    
INICIO
    CLRF    WREG
; Define el bit RA6 como entrada 
    BSF	TRISA,RA6
    BCF	PORTA,RA6
;Define elbit RB5 como salida
    BCF	TRISB,RB5
    BCF	LATB,RB5
;Define las como entrada digital los puertos A.B.E
   MOVLW    .15
   MOVWF    ADCON1
;Apaga comparador de voltaje
   MOVLW    .7
   MOVWF    CMCON
   
MAIN
   BTFSC    SWITCH  ;Verifica si el bit es 0
   GOTO	ON	;Si NO se cumple enciende el led
   GOTO	OFF         ;Si se cumple lo apaga
   
   
   
ON
   BSF	LED
   GOTO	MAIN
   
OFF
   BCF	LED
   GOTO	MAIN
   
FINISH
   END
    

