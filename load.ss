(import (matchable)
        (only (srfi :13) string-tokenize))

(define example
  "programs/twoplustwo.mm")

(define mm-directory
  (make-parameter "."))

(define (file->string file)
  (with-input-from-file file
    (lambda ()
      (let* ((in (current-input-port))
             (n (port-length in))
             (S (make-string n)))
        (do ((i 0 (fx1+ i)))
            ((fx= i n) S)
          (string-set! S i (read-char in)))))))

(include "parse.ss")

(define (run-parser program-file)
  (let ((program (file->string program-file)))
    (time (parse (lex program)))))
