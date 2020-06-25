
(define (domain banana)

    
    (:requirements :strips :typing :negative-preconditions )

    (:types 
        mono caja posicion banana
    )


    (:predicates ;Definimos los predicados 
        (enb ?b - banana ?p - posicion)
        (en ?m - mono ?p - posicion)
        (enc ?c - caja ?p - posicion)
        (sobre-caja ?m - mono)
        (tomar-banana ?m - mono)
        (lado ?p1 ?p2 - posicion)
        (ocupado ?o - posicion)
    )

    (:action mover ; me permite mover al mono de una posición a otra
        :parameters (?m - mono ?l1 ?l2 - posicion )
        :precondition (and (lado ?l1 ?l2) (en ?m ?l1) (not(sobre-caja ?m)) )
        :effect (and 
            (en ?m ?l2) (not (en ?m ?l1))

        )
    )
    (:action mover-caja ; la caja se mueve  de una posición a otra
                        ; si está en la misma posición que ella y no está sobre ella.
        :parameters (?m - mono ?c - caja ?l1 - posicion ?l2 - posicion) 
        :precondition (and (en ?m ?l1) (enc ?c ?l1) (lado ?l1 ?l2) (not(sobre-caja ?m)) (not(ocupado ?l2)))  
        :effect(and 
            (not (en ?m ?l1)) 
            (not (enc ?c ?l1))     
            (ocupado ?l2)
            (not(ocupado ?l1))
            (enc ?c ?l2) 
            (en ?m ?l2)
        )
    )

    (:action subir ; El mono se sube a la caja si está esta en la misma posición.
        :parameters (?m - mono ?c - caja ?l1 - posicion)
        :precondition (and 
            (en ?m ?l1) (enc ?c ?l1) (not( sobre-caja ?m))
        )
        :effect (and 
            (sobre-caja ?m) 
        )

    )
    (:action bajar ; El mono se baja de la caja manteniendo la misma posición.
        :parameters (?m - mono ?c - caja ?l1 - posicion)
        :precondition (and 
            (en ?m ?l1) (enc ?c ?l1) (sobre-caja ?m)
        )
        :effect (and 
            (not(sobre-caja ?m))
        )

    )
    (:action tomar ; Toma el platano si el mono esta sobre la caja y todos en la
                   ; misma posicion.
        :parameters (?m - mono ?b - banana ?c - caja ?l - posicion)
        :precondition (and 
            (en ?m ?l) (enc ?c ?l) (enb ?b ?l) (sobre-caja ?m)
        )
        :effect (and 
            (tomar-banana ?m)
        )
    )
)