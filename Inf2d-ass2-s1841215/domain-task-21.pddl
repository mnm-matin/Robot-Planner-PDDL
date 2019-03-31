(define (domain waiting)
    (:requirements :adl )
    
    (:types
        waiter
        location
        plate
        customer
    )
    
    (:constants 
        ;; You should not need to add any additional constants
        Agent - waiter
        BUFF - location
    )
    
    (:predicates
        ;; Example:
        ;; (Contains ?x - object ?c - container)
        (Adjacent ?x - location ?y - location)
        (At ?a - object ?b - location)
        (Served ?c - customer)
        (Holding ?a - waiter ?p - plate)
        (HasFood ?p - plate)
    )
    
    ;;;; Action Template - Delete and fill in own actions ;;;;
    
    (:action PICK-UP
        :parameters (?a - waiter ?p - plate ?l - location)
        :precondition (and
            (At ?a ?l)
            (At ?p ?l)
            (not (Holding ?a ?p))
        )
        :effect (and
            (Holding ?a ?p)
            (not (At ?p ?l))
        )
    )

    (:action HAND-OVER
        :parameters (?a - waiter ?p - plate ?l - location ?c - customer)
        :precondition (and
            (At ?a ?l)
            (At ?c ?l)            
            (HasFood ?p)
            (Holding ?a ?p)
        )
        :effect (and            
            (Served ?c)
            (not (Holding ?a ?p))
        )
    )

    (:action FILL
        :parameters (?a - waiter ?p - plate)
        :precondition (and
            (not (HasFood ?p))
            (At ?a BUFF)
            (Holding ?a ?p)
        )
        :effect (and
            (HasFood ?p)
        )
    )

    (:action MOVE
        :parameters (?a - waiter ?l - location ?d - location)
        :precondition (and            
            (At ?a ?l)
            (Adjacent ?l ?d)
            (not (= ?l ?d))
        )
        :effect (and
            (At ?a ?d)
            (not (At ?a ?l))
        )
    )
)