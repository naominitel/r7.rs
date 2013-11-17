(define (assert expr)
  (if expr #t
    (exit)))

(assert #f)
