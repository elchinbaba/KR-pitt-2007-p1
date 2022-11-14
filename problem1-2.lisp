(defun add-queue (queue element)
  (if (null queue)
    (cons element nil)
    (cons (car queue)
      (add-queue (cdr queue) element))))

(defparameter *top-queue* '('null -1))

(defun top-queue (queue)
  (cond ((not (null queue))
    (cond ((> (car (cdr (car queue))) (car (cdr *top-queue*)))
      (setq *top-queue* (car queue))))
      (top-queue (cdr queue)))
    (t *top-queue*)))

(defun remove-top-queue (queue)
  (setf top (top-queue queue))

  (cond ((null queue)
    nil)
    (t
      (cond ((not (equal top (car queue)))
        (cons (car queue) (remove-top-queue (cdr queue))))
        (t
          (remove-top-queue (cdr queue)))))))

(setq q (list '(embedded 2) '(inline 3) '(external 1)))

(print q)
(print (top-queue q))

(setf q (remove-top-queue q))

(print q)
(print (top-queue q))

(setf q (add-queue q '(important 4)))

(print q)
(print (top-queue q))
