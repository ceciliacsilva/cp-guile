(load "system.scm")

(define-syntax +v
  (syntax-rules ()
    ((+v a1 a2)
     (let ((resp (make-connector)))
       (adder a1 a2 resp)
       resp))))

(define-syntax *v
  (syntax-rules ()
    ((*v m1 m2)
     (let ((resp (make-connector)))
       (multiplier m1 m2 resp)
       resp))))

(define-syntax -v
  (syntax-rules ()
    ((-v s1 s2)
     (let ((resp (make-connector)))
       (subtractor s1 s2 resp)
       resp))))

(define-syntax /v
  (syntax-rules ()
    ((/v d1 d2)
     (let ((resp (make-connector)))
       (divider d1 d2 resp)
       resp))))

(define-syntax sinv
  (syntax-rules ()
    ((sinv ang)
     (let ((resp (make-connector)))
       (sine ang resp)
       resp))))

(define-syntax cosv
  (syntax-rules ()
    ((cosv ang)
     (let ((resp (make-connector)))
       (cosine ang resp)
       resp))))

(define-syntax tanv
  (syntax-rules ()
    ((tanv ang)
     (let ((resp (make-connector)))
       (tangent ang resp)
       resp))))

(define-syntax sqrtv
  (syntax-rules ()
    ((sqrtv num)
     (let ((resp (make-connector)))
       (square-root num resp)
       resp))))

(define-syntax sqrv
  (syntax-rules ()
    ((sqrv num)
     (let ((resp (make-connector)))
       (square num resp)
       resp))))

(define (cv num)
  (let ((resp (make-connector)))
    (constant num resp)
    resp))

(define-syntax =v
  (syntax-rules ()
    ((=v u v)
     (equal u v))))

(define-syntax <=v
  (syntax-rules ()
    ((<=v u v)
     (equal-less u v))))

(define-syntax >=v
  (syntax-rules ()
    ((>=v u v)
     (equal-more u v))))

(define-syntax name-value
  (syntax-rules ()
    ((name-value name lst)
     (let ((element (assoc name lst)))
       (if element
           (cadr element)
           (error "Unknown variable " name))))))

(define (print-probe name value)
  (cond ((not value) (set! value "?")))
  (display "Probe: ")
  (display name)
  (display " = ")
  (display value)
  (display "\n"))
  
(define (c-p input function)
  (let* ((variable
          (map (lambda (a)
                 (match a
                   ((var _)
                    (list var (make-connector))))) input))
         (connectors (map (lambda(a) (cadr a)) variable)))
    (map (lambda(a) (match a
                      ((name con)
                       (probe (name-value name input) con)))) variable)
    (apply function connectors)
    (lambda* (var flag #:optional (val 0))
      (cond ((or (eq? flag 'set-value!) (eq? flag 'set))
             (( (name-value var variable) 'set-value!) val 'user))
            ((or (eq? flag 'forget-value!) (eq? flag 'forget))
             (( (name-value var variable) 'forget) 'user))
            ((eq? flag 'print)
             (cond ((pair? var)
                    (map (lambda(a)
                           (let ((value (get-value (name-value a variable)) )
                                 (name  (name-value a input)))
                             (print-probe name value))) var ) )
                   ((symbol? var)
                    (let ((value ((name-value var variable) 'value))
                          (name   (name-value var input)))
                      (print-probe name value)) ))
             'ok))
      )
  ))
