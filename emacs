;; for colors
(require 'color-theme)
(setq color-theme-is-global t)

;; Some general appearance customizations
(tool-bar-mode -1)              ;; turning off toolbar
(setq inhibit-startup-screen t) ;; turn off splash screen
(scroll-bar-mode -1)            ;; turn off scroll bar
;(set-default-font "-unknown-Inconsolata-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1")

;(color-theme-clarity)
;(load-file "~/.emacs.d/color-theme-solarized.el")
;(color-theme-solarized-dark)
;(load-file "~/.emacs.d/color-theme-blackboard.el")
;(color-theme-blackboard)
(load-file "~/.emacs.d/color-theme-tango.el")
(color-theme-tango)

;(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
; )
;(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
; '(default ((t (:inherit nil :stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))

;; added for processing hooks.
;; commented out b/c stopped working, 7/2/11
;(add-to-list 'load-path "/home/chris/processing-emacs/")
;(autoload 'processing-mode "processing-mode" "Processing mode" t)
;(add-to-list 'auto-mode-alist '("\\.pde$" . processing-mode))
;(setq processing-location "/home/chris/processing-1.2.1/")

;; these are for org-mode
;; The following lines are always needed.  Choose your own keys.
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; for orgmode capture; orgmode is installed from AUR
(setq org-default-notes-file "~/Dropbox/notes/notes.org")
(define-key global-map "\C-cc" 'org-capture)
(require 'org-install)

;; 
(setq org-directory "~/Dropbox/notes/")
(setq org-mobile-inbox-for-pull "~/Dropbox/notes/mobile-capture.org")
;; mobile org stuff
(setq org-mobile-directory "~/Dropbox/MobileOrg")
(setq org-mobile-files '("~/Dropbox/notes/notes.org"))

(global-font-lock-mode 1)                     ; for all buffers

 (transient-mark-mode 1)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(tool-bar-mode nil))
;(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
; '(default ((t (:inherit nil :stipple nil :background "#2e3436" :foreground "#eeeeec" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 90 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))


;;stuff for yasnippets
(add-to-list 'load-path
                  "~/.emacs.d/plugins/yasnippet-0.6.1c")
    (require 'yasnippet) ;; not yasnippet-bundle
    (yas/initialize)
    (yas/load-directory "~/.emacs.d/plugins/yasnippet-0.6.1c/snippets")

;; stuff for "twittering-mode"
;(add-to-list 'load-path "/home/chris/emacs/twittering-mode-1.0.0")
;(require 'twittering-mode)

;; fixing cut and paste
(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)

;; auctex 
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
(put 'upcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;; For auto-complete mode
(add-to-list 'load-path "~/.emacs.d/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)

;; For session saving
;(require 'session)
;(add-hook 'after-init-hook 'session-initialize)

;; For markdown-mode
(autoload 'markdown-mode "markdown-mode.el"
   "Major mode for editing Markdown files" t)
(setq auto-mode-alist
   (cons '("\.md" . markdown-mode) auto-mode-alist))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#2e3436" :foreground "#eeeeec" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))

;; cycle through buffers with Ctrl-Tab (like Firefox)
(global-set-key (kbd "<C-tab>") 'bury-buffer)
(put 'downcase-region 'disabled nil)

;; ido mode
;(ido-mode t)
;(setq ido-enable-flex-matching t)

;; New ido Set-Up
(require 'ido)
(ido-mode t)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-auto-merge-work-directories-length nil
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-use-virtual-buffers t
      ido-handle-duplicate-virtual-buffers 2
      ido-max-prospects 10)

;; Display ido results vertically, rather than horizontally
(setq ido-decorations (quote ("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))
(defun ido-disable-line-trucation () (set (make-local-variable 'truncate-lines) nil))
(add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-trucation)

;; Loading Ruby Mode Files b/c I am a moron and do not understand 
;; emacs load paths.
(load-file "/usr/share/emacs/site-lisp/ruby-mode/ruby-mode.el")
(load-file "/usr/share/emacs/site-lisp/ruby-mode/ruby-electric.el")
(load-file "/usr/share/emacs/site-lisp/ruby-mode/inf-ruby.el")

(add-hook 'ruby-mode-hook
          (lambda () (run-hooks 'csf-code-modes-hook)))

;; Create hook for turning on line numbers for code files.
;; Based on: 
(add-hook 'csf-code-modes-hook
          (lambda () (linum-mode 1)))

;; Turn on column number globally.
(column-number-mode 1)

;; rainbow mode hooks for CSS editing
(defun css-rainbow-mode() (css-mode) (rainbow-mode))
(add-to-list 'auto-mode-alist '("\.css$" . css-rainbow-mode))

;; lua mode, installed via pacman
(setq auto-mode-alist (cons '("\.lua$" . lua-mode) auto-mode-alist))
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)

;; to stop the bloody beeping
;(setq visible-bell t)

;; for wc-mode
(add-to-list 'load-path "/home/chris/.emacs.d/wc-mode/")
(require 'wc-mode)

;; setup markdown mode to include spell checking, word count
;; in mode line and word-wrap.
;; answer taken from here: http://stackoverflow.com/questions/4253473/emacs-how-do-i-automatically-enter-minor-modes-when-i-enter-a-major-mode
(add-hook 'markdown-mode-hook
	  (function (lambda() 
		      (wc-mode)
		      (flyspell-mode)
		      (longlines-mode))))

;; This line required before the following in order to be able add
;; other package repositories (elpa and marmalade).
(require 'package)

;; adding respositories for emacs 24; csf-7/4/12
;; Add the original Emacs Lisp Package Archive
(add-to-list 'package-archives
             '("elpa" . "http://tromey.com/elpa/"))
;; Add the user-contributed repository
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))

;; These lines more elegantly distinguish multiple buffers which
;; have  the same name.
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
