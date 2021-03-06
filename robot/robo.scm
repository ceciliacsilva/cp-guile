(load "../syntax.scm")

;;scheme@(guile-user)> (load "robot/robo.scm")
;;scheme@(guile-user)> (cinematica-inversa 'x 'set -10)
;;Probe: X = -10
;;$1 = done
;;scheme@(guile-user)> (cinematica-inversa 'y 'set 10)
;;Probe: Teta1 = 15.79711062303761
;;Probe: Y = 10
;;$2 = done
;;scheme@(guile-user)> (cinematica-inversa 'z 'set 10)
;;Probe: Teta2 = 85.78601787420045
;;Probe: Teta3 = 127.00402299819385
;;Probe: Z = 10
;;$3 = done

(define cinematica-inversa
  (let ((d1 (cv 9.00))
        (l1 (cv 10.55))
        (l2 (cv 14.45))
        (a1 (cv 4.00))
        (a2 (cv 2.90))
        (ly (cv 0.70)))
    (c-p '((teta1 "Teta1") (teta2 "Teta2") (teta3 "Teta3")
           (x "X") (y "Y") (z "Z"))
         (lambda(teta11 teta2 teta3 x y z1)
           (let ((h     (make-connector))
                 (teta1 (make-connector))
                 (z     (make-connector))
                 (d     (make-connector))
                 (beta  (make-connector))
                 (alfa1 (make-connector))
                 (teta  (make-connector))
                 (r2    (make-connector))
                 (r1    (make-connector))
                 (r     (make-connector))
                 (a     (make-connector))
                 (t     (make-connector))
                 (lado  (make-connector))
                 (beta1 (make-connector)))
             (<=v h (+v l1 l2))
             (<=v z (+v l1 (+v l2 d1)))
             (=v z (-v z1 d1))
             (=v teta3 (-v (cv 180) a))
             (=v d (+v a1 a2))
             (=v (sqrv h) (+v (sqrv y) (sqrv x)))
             (=v (sqrv h) (+v (sqrv d) (sqrv r1)))
             (=v r (-v r1 ly))
             (=v (tanv beta) (/v y x))
             (=v (tanv alfa1) (/v r1 d))
             (=v (+v teta beta) alfa1)
             (=v teta1 teta)
             (=v (sqrv r2) (+v (sqrv z) (sqrv r)))
             (=v (sqrv r2) (-v (+v (sqrv l1) (sqrv l2))
                               (*v (cv 2) (*v l1
                                              (*v l2 (cosv a))))))
             (=v (sinv t) (/v z r2))
             (=v lado (+v l1 (*v l2 (cosv teta3))))
             (=v (tanv beta1) (/v (*v l2 (sinv teta3)) lado))
             (=v teta2 (+v beta1 t))
             (=v teta11 (-v teta1 (cv 90))) )) ) ))

