(define (assert expr)
  (if expr #t
    (exit)))

(let ((a (cons 1 2))
      (b (cons 2 3))
      (c (cons 1 2)))
  (begin
    (assert (eq? (eq? a b) #f))
    (assert (eq? (eq? a c) #f))
    (assert (eq? a a))
    (assert (eq? (eq? a (cons 1 2)) #f))))
