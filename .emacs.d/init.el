;;
;; Early configuration
;;

(defun join-path (path filename)
  "concat path and file. Adds '/' to the end of the path if necessary"
  (concat path (if (string-match-p "/$" path) "" "/") filename))

(setq lauremacs-dir "~/lauremacs")
(setq lauremacs-d-dir (join-path lauremacs-dir ".emacs.d"))
(setq lauremacs-home-page-dir (join-path lauremacs-d-dir "home-page"))
(setq user-emacs-directory lauremacs-d-dir)

(load-file (join-path user-emacs-directory "early-init.el"))


;;
;; Packages
;;

;; Initialize package sources
(require 'package)

;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)


;;
;; Load home page
;;

(load-file (join-path lauremacs-home-page-dir "home-page.el"))

;;
;; Load personal file
;;


(load-file (concat lauremacs-dir "/.emacs"))



