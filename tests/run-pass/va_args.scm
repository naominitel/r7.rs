(define (f a . b)
  (cons (car b) a))

(let ((r (f 1 2 3 4 5)))
  (begin
    (assert (eq? (car r) 2))
    (assert (eq? (cdr r) 1))))
