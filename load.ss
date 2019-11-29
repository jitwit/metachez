(import (matchable)
        (only (srfi :13) string-tokenize))

(define example
  "twoplustwo.mm")

(define metachez-load-path
  (make-parameter "./programs"))

(define (expand-metachez-path file)
  (string-append (metachez-load-path) "/" file))

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


