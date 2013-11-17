(define (assert expr)
  (if expr #t
    (exit)))

(let ((p (cons 1 2)))
  (begin
    (assert (eq? (car p) 1))
    (assert (eq? (cdr p) 2))
    (set-car! p 2)
    (set-cdr! p 3)
    (assert (eq? (car p) 2))
    (assert (eq? (cdr p) 3))))
