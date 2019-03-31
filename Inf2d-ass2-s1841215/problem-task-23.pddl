(define (problem waiting-XX) ;; Replace XX with task number
    (:domain waiting)
    (:objects    
    UB - location
    UF - location    
    MB - location
    MF - location
    LB - location
    LF - location
    
    C1 - customer
    C2 - customer
    P1 - plate
    P2 - plate
    )
    
    (:init
        (At Agent MF)
        (At C1 UB)
        (At C2 LF)
        (At P1 MB)
        (At P2 LB)

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
        (Served C1)
        (Served C2)
    ))
)

