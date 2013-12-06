(define (fact x)
  (if (= x 0) 1
    (* x (fact (- x 1)))))

(assert (eq? (fact 5) 120))
