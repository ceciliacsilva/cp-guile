(load "../syntax.scm")

;;scheme@(guile-user)> (load "robot/robo.scm")
;;scheme@(guile-user)> (iCinematica 6 15 15)
;;Probe: X = 6
;;Probe: Y = 15
;;Probe: Z = 15
;;Probe: Teta3 = 107.30155732432964
;;Probe: Teta2 = 88.95537939851134
;;Probe: Teta1 = -47.08502287932315
;;$18 = ok
;;scheme@(guile-user)> (iCinematica -6 15 15)
;;Probe: X = 6
;;Probe: Y = 15
;;Probe: Z = 15
;;Probe: Teta3 = 107.30155732432964
;;Probe: Teta2 = 88.95537939851134
;;Probe: Teta1 = -3.4822038888097353
;;$19 = ok
;;scheme@(guile-user)> (iCinematica -10 10 10)
;;Probe: X = 10
;;Probe: Y = 10
;;Probe: Z = 10
;;Probe: Teta1 = 15.797110634789178
;;Probe: Teta3 = 127.00402299819385
;;Probe: Teta2 = 85.78601787420045
;;$20 = ok
(define (iCinematica x-val y-val z-val)
  (let ((d1 (cv 9.00))
        (l1 (cv 10.55))
        (l2 (cv 14.45))
        (a1 (cv 4.00))
        (a2 (cv 2.90))
        (ly (cv 0.70)))
      (cond ((<= x-val (- (get-value (+v a1 a2))))
             (iCinematicaN (- x-val) y-val z-val d1 l1 l2 a1 a2 ly))
            ((< x-val 0)
             (iCinematicaN2 (- x-val) y-val z-val d1 l1 l2 a1 a2 ly))
            (else
             (iCinematicaP x-val y-val z-val d1 l1 l2 a1 a2 ly))
            ) ))

(define (iCinematicaN x-val y-val z-val d1 l1 l2 a1 a2 ly)
  (let ((teta1 (make-connector))
        (teta2 (make-connector))
        (teta3 (make-connector))
        (x     (make-connector))
        (y     (make-connector))
        (z1    (make-connector)))
    (probe "Teta1" teta1)
    (probe "Teta2" teta2)
    (probe "Teta3" teta3)
    (probe "X" x)
    (probe "Y" y)
    (probe "Z" z1)
    ((x  'set-value!) x-val 'user)
    ((y  'set-value!) y-val 'user)
    ((z1 'set-value!) z-val 'user)
    (let ((h      (make-connector))
          (z      (make-connector))
          (d      (make-connector))
          (beta   (make-connector))
          (alfa1  (make-connector))
          (teta   (make-connector))
          (r2     (make-connector))
          (r1     (make-connector))
          (r      (make-connector))
          (a      (make-connector))
          (t      (make-connector))
          (lado   (make-connector))
          (beta1  (make-connector)))
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
      'ok)) )

(define (iCinematicaN2 x-val y-val z-val d1 l1 l2 a1 a2 ly)
  (let ((teta11 (make-connector))
        (teta2 (make-connector))
        (teta3 (make-connector))
        (x     (make-connector))
        (y     (make-connector))
        (z1    (make-connector)))
    (probe "Teta1" teta11)
    (probe "Teta2" teta2)
    (probe "Teta3" teta3)
    (probe "X" x)
    (probe "Y" y)
    (probe "Z" z1)
    ((x  'set-value!) x-val 'user)
    ((y  'set-value!) y-val 'user)
    ((z1 'set-value!) z-val 'user)
    (let ((h      (make-connector))
          (z      (make-connector))
          (d      (make-connector))
          (teta1  (make-connector))
          (beta   (make-connector))
          (alfa1  (make-connector))
          (teta   (make-connector))
          (r2     (make-connector))
          (r1     (make-connector))
          (r      (make-connector))
          (a      (make-connector))
          (t      (make-connector))
          (lado   (make-connector))
          (beta1  (make-connector)))
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
      (=v (+v teta alfa1) beta)
      (=v teta1 teta)
      (=v (sqrv r2) (+v (sqrv z) (sqrv r)))
      (=v (sqrv r2) (-v (+v (sqrv l1) (sqrv l2))
                        (*v (cv 2) (*v l1
                                       (*v l2 (cosv a))))))
      (=v (sinv t) (/v z r2))
      (=v lado (+v l1 (*v l2 (cosv teta3))))
      (=v (tanv beta1) (/v (*v l2 (sinv teta3)) lado))
      (=v teta2 (+v beta1 t))
      (=v teta1 (-v (cv 0) teta11))
      'ok)) )

(define (iCinematicaP x-val y-val z-val d1 l1 l2 a1 a2 ly)
  (let ((teta11 (make-connector))
        (teta2  (make-connector))
        (teta3  (make-connector))
        (x      (make-connector))
        (y      (make-connector))
        (z1     (make-connector)))
    (probe "Teta1" teta11)
    (probe "Teta2" teta2)
    (probe "Teta3" teta3)
    (probe "X" x)
    (probe "Y" y)
    (probe "Z" z1)
    ((x  'set-value!) x-val 'user)
    ((y  'set-value!) y-val 'user)
    ((z1 'set-value!) z-val 'user)
    (let ((h      (make-connector))
          (z      (make-connector))
          (d      (make-connector))
          (teta1  (make-connector))
          (beta   (make-connector))
          (alfa1  (make-connector))
          (teta   (make-connector))
          (r2     (make-connector))
          (r1     (make-connector))
          (r      (make-connector))
          (a      (make-connector))
          (t      (make-connector))
          (lado   (make-connector))
          (beta1  (make-connector)))
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
      (=v (+v (+v teta alfa1) beta) (cv 180))
      (=v teta1 teta)
      (=v (sqrv r2) (+v (sqrv z) (sqrv r)))
      (=v (sqrv r2) (-v (+v (sqrv l1) (sqrv l2))
                        (*v (cv 2) (*v l1
                                       (*v l2 (cosv a))))))
      (=v (sinv t) (/v z r2))
      (=v lado (+v l1 (*v l2 (cosv teta3))))
      (=v (tanv beta1) (/v (*v l2 (sinv teta3)) lado))
      (=v teta2 (+v beta1 t))
      (=v teta1 (-v (cv 0) teta11))
      'ok)) )
