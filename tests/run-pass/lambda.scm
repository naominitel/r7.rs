(define f
  (let ((a 3))
    (lambda (x)
      (+ x a))))

(assert (eq? 5 (f 2)))
