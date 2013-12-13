(assert (equal? 
          (map (lambda (x) (* 2 x)) (list 1 2 3 4))
          (list 2 4 6 8)))

(assert (equal?
          (map list (list 1 2 3 4))
          (list (list 1) (list 2) (list 3) (list 4))))
