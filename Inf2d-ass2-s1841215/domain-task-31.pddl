(define (domain waiting)
    (:requirements :adl )
    
    (:types
        waiter
        location
        plate
        customer
        broom
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
        (Holding ?a - waiter ?o - object)
        (HasFood ?p - plate)
        (BrokenPlate ?l - location)
        (DroppedFood ?l - location)
    )
    
    ;;;; Action Template - Delete and fill in own actions ;;;;
    
    (:action PICK-UP
        :parameters (?a - waiter ?o - object ?l - location)
        :precondition (and
            (At ?a ?l)
            (At ?o ?l)
            (not (exists (?x - object) (holding ?a ?x)))
        )
        :effect (and
            (Holding ?a ?o)
            (not (At ?o ?l))
        )
    )

    (:action HAND-OVER
        :parameters (?a - waiter ?p - plate ?l - location ?c - customer)
        :precondition (and
            (not (Served ?c))
            (At ?a ?l)
            (At ?c ?l)
            (not (At ?p ?l))
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
            (not (BrokenPlate ?d))
        )
        :effect (and
            (At ?a ?d)
            (not (At ?a ?l))
        )
    )
        
    (:action SWEEPING
        :parameters (?a - waiter ?lx - location ?ly - location ?b - broom)
        :precondition (and
            (Holding ?a ?b)
            (not (= ?lx ?ly))
            (Adjacent ?lx ?ly)
            (At ?a ?lx)
                (or
                    (BrokenPlate ?ly)
                    (DroppedFood ?ly)
                )
        )
        :effect (and
        (not (BrokenPlate ?ly))
        (not (DroppedFood ?ly))
        )
    )

    (:action PUT-DOWN
        :parameters (?a - waiter ?o - object ?l - location)
        :precondition (and
            (At ?a ?l)
            (Holding ?a ?o)
        )
        :effect (and
            (At ?o ?l)
            (not (Holding ?a ?o))
        )
    )
)