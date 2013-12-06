(assert (eq? + +))
(assert (eq? (eq? - +) #f))
(let ((a +) (b -) (c +))
  (begin
    (assert (eq? (eq? a b) #f))
    (assert (eq? a c))
    (assert (eq? (eq? a -) #f))
    (assert (eq? a +))))
