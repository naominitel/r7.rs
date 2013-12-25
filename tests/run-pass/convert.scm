(assert (eq? (quote foo) (string->symbol (symbol->string (quote foo)))))
(assert (eq? (symbol->string (quote foo)) (symbol->string (quote foo))))
(assert (equal? (quote foo) (string->symbol (symbol->string (quote foo)))))
(assert (equal? (symbol->string (quote foo)) (symbol->string (quote foo))))
