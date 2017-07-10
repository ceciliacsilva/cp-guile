#lang racket

(require "robo.scm")
(require "dh.rkt")

(provide demo)

(define (demo x y z)
  (displayln "Cinematica Inversa")
  (cinematica-inversa 'x 'forget)
  (cinematica-inversa 'y 'forget)
  (cinematica-inversa 'z 'forget)
  
  (cinematica-inversa 'x 'set x)
  (cinematica-inversa 'y 'set y)
  (cinematica-inversa 'z 'set z)
  (let ( (teta1 (cinematica-inversa 'teta1 'value))
         (teta2 (cinematica-inversa 'teta2 'value))
         (teta3 (cinematica-inversa 'teta3 'value)) )
    (displayln "\n==============\n")
    (displayln "Cinematica Direta")
    (cinematica-direta teta1 teta2 teta3)
    ;;send tetas
    ) )