(load "util.lisp")
(load "staterep.lisp")

(defun checkup (state side)
  (do* ((i 0 (1+ i))
        (coord (nth i side) (nth i side))
        (x (nth 1 coord) (nth 1 coord))
        (y (nth 0 coord) (nth 0 coord))
        (no-move nil))
    ((or no-move (> i (length side)) (<= y 0)) (not no-move))
    (if (not (eq 0 (nth x (nth (- y 1) side))))
      (setf no-move t))))

(setf state (loadGameState "SBP-level0.txt"))
(outputGameState)
(format t "~a~%" (checkup state '((0 1))))
