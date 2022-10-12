;; MELPA PACKAGES-------------------------------------------------------- 
(require 'package)
(add-to-list 'package-archives
'("MELPA Stable" . "https://melpa.org/packages/") t)
(package-initialize)
(custom-set-variables
 '(package-selected-packages
   (quote
    (evil-smartparens alect-themes cherry-blossom-theme 2048-game magit
		      evil homebrew-mode dracula-theme))))

;; THEMES----------------------------------------------------------------
(custom-set-faces)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'dracula t)
;;(load-theme 'cherry-blossom t)
(require 'smartparens-config)
(smartparens-mode 1)
;;(add-hook 'smartparens-enabled-hook #'evil-smartparens-mode)

;; add vim bindings
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)

;; GUI SETTINGS----------------------------------------------------------
;; Remove extra GUI stuff
(menu-bar-mode -1) 
(scroll-bar-mode -1)
(tool-bar-mode -1)
(set-fringe-mode 0)
(column-number-mode 1) ;; add column number 

;make the y or n suffice for a yes or no question
(fset 'yes-or-no-p 'y-or-n-p)

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; scroll one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time
(setq initial-buffer-choice "C:/Users/18313/workspace")
(setq inhibit-startup-screen t) ;; disable startup screen
(setq frame-resize-pixelwise t) ;; Make emacs window use full screen

(toggle-frame-fullscreen) ;; Make window default to fullscreen

;; SHELL SETTINGS--------------------------------------------------------
(add-to-list 'load-path "~/.emacs.d/lispdir")
(load "cygwin-mount.el")
(require 'cygwin-mount)

(setenv "PATH" (concat "c:/cygwin64/bin;" (getenv "PATH")))
(setq exec-path (cons "c:/cygwin64/bin/" exec-path))
(require 'cygwin-mount)
(cygwin-mount-activate)

(add-hook 'comint-output-filter-functions
    'shell-strip-ctrl-m nil t)
(add-hook 'comint-output-filter-functions
    'comint-watch-for-password-prompt nil t)
(setq explicit-shell-file-name "bash.exe")
;; For subprocesses invoked via the shell
;; (e.g., "shell -c command")
(setq shell-file-name explicit-shell-file-name)
(setq shell-command-switch "-ic")
(set-buffer-file-coding-system 'unix)

;; FUNCTIONS-------------------------------------------------------------
;;insert date into buffer
(defun insert-date ()
  "Insert date at point."
  (interactive)
  (insert (format-time-string "%a %b %e, %Y %l:%M %p")))

;;show ascii table
(defun ascii ()
  (interactive)
  (switch-to-buffer "*ASCII*")
  (erase-buffer)
  (insert (format "ASCII characters up to number %d.\n" 254))
  (let ((i 32))
    (while (< i 254)
      (setq i (+ i 1))
      (insert (format "%4d %c\n" i i))))
  (beginning-of-buffer))

