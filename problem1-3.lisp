(defun eval-logic (sentence atomicprop)
  (loop (setq prop (car atomicprop))
    (set (car prop) (not (null (car (cdr prop)))))
    (setf atomicprop (cdr atomicprop))
    (when (null atomicprop) (return (eval sentence)))))

;;(defun eval-logic (sentence atomicprop)
;;  (cond ((null atomicprop)
;;    (eval sentence))
;;    (t
;;      (set (car (car atomicprop)) (not (null (cdr (car atomicprop)))))
;;      (eval-logic sentence (cdr atomicprop)))))

(setq atomicprop '((A T) (B NIL) (C T) (D NIL)))
(setq sentence '(and (or A B (not C)) (or (not A) D) (or (not B))))
(print (eval-logic sentence atomicprop))
