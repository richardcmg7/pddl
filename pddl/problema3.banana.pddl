(define (problem problema3) 
    (:domain banana)
    
    (:objects 
    pos1 pos2 pos3 - posicion
    mono - mono
    caja1 caja2 - caja
    banana - banana
    )

    (:init
        (lado pos1  pos2)
        (lado pos2  pos3)
        (lado pos3  pos2)
        (lado pos2  pos1)
        (enc  caja1 pos1)
        (ocupado pos1 )
        (en   mono  pos1)
        (sobre-caja mono)
        (enc  caja2  pos2)
        (ocupado pos2 )
        (enb banana pos3)
    )

    (:goal (and
        (enc caja1 pos2)
        (tomar-banana mono)
    ))

  
)

