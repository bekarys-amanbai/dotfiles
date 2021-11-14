;; БАЗОВЫЕ НАСТРОЙКИ

(setq frame-title-format "Emacs: %b")

;(menu-bar-mode                  -1) ;; отключаем графическое меню
(tool-bar-mode                  -1) ;; отключаем tool-bar
(scroll-bar-mode                -1) ;; отключаем полосу прокрутки
(setq inhibit-splash-screen      t)
(setq ingibit-startup-message    t) ;; отключаем экран приветствие
(setq use-dialog-box           nil) ;; никаких графических диалогов и окон - все через минибуфер
(setq redisplay-dont-pause       t) ;; лучшая отрисовка буфера

(tooltip-mode                   -1)
(blink-cursor-mode              -1) ;; курсор не мигает
(setq ring-bell-function   'ignore) ;; отключить звуковой сигнал
(show-paren-mode                 t) ;; включить выделение выражений между {},[],()
(setq show-paren-style 'expression) ;; выделить цветом выражения между {},[],()

(setq make-backup-files        nil)
(setq auto-save-default        nil)
(setq auto-save-list-file-name nil)



(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)


;; НАСТРОЙКИ ПЛАГИНОВ
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))


;; USE-PACKAGE
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)



;; НАСТРОЙКА ВСТРОЕННЫХ ПЛАГИНОВ
;(use-package org)
(use-package linum
  :config
  (line-number-mode      t) ;; показать номер строки в mode-line
  (global-linum-mode     t) ;; показывать номера строк во всех буферах
  (column-number-mode    t) ;; показать номер столбца в mode-line
  (setq linum-format " %4d "));; задаем формат нумерации строк


;; THEMES
(unless (package-installed-p 'spacemacs-theme)
  (package-install 'spacemacs-theme))

(unless (package-installed-p 'zenburn-theme)
  (package-install 'zenburn-theme))

(unless (package-installed-p 'monokai-theme)
  (package-install 'monokai-theme))

(unless (package-installed-p 'material-theme)
  (package-install 'material-theme))


(load-theme 'spacemacs-dark t)
;(load-theme 'zenburn t)
;(load-theme 'monokai t)
;(load-theme 'material t)

(use-package undo-tree
  :ensure t
  :after evil
  :diminish
  :config
  (evil-set-undo-system 'undo-tree)
  (global-undo-tree-mode 1))

;; Evil
(use-package evil
  :ensure t
  :init
  (setq evil-want-C-u-scroll t)
  :config
  (evil-set-undo-system 'undo-tree)
  (evil-mode 1))

;; Elpy
(use-package elpy
  :ensure t
  :init
  (elpy-enable)
  :config
  (add-hook 'elpy-mode-hook (lambda () (highlight-indentation-mode -1))))

;; Helm
(use-package helm
  :ensure t
  :config
  (global-set-key (kbd "M-x") #'helm-M-x)
  (global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
  (global-set-key (kbd "C-x C-f") #'helm-find-files)
  (helm-mode 1))

;; Projectile
(use-package projectile
  :ensure t
  :pin melpa-stable
  :init
  (projectile-mode +1)
  :bind (:map projectile-mode-map
              ("C-c p" . projectile-command-map))
  :config
  (setq projectile-project-search-path '("~/pproj/")))

(use-package magit
  :ensure t)
