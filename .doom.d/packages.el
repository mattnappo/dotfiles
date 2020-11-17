;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; To install a package with Doom you must declare them here and run 'doom sync'
;; on the command line, then restart Emacs for the changes to take effect -- or
;; use 'M-x doom/reload'.


;; To install SOME-PACKAGE from MELPA, ELPA or emacsmirror:
;(package! some-package)
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(package-refresh-contents)

;; To install a package directly from a remote git repo, you must specify a
;; `:recipe'. You'll find documentation on what `:recipe' accepts here:
;; https://github.com/raxod502/straight.el#the-recipe-format
;(package! another-package
;  :recipe (:host github :repo "username/repo"))

;; If the package you are trying to install does not contain a PACKAGENAME.el
;; file, or is located in a subdirectory of the repo, you'll need to specify
;; `:files' in the `:recipe':
;(package! this-package
;  :recipe (:host github :repo "username/repo"
;           :files ("some-file.el" "src/lisp/*.el")))

;; If you'd like to disable a package included with Doom, you can do so here
;; with the `:disable' property:
;(package! builtin-package :disable t)

;; You can override the recipe of a built in package without having to specify
;; all the properties for `:recipe'. These will inherit the rest of its recipe
;; from Doom or MELPA/ELPA/Emacsmirror:
;(package! builtin-package :recipe (:nonrecursive t))
;(package! builtin-package-2 :recipe (:repo "myfork/package"))

;; Specify a `:branch' to install a package from a particular branch or tag.
;; This is required for some packages whose default branch isn't 'master' (which
;; our package manager can't deal with; see raxod502/straight.el#279)
;(package! builtin-package :recipe (:branch "develop"))

;; Use `:pin' to specify a particular commit to install.
;(package! builtin-package :pin "1a2b3c4d5e")


;; Doom's packages are pinned to a specific commit and updated from release to
;; release. The `unpin!' macro allows you to unpin single packages...
;(unpin! pinned-package)
;; ...or multiple packages
;(unpin! pinned-package another-pinned-package)
;; ...Or *all* packages (NOT RECOMMENDED; will likely break things)
;(unpin! t)


;; CUSTOM PACKAGES

;;(use-package fira-code-mode
;;  :custom (fira-code-mode-disabled-ligatures '("[]" "x"))  ; ligatures you don't want
;;  :hook prog-mode)                                         ; mode to enable fira-code-mode in
;;
;;(defun fira-code-mode--make-alist (list)
;;  "Generate prettify-symbols alist from LIST."
;;  (let ((idx -1))
;;    (mapcar
;;     (lambda (s)
;;       (setq idx (1+ idx))
;;       (let* ((code (+ #Xe100 idx))
;;          (width (string-width s))
;;          (prefix ())
;;          (suffix '(?\s (Br . Br)))
;;          (n 1))
;;     (while (< n width)
;;       (setq prefix (append prefix '(?\s (Br . Bl))))
;;       (setq n (1+ n)))
;;     (cons s (append prefix suffix (list (decode-char 'ucs code))))))
;;     list)))
;;
;;(defconst fira-code-mode--ligatures
;;  '("www" "**" "***" "**/" "*>" "*/" "\\\\" "\\\\\\"
;;    "{-" "[]" "::" ":::" ":=" "!!" "!=" "!==" "-}"
;;    "--" "---" "-->" "->" "->>" "-<" "-<<" "-~"
;;    "#{" "#[" "##" "###" "####" "#(" "#?" "#_" "#_("
;;    ".-" ".=" ".." "..<" "..." "?=" "??" ";;" "/*"
;;    "/**" "/=" "/==" "/>" "//" "///" "&&" "||" "||="
;;    "|=" "|>" "^=" "$>" "++" "+++" "+>" "=:=" "=="
;;    "===" "==>" "=>" "=>>" "<=" "=<<" "=/=" ">-" ">="
;;    ">=>" ">>" ">>-" ">>=" ">>>" "<*" "<*>" "<|" "<|>"
;;    "<$" "<$>" "<!--" "<-" "<--" "<->" "<+" "<+>" "<="
;;    "<==" "<=>" "<=<" "<>" "<<" "<<-" "<<=" "<<<" "<~"
;;    "<~~" "</" "</>" "~@" "~-" "~=" "~>" "~~" "~~>" "%%"
;;    "x" ":" "+" "+" "*"))
;;
;;(defvar fira-code-mode--old-prettify-alist)
;;
;;(defun fira-code-mode--enable ()
;;  "Enable Fira Code ligatures in current buffer."
;;  (setq-local fira-code-mode--old-prettify-alist prettify-symbols-alist)
;;  (setq-local prettify-symbols-alist (append (fira-code-mode--make-alist fira-code-mode--ligatures) fira-code-mode--old-prettify-alist))
;;  (prettify-symbols-mode t))
;;
;;(defun fira-code-mode--disable ()
;;  "Disable Fira Code ligatures in current buffer."
;;  (setq-local prettify-symbols-alist fira-code-mode--old-prettify-alist)
;;  (prettify-symbols-mode -1))
;;
;;(define-minor-mode fira-code-mode
;;  "Fira Code ligatures minor mode"
;;  :lighter " Fira Code"
;;  (setq-local prettify-symbols-unprettify-at-point 'right-edge)
;;  (if fira-code-mode
;;      (fira-code-mode--enable)
;;    (fira-code-mode--disable)))
;;
;;(defun fira-code-mode--setup ()
;;  "Setup Fira Code Symbols"
;;  (set-fontset-font t '(#Xe100 . #Xe16f) "Fira Code Symbol"))
;;
;;(provide 'fira-code-mode)
