(define (problem problema2) 
    (:domain banana)
    (:objects 
    pos1 pos2 pos3 - posicion
    mono - mono
    caja - caja
    banana - banana
    )

    (:init
        (lado pos1  pos2)
        (lado pos2  pos3)
        (lado pos3  pos2)
        (lado pos2  pos1)
        (enc  caja pos1)
        (en   mono  pos1)
        (sobre-caja mono)
        (enb banana pos3)
    )

    (:goal (and
        (tomar-banana mono)
    ))

  
)

