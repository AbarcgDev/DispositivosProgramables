;Programa que realiza operaciones con registros y WREG, en los valores 
    
    #include <p18f4550.inc>
    ORG	.0
    
#DEFINE	VIDA	.17
#DEFINE	VIDB	.29
#DEFINE	DATOA       .19
#DEFINE	DATOB	.3

    CBLOCK	.50
	RSUMA
	RAND
	RCOMF
	RDEC
	RIOR
	RMULHI
	RMULLW
	RNEG
	RSET
	RSUB
	RXOR
	RSWAP
    ENDC
      
SETTINGS
    CLRF    WREG
    CLRF    DATOA
    CLRF    DATOB
    
MAIN
    MOVLW	    VIDA
    MOVWF	    DATOA
    MOVLW	    VIDB
    MOVWF	    DATOB
    
SUMA
    MOVF    DATOA,W
    
    ADDWF   DATOB,W
    MOVFF	  WREG,RSUMA
    
    INCF	  DATOB,F
    
AND
    MOVF    DATOA,W
    
    ANDWF   DATOB,W
    MOVFF   WREG,RAND
    
    INCF DATOB,F
    
COMPLEMENT 
    MOVF    DATOA,W
    COMF    WREG
    MOVFF   WREG,RCOMF
    
    INCF DATOB,F
    
DECREMENT
    DECF    DATOA,W
    MOVFF   WREG,RDEC
    
    INCF DATOB,F
    
INCLUSIVEOR
    MOVF	DATOA,W
   
    IORWF    DATOB,W
    MOVFF    WREG,RIOR
   
    INCF	DATOB,F
   
MULTIPLY
    MOVF	DATOA,W
   
    MULWF    DATOB
    MOVFF    PRODH,RMULHI
    MOVFF    PRODL,RMULLW
   
    INCF	DATOB,F
   
NEGATE  
    MOVF	DATOA,W
    NEGF    WREG    
    MOVFF    WREG,RNEG
   
    INCF	DATOB,F
   
SETFILE
    MOVF    DATOA,W
    SETF	WREG
    MOVFF    WREG,RSET
   
    INCF	DATOB,F
   
SUBNOBORROW
    MOVF	  DATOB,W
    SUBWF    DATOA,W
    MOVFF    WREG,RSUB
   
    INCF	DATOB,F
   
SWAP
    MOVF    DATOA,W
    SWAPF    WREG
    MOVFF    WREG,RSWAP
   
    INCF	DATOB,F
   
EXCLUSIVEOR
    MOVF	DATOA,W
   
    XORWF    DATOB,W
    MOVFF    WREG,RXOR
   
    INCF	    DATOB,F
   
FINISH
    GOTO    MAIN
    END


