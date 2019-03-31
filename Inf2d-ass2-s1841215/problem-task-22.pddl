(define (problem waiting-22) ;; Replace XX with task number
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
    )
    
    (:init
        (At Agent BUFF)
        (At P BUFF)
        (At C LB)

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
        (Served C)
    ))
)
