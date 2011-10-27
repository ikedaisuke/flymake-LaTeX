;; add this snippet to your .emacs
(defun flymake-get-tex-args (file-name)
      (list (expand-file-name "~/bin/flycheck_latex.sh") (list file-name)))
(add-to-list 'flymake-err-line-patterns
    '("\\(.+\\.tex\\):\\([0-9]+\\):\\([0-9]+\\):\\(.+\\)"
         nil 2 3 4))
