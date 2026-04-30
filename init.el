
(setq inhibit-startup-screen t)

;; UI cleanup (safe for terminal + GUI)
(menu-bar-mode -1)

(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(setq inhibit-startup-screen t)
(setq ring-bell-function 'ignore)

(global-display-line-numbers-mode 1)

(setq make-backup-files nil)
(setq auto-save-default nil)

(fset 'yes-or-no-p 'y-or-n-p)
(savehist-mode 1)

(xterm-mouse-mode 1)

(setq scroll-conservatively 101)

(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu"   . "https://elpa.gnu.org/packages/")))
(package-initialize)

;; Bootstrap use-package (once)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq use-package-always-ensure t)
(require 'use-package)

;; Better UI feedback
(use-package which-key
  :init (which-key-mode))

;; GIT Integration
(use-package magit)

(use-package consult
  :bind (("C-s" . consult-line)
         ("C-x b" . consult-buffer)
         ("C-x C-r" . consult-recent-file)))

;; Vertical completion UI
(use-package vertico
  :init
  (vertico-mode))

(use-package orderless
  :init
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides
        '((file (styles partial-completion)))))

;; Flexible matching (critical)
(use-package orderless
  :init
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides
        '((file (styles partial-completion)))))

;; Extra info in minibuffer
(use-package marginalia
  :init
  (marginalia-mode))

;; Built-in enhancements (Emacs 30)
(setq completion-cycle-threshold 3)   ;; TAB cycles candidates
(setq tab-always-indent 'complete)   ;; TAB triggers completion

;; Faster directory navigation
(setq read-file-name-completion-ignore-case t
      read-buffer-completion-ignore-case t)

;; Enable recursive minibuffers (important for nested commands)
(setq enable-recursive-minibuffers t)

(global-set-key (kbd "C-x b") 'switch-to-buffer)

;; Automatically copy to windows clipboard when selecting region using mouse
(defun my/mouse-copy-to-clip (event)
  (interactive "e")
  (mouse-set-region event)
  (when (use-region-p)
    (let ((text (buffer-substring-no-properties
                 (region-beginning) (region-end))))
      (let ((process-connection-type nil))
        (let ((proc (start-process "clip" nil "clip.exe")))
          (process-send-string proc text)
          (process-send-eof proc))))))

(global-set-key [drag-mouse-1] #'my/mouse-copy-to-clip)

;; Enable mouse support in terminal
(xterm-mouse-mode 1)

;; Enable scroll wheel
(mouse-wheel-mode 1)

;; smoother scrolling
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq mouse-wheel-progressive-speed nil)
(setq scroll-conservatively 101)
