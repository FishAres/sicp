#lang racket

(define size 2)
(print size)
;; nesting
(+ (* 3 5) (- 10 4))

(+ (* 3
      (+ (* 2 4)
         (+ 3 5) ))
   (+ (- 10 7)
      6))

(define pi 3.14159)
(define radius 10)
(define circumference (* 2 pi radius))

(define (square x) (* x x))
(define (area radius) (* pi (square radius) ))

(area 5)

(define (sum-of-squares x y )
  (+ (square x) (square y) ))

(sum-of-squares 3 4)
 
(define (f a) ;; weird random function
  (sum-of-squares (+ a 1) (* a 2) ))
(f 5)

;; conditionals

(define (abs x)
  (cond ((> x 0) x)
        ((= x 0) 0)
        ((< x 0) (- x))
        )
  )

;; could re-write as
(define (abs2 x)
  (cond ((< x 0) (- x))
        (#t x)) ;; checkit - the "else" is just anything that evaluates to true - cond is an OR
  )

;; or
(define (abs3 x)
  (if (< x 0)
      (- x)
      x)
  )


;; if statements are like
;; (if <predicate> <then this> <else this>)
;; expressions are evaluated left-to-right: e.g. (and x y) is (if x #t #f)
;; (and x y z) is (if (if x #t #f) (if y #t #f) (some recursion)))

(define (>= x y) (or (> x y) (= x y)))
;; (define (>= x y) (not (< x y)))

;; ex 1.2
(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5))))) (* (- 2 7) (- 6 2) 3) )

;; ex 1.3

(define (top-two x y z)
  (cond ((and (>= x y) (>= y z)) (list x y))
        ((and (>= y z) (>= z x)) (list y z))
        (else (list x z))
        )
  )

;;(define (weird-sum-squares x y z)
  
;; how will this play out with applicative or normal procedure?
(define (p) (p) )
(define (test x y)
  (if (= x 0) 0 y)
  )

;;(test (p) 0)

;; square roots with newton's method
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)
      )
  )

(define (improve guess x)
  (average guess (/ x guess))
  )

(define (average x y)
  (/ (+ x y) 2) )

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  (if (< x 0) "error"
  (sqrt-iter 1.0 x))
  )

(sqrt 0.0)


;; ex 1.6
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(new-if (= 2 3) 0 5)

(define (sqrt-iter2 guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x) x)))

(define (sqrt2 x)
  (sqrt-iter2 1.0 x))

(sqrt 2)
