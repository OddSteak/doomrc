(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 13 :weight 'regular))
(setq lsp-modeline-code-action-fallback-icon "")
(setq lsp-progress-prefix "")

;(setq nerd-icons-font-family "Symbols Nerd Font Mono")
;(setq doom-symbol-font (font-spec :family "Symbols Nerd Font Mono" :size 11))
(setq! doom-unicode-font (font-spec :family "Iosevka Nerd Font" :size 13))

(setq doom-modeline-height 1) ; optional

(custom-set-faces!
  '(mode-line :family "Iosevka Nerd Font Mono" :height 0.9)
  '(mode-line-inactive :family "Iosevka Nerd Font Mono" :height 0.9))

(setq nerd-icons-scale-factor 1)
(setq doom-modeline-project-detection 'project) ;fix symlinks

(defun load-prettify-symbols ()
  (interactive)
  (setq prettify-symbols-alist
    '(("#+BEGIN_SRC python" . "")
     ("#+BEGIN_SRC" . "")
     ("#+BEGIN_SRC java" . "")
     ("#+BEGIN_SRC javascript" . "")
     ("#+BEGIN_SRC emacs-lisp" . "")
     ("#+BEGIN_SRC bash" . "")
     (":tangle yes" . "")
     ("#+END_SRC" . "-")))
  (prettify-symbols-mode 1))

(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)
(+global-word-wrap-mode 1)

(push '(undecorated . t) default-frame-alist)
(add-to-list 'default-frame-alist '(drag-internal-border . 1))
(add-to-list 'default-frame-alist '(internal-border-width . 5))

(ligature-set-ligatures 'prog-mode '("--" "---" "==" "===" "!=" "!==" "=!="
                              "=:=" "=/=" "<=" ">=" "&&" "&&&" "&=" "++" "+++" "***" ";;" "!!"
                              "??" "???" "?:" "?." "?=" "<:" ":<" ":>" ">:" "<:<" "<>" "<<<" ">>>"
                              "<<" ">>" "||" "-|" "_|_" "|-" "||-" "|=" "||=" "##" "###" "####"
                              "#{" "#[" "]#" "#(" "#?" "#_" "#_(" "#:" "#!" "#=" "^=" "<$>" "<$"
                              "$>" "<+>" "<+" "+>" "<*>" "<*" "*>" "</" "</>" "/>" "<!--" "<#--"
                              "-->" "->" "->>" "<<-" "<-" "<=<" "=<<" "<<=" "<==" "<=>" "<==>"
                              "==>" "=>" "=>>" ">=>" ">>=" ">>-" ">-" "-<" "-<<" ">->" "<-<" "<-|"
                              "<=|" "|=>" "|->" "<->" "<~~" "<~" "<~>" "~~" "~~>" "~>" "~-" "-~"
                              "~@" "[||]" "|]" "[|" "|}" "{|" "[<" ">]" "|>" "<|" "||>" "<||"
                              "|||>" "<|||" "<|>" "..." ".." ".=" "..<" ".?" "::" ":::" ":=" "::="
                              ":?" ":?>" "//" "///" "/*" "*/" "/=" "//=" "/==" "@_" "__" "???"
                              "<:<" ";;;"))
(global-ligature-mode 1)
(setq scroll-preserve-screen-position 'always)

(set-popup-rule! "*doom:vterm-popup:*" :size 0.25 :vslot -4 :select t :quit nil :ttl 0)

;; `gruvbox-material' contrast and palette options
(setq doom-gruvbox-material-background  "soft"  ; or hard (defaults to soft)
     doom-gruvbox-material-palette     "material") ; or original (defaults to material)

;; set `doom-theme'
(setq doom-theme 'catppuccin)
; (setq doom-theme 'doom-gruvbox-material) ; dark variant

(after! org
  (setq org-startup-with-inline-images 1)
  (setq org-directory "~/org/")
  (setq org-todo-keywords '
    ((sequence "TODO(t)" "START(s)" "WAIT(w)" "PROJ(p)" "IDEA(i)" "EXAM(e)"
               "|"
               "DONE(d)" "CAN(c)")))
  (require 'org-bullets))
(add-hook 'org-mode-hook (lambda() (org-bullets-mode 1)))
(add-hook 'org-mode-hook 'load-prettify-symbols)

(when (and (eq system-type 'gnu/linux)
           (string-match
            "Linux.*Microsoft.*Linux"
            (shell-command-to-string "uname -a")))
  (setq
   browse-url-generic-program  "/mnt/c/Windows/System32/cmd.exe"
   browse-url-generic-args     '("/c" "start")
   browse-url-browser-function #'browse-url-generic))

(scroll-bar-mode 0)
(size-indication-mode -1)
(global-evil-surround-mode 1)
(after! lsp
  (lsp-ui-mode 'toggle))

(evilem-default-keybindings "SPC")
(add-hook 'pdf-view-mode-hook (lambda() (display-line-numbers-mode -1)))
(add-hook 'term-mode-hook (lambda() (display-line-numbers-mode -1)))
(add-hook 'vterm-mode-hook (lambda() (display-line-numbers-mode -1)))
(add-hook 'html-mode-hook (lambda() (spell-fu-mode -1)))
