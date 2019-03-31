(define (problem waiting-XX) ;; Replace XX with task number
    (:domain waiting)
    (:objects    
    UB - location
    UF - location    
    MB - location
    MF - location
    LB - location
    LF - location
    
    C - customer
    P - plate
    B - broom
    )
    
    (:init
        (At Agent BUFF)
        (At C LB)
        (At P BUFF)
        (At B UB)
        (BrokenPlate MF)
        (BrokenPlate MB)
        (DroppedFood UF)

        (Adjacent UF BUFF)
        (Adjacent UF UB)
        (Adjacent MB UB)
        (Adjacent UF MF)
        (Adjacent MF LF)
        (Adjacent LB MB)
        (Adjacent LB LF)
        
        (Adjacent BUFF UF)
        (Adjacent UB UF)
        (Adjacent UB MB)
        (Adjacent MF UF)
        (Adjacent LF MF)
        (Adjacent MB LB)
        (Adjacent LF LB)
    )
    
    (:goal (and        
        (At Agent BUFF) 
        (Served C)
        (not (exists (?l - location) (DroppedFood ?l)))
        (not (exists (?l - location) (BrokenPlate ?l)))
    ))
)

