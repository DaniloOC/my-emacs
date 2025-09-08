(setq inhibit-startup-message t
      display-line-numbers-type 'relative
      backup-directory (expand-file-name "backups/" user-emacs-directory)
      lsp-keymap-prefix "C-c l")

(menu-bar-mode -1)                      ; no menu bar
(tool-bar-mode -1)                      ; no tools bar
(scroll-bar-mode -1)                    ; no scroll bars
(tooltip-mode -1)                       ; oculta dicas
(global-display-line-numbers-mode t)    ; always show line numbers
(column-number-mode t)                  ; show columns
(delete-selection-mode t)               ; o texto digitado substitui a selecao

;; Load tango-dark theme
(load-theme 'tango-dark t)

;; Packages
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package auto-package-update
  :custom
  (auto-package-upadate-interval 30))

(unless (package-installed-p 'lsp-mode)
  (package-install 'lsp-mode))
(unless (package-installed-p 'company)
  (package-install 'company))

;;LSP
(add-hook 'c-mode-hook 'lsp-deferred)
(add-hook 'c++-mode-hook 'lsp-deferred)

;;Company
(global-company-mode t)

(setq company-tooltip-limit 20)          ; Número de sugestões
(setq company-idle-delay 0.2)            ; Delay para aparecer
(setq company-minimum-prefix-length 2)   ; Mínimo de caracteres
(setq company-show-numbers t)            ; Mostrar números (opcional)

;; Auto gerado
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(lsp-mode eglot auto-package-update use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
