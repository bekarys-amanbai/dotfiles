;; БАЗОВЫЕ НАСТРОЙКИ

(setq frame-title-format "Emacs: %b")

;(menu-bar-mode                  -1) ;; отключаем графическое меню
(tool-bar-mode                  -1) ;; отключаем tool-bar
(scroll-bar-mode                -1) ;; отключаем полосу прокрутки
(setq inhibit-splash-screen      t)
(setq ingibit-startup-message    t) ;; отключаем экран приветствие
(setq use-dialog-box           nil) ;; никаких графических диалогов и окон - все через минибуфер
(setq redisplay-dont-pause       t)  ;; лучшая отрисовка буфера

(tooltip-mode                   -1)
(blink-cursor-mode              -1) ;; курсор не мигает
(setq ring-bell-function   'ignore) ;; отключить звуковой сигнал
(show-paren-mode                 t) ;; включить выделение выражений между {},[],()
(setq show-paren-style 'expression) ;; выделить цветом выражения между {},[],()

(setq make-backup-files        nil)
(setq auto-save-default        nil)
(setq auto-save-list-file-name nil)


;; нумирация строк
(require 'linum)
(line-number-mode      t) ;; показать номер строки в mode-line
(global-linum-mode     t) ;; показывать номера строк во всех буферах
(column-number-mode    t) ;; показать номер столбца в mode-line
(setq linum-format " %d") ;; задаем формат нумерации строк


(require 'ido)
(ido-mode t)



;; НАСТРОЙКИ ПЛАГИНОВ
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))


;; USE-PACKAGE
(unless (package-installed-p 'use-package)
  (package-install 'use-package))


;; THEMES
(use-package spacemacs-theme
  :ensure t
  :config
  (load-theme 'spacemacs-dark t))


;; Evil
(use-package evil
  :ensure t
  :config
  (evil-mode 1))


;; Elpy
(use-package elpy
  :ensure t
  :init
  (elpy-enable))
