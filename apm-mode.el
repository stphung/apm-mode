;; Initialize a variable to count actions
(defvar apm-num-chars)
(setq apm-num-chars 0)

;; Calculates actions per minute
(defun apm (duration-seconds actions)
  (truncate (* (/ actions (float duration-seconds)) 60)))

;; Increase actions and display
(defun update-apm (a b c)
  (setq apm-num-chars (+ 1 apm-num-chars))
  (message (number-to-string
            (apm (string-to-number (emacs-uptime "%s"))
                 apm-num-chars))))

;; Mode to add and remove hook
(define-minor-mode apm-mode
  :init-value nil
  :lighter " APM"
  (if apm-mode (add-hook 'after-change-functions 'update-apm nil t)
    (remove-hook 'after-change-functions 'update-apm t)))