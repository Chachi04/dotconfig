(setq user-full-name "Jiaqi Wang"
      user-mail-address "w.jiaqi004@gmail.com")

(setq doom-font (font-spec :family "FiraCode Nerd Font Mono" :size 15)
      doom-variable-pitch-font (font-spec :family "Ubuntu" :size 15)
      doom-big-font (font-spec :family "FiraCode Nerd Font Mono" :size 24))

(setq doom-theme 'doom-palenight)

(set-frame-parameter (selected-frame)'alpha '(90 . 90))
(add-to-list 'default-frame-alist'(alpha . (90 . 90)))

(setq display-line-numbers-type 'relative)

(setq doom-themes-treemacs-theme 'doom-colors)
(setq treemacs-width 25)

;; (use-package! tree-sitter
;;   :config
;;   (require 'tree-sitter-langs)
;;   (global-tree-sitter-mode)
;;   (pushnew! tree-sitter-major-mode-language-alist'
;;             '(scss-mode . css))
;;   (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

(map! :leader
      :desc "Org Babel tangle" "m B" #'org-babel-tangle)
(after! org-superstar
  (setq org-superstar-headline-bullets-list '("◉" "○" "✸" "✿" "✤" "✜" "◆" "▶")
        org-superstar-prettify-item-bullets t))
(after! org
  ;; (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  (setq org-directory "~/org/"
        org-agenda-files '("~/org/agenda.org")
        org-default-notes-file (expand-file-name "notes.org" org-directory)
        org-ellipsis " ▼ "
        org-log-done 'time
        ;; org-hide-emphasis-markers t
        ))

(require 'fira-code-mode)
(customize-set-variable 'fira-code-mode-disabled-ligatures '("[]" "#{" "#(" "#_" "#_(" "x" "::" "<>" "++" "--")) ;; List of ligatures to turn off
(add-hook 'prog-mode-hook (lambda ()
                            (unless (eq major-mode 'web-mode)
                            (fira-code-mode))))

;; TODO replace C-c prefix with something else so that no functionality is lost
(map! :map evil-insert-state-map "C-c" 'evil-normal-state)
(map! :map evil-normal-state-map "C-c" 'evil-normal-state)

(map! :desc "Comment or uncomment current line"
    "C-/" #'comment-line)
(map! :desc "Drag selected line up"
      "M-k" #'drag-stuff-up)
(map! :desc "Drag selected line down"
      "M-j" #'drag-stuff-down)

(remove-hook 'doom-first-input-hook #'evil-snipe-mode)

(setq evil-move-cursor-back nil)

(with-eval-after-load 'lsp-mode
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\vendor\\'")
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\node_modules\\'"))
  ;; (add-to-list 'lsp-file-watch-ignored-files "[/\\\\]\\.my-files\\'"))

(setq default-input-method "bulgarian-phonetic")
(map! :leader
      :desc "Toggle input method" "t i" #'toggle-input-method)

(map! :leader
      :desc "Increment at pointer"
      :map evil-normal-state-map
      "=" #'evil-numbers/inc-at-pt)

(map! :leader
      :desc "Decrement at pointer"
      :map evil-normal-state-map
      "-" #'evil-numbers/dec-at-pt)

(setq delete-by-moving-to-trash t
      undo-limit 80000000
      evil-want-fine-undo t
      truncate-string-ellipsis "…"
      scroll-margin 10
      )

(setq evil-vsplit-window-right t
      evil-split-window-below t)
(defadvice! prompt-for-buffer (&rest _)
  :after '(evil-window=split evil-window-vsplit)
  (consult-buffer))
(defadvice! prompt-for-buffer (&rest _)
  :after '(evil-window=split evil-window-split)
  (consult-buffer))

(after! company
  (setq company-idle-delay 0.5
        company-minimum-prefix-length 2)
  (add-hook 'evil-normal-state-entry-hook #'company-abort)) ;; make aborting less annoying.
(setq-default history-length 1000)
(setq-default prescient-history-length 1000)

(setq projectile-ignored-projects '("~/" "/tmp" "~/.emacs.d" "~/.emacs.d/.local/straight/repos/"))
(defun projectile-ignored-project-function (filepath)
  "Return t if FILEPATH is within any of `projectile-ignored-projects'"
  (or (mapcar (lambda (p) (s-starts-with-p p filepath)) projectile-ignored-projects)))

(use-package! aas
  :commands aas-mode)

(setq yas-triggers-in-field t)

;; (with-eval-after-load 'evil-nerd-commenter
;;   (defun my-comment-or-uncomment-region (beg end)
;;     (let* ((comment-start "{--")
;;            (comment-end "bbb"))
;;       (evilnc-comment-or-uncomment-region-internal beg end)))
;;   (setq evilnc-comment-or-uncomment-region-function
;;         'my-comment-or-uncomment-region))
;; (add-to-list 'auto-mode-alist
;;              '("\\.blade.php\\'" . (lambda ()
;;                 ;; add major mode setting here, if needed, for example:
;;                 ;; (text-mode)
;;                 (set (make-local-variable 'comment-start) "{--")
;;                 (set (make-local-variable 'comment-end) "--}"))))
;;                 'web-mode



(setq +file-templates-dir "~/.config/doom/templates"
      max-specpdl-size 10000)
(set-file-template! "\\.cpp$" :trigger "__cp.cpp" :mode 'c++-mode)



(add-hook 'c++-mode-hook
    (lambda ()
    (unless (or (file-exists-p "makefile")
                (file-exists-p "Makefile"))
        (set (make-local-variable 'compile-command)
            (concat "g++ -o run "
                    (if buffer-file-name
                        (shell-quote-argument
                        (buffer-file-name))))))))
