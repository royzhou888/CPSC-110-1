;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Lab 3 balloon-lab (1)|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require 2htdp/image)
(require 2htdp/universe)

; Balloon popping

;; CONSTANTS ==========================

(define WIDTH 500)
(define HEIGHT 500)
(define MTS (empty-scene WIDTH HEIGHT))

(define BALLOON-COLOUR "red")
(define POP-IMAGE (overlay (text "POP!" 80 "black")
                           (radial-star 30 (/ WIDTH 10) (/ WIDTH 2) "solid" "yellow")))

(define CTR-X (/ WIDTH 2))
(define CTR-Y (/ HEIGHT 2))

(define SPEED 2)

(define MAX-SIZE (/ WIDTH 2))





;; DATA DEFINITIONS ============================


;; Balloon is one of Natural (0,250)
;; - Natural (0, MAX-SIZE)
;; - true
;;interp. the number means the size of the ballon, true means it's popped

(define B1 0)
(define B2 (/ MAX-SIZE 2))
(define B3 MAX-SIZE)
(define B4 true)

#;
(define (fn-for-ballon b)
   (cond [(number? b)(...)]
          [else (...)]))




;;Template rules used:
;;   - one of the 2 cases
;;   - atomic non-distinct: Natural(0,MAX-SIZE)
;;   - atomic distinct: true




;; FUNCTIONS ====================================

;; Balloon -> Balloon
;; starts the world program with !!!
; no examples for main function


(define (main b)
  (big-bang b
            (on-tick tick)
            (to-draw render)
            (on-key key)))



;; Balloon -> Balloon
;; expands the balloon by SPEED, until it is popped
(check-expect (tick 0) (+ 0 SPEED))
(check-expect (tick true) MAX-SIZE)

;;(define (tick b)0) ;this is the stub


(define (tick b)
     (cond [(number? b)(+ b SPEED)]
        [else MAX-SIZE]))





;; Balloon -> Image
;; draws the balloon of given size onto the MTS, unless popped
 (check-expect (render 1)(place-image (circle 1 "solid" "yellow") CTR-X CTR-Y MTS))
 (check-expect (render true)(place-image POP-IMAGE CTR-X CTR-Y MTS))

;;(define(render b)empty-imgage) 


(define (render b)
     ( cond [(and(number? b)(< b MAX-SIZE)) (place-image (circle b "solid" "yellow") CTR-X CTR-Y MTS)]
            [else (place-image POP-IMAGE CTR-X CTR-Y MTS)]))


 ;; Ballon KeyEvent -> Ballon
 ;; when the spacebar is pressed, the ballon will pop.
(check-expect (key 3 " ")MAX-SIZE)
(check-expect (key 4 "a")4)
(check-expect (key MAX-SIZE " ")MAX-SIZE)


(define (key b ke)
   (cond [(key=? ke " ") MAX-SIZE]
         [else b]))



