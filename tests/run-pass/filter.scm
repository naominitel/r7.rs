(define l (list 1 2 3 4 2))

(let ((assert-eq (lambda (x y) (assert (equal? x y)))))
  (begin
    (assert-eq (filter (lambda (x) #f) l) (list))
    (assert-eq (filter (lambda (x) #t) l) l)
    (assert-eq (filter (lambda (x) 0) l) l)
    (assert-eq (filter (lambda (x) 1) l) l)
    (assert-eq (filter (lambda (x) (= x 2)) l) (list 2 2))))
