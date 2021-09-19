;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Jiaqi Wang"
      user-mail-address "w.jiaqi004@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "FiraMono Nerd Font Mono" :size 15)
      doom-variable-pitch-font (font-spec :family "FiraMono Nerd Font Mono" :size 16))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-palenight)
(setq doom-themes-treemacs-theme 'doom-colors)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; Reset s/S behaviour for substitution
(remove-hook 'doom-first-input-hook #'evil-snipe-mode)

;; Hey cursor, stay there when exiting insert mode, will ya!?
(setq evil-move-cursor-back nil)

;; Tree-shitter
(use-package! tree-sitter
  :config
  (require 'tree-sitter-langs)
  (global-tree-sitter-mode)
  (pushnew! tree-sitter-major-mode-language-alist
            '(scss-mode . css))
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

(with-eval-after-load 'lsp-mode
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\vendor\\'")
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\node_modules\\'")
  ;; or
  ;; (add-to-list 'lsp-file-watch-ignored-files "[/\\\\]\\.my-files\\'"))
)

;; Modify company so that tab and S-tab cycle through completions without
;; needing to hit enter.

;; (setq company-require-match nil)

;; (defvar-local company-simple-complete--previous-prefix nil)
;; (defvar-local company-simple-complete--before-complete-point nil)

;; (defun company-simple-complete-frontend (command)
;;   (when (or (eq command 'show)
;;             (and (eq command 'update)
;;                  (not (equal company-prefix company-simple-complete--previous-prefix))))
;;     (setq company-selection -1
;;           company-simple-complete--previous-prefix company-prefix
;;           company-simple-complete--before-complete-point nil)))

;; (defun company-simple-complete-next (&optional arg)
;;   (interactive "p")
;;   (company-select-next arg)
;;   (company-simple-complete//complete-selection-and-stay))

;; (defun company-simple-complete-previous (&optional arg)
;;   (interactive "p")
;;   (company-select-previous arg)
;;   (company-simple-complete//complete-selection-and-stay))

;; (defun company-simple-complete//complete-selection-and-stay ()
;;   (if (cdr company-candidates)
;;       (when (company-manual-begin)
;;         (when company-simple-complete--before-complete-point
;;           (delete-region company-simple-complete--before-complete-point (point)))
;;         (setq company-simple-complete--before-complete-point (point))
;;         (unless (eq company-selection -1)
;;           (company--insert-candidate (nth company-selection company-candidates)))
;;         (company-call-frontends 'update)
;;         (company-call-frontends 'post-command))
;;     (company-complete-selection)))

;; (defun company-simple-complete-selection-and-quit (&optional arg)
;;   (interactive "p")
;;   (when (company-manual-begin)
;;     (when company-simple-complete--before-complete-point
;;       (delete-region company-simple-complete--before-complete-point (point)))
;;     (setq company-simple-complete--before-complete-point (point))
;;     (unless (eq company-selection -1)
;;       (company-complete-selection))))

;; (defun company-simple-complete-number-and-quit (n)
;;   (interactive "p")
;;   (if (cdr company-candidates)
;;       (when (company-manual-begin)
;;         (when company-simple-complete--before-complete-point
;;           (delete-region company-simple-complete--before-complete-point (point)))
;;         (setq company-simple-complete--before-complete-point (point))
;;         (company-complete-number n)
;;         (unless (eq company-selection -1)
;;           (company-complete-selection)))))

;; (defadvice company-set-selection (around allow-no-selection (selection &optional force-update))
;;   "Allow selection to be -1"
;;   (setq selection
;;         ;; TODO deal w/ wrap-around
;;         (if company-selection-wrap-around
;;             (mod selection company-candidates-length)
;;           (max -1 (min (1- company-candidates-length) selection))))
;;   (when (or force-update (not (equal selection company-selection)))
;;     (setq company-selection selection
;;           company-selection-changed t)
;;     (company-call-frontends 'update)))

;; (defadvice company-tooltip--lines-update-offset (before allow-no-selection (selection _num-lines _limit))
;;   "Allow selection to be -1"
;;   (when (eq selection -1)
;;     (ad-set-arg 0 0)))

;; (defadvice company-tooltip--simple-update-offset (before allow-no-selection (selection _num-lines limit))
;;   "Allow selection to be -1"
;;   (when (eq selection -1)
;;     (ad-set-arg 0 0)))

;; (with-eval-after-load 'company
;;   (define-key company-active-map [tab] 'company-simple-complete-next)
;;   (define-key company-active-map (kbd "TAB") 'company-simple-complete-next)
;;   (define-key company-active-map (kbd "<S-tab>") 'company-simple-complete-previous)
;;   (define-key company-active-map (kbd "<backtab>") 'company-simple-complete-previous)
;;   (define-key company-active-map (kbd "<C-return>") 'company-simple-complete-selection-and-quit)
;;     (dotimes (i 10)
;;       (define-key company-active-map (read-kbd-macro (format "M-%d" i)) 'company-simple-complete-number-and-quit))
;;   (define-key company-active-map (kbd "RET") nil)
;;   (define-key company-active-map (kbd "<return>") nil)

;;   (put 'company-simple-complete-next 'company-keep t)
;;   (put 'company-simple-complete-previous 'company-keep t)
;;   (setq company-require-match nil)
;;   (ad-activate 'company-set-selection)
;;   (ad-activate 'company-tooltip--simple-update-offset)
;;   (ad-activate 'company-tooltip--lines-update-offset)
;;   (add-to-list 'company-frontends 'company-simple-complete-frontend))

;; (evil-declare-change-repeat 'company-simple-complete-next)
;; (evil-declare-change-repeat 'company-simple-complete-previous)
;; (provide 'company-simple-complete)

;; Exit insert mode with C-c
(map! :map evil-insert-state-map "C-c" 'evil-normal-state)
(map! :map evil-normal-state-map "C-c" 'evil-normal-state)

;; Comment/Uncomment lines with Ctrl+/
(map! :desc "Comment or uncomment current line"
      "C-/" #'comment-line)

(map! :desc "Drag selected line up"
      "M-k" #'drag-stuff-up)
(map! :desc "Drag selected line down"
      "M-j" #'drag-stuff-down)

(map! :desc "Select completion with TAB"
      :map company-active-map
      "<tab>" #'company-complete-selection)

;; FIXME
(map! :desc "Search directory"
      "C-p" #'projectile-find-file)

;; FIXME
(map! :desc "Toggle Treemacs"
      "C-n" #'+treemacs/toggle)
