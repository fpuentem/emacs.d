;; Setup use-package just in case everything isn't already installed
(with-eval-after-load 'org
  ;; Must do this so the agenda knows where to look for my files
  ;; (setq org-agenda-files '("~/orgs/notes/2024/"))
  (setq org-agenda-files (directory-files-recursively "~/orgs/notes/2024" "\\.org$"))

  ;; Follow the links
  (setq org-return-follows-link  t)

  ;; Make the indentation look nicer
  (add-hook 'org-mode-hook 'org-indent-mode)

  ;; Remap the change priority keys to use the UP or DOWN key
  ;; (define-key org-mode-map (kbd "C-c <up>") 'org-priority-up)
  ;; (define-key org-mode-map (kbd "C-c <down>") 'org-priority-down)

  ;; When you want to change the level of an org item, use SMR
  (define-key org-mode-map (kbd "C-c C-g C-r") 'org-shiftmetaright)

  ;; Hide the markers so you just see bold text as BOLD-TEXT and not *BOLD-TEXT*
  (setq org-hide-emphasis-markers t)

  ;; Wrap the lines in org mode so that things are easier to read
  (add-hook 'org-mode-hook 'visual-line-mode))

;; Add a better capturing templates
;; (setq org-capture-templates
;;       '(
;;         ("t" "TODO Item"
;;          entry (file "~/orgs/todos.org")
;;          "* TODO [#B] %? %^g\n"
;;          :empty-lines 0)

;;         ("j" "Journal Entry"
;;          entry (file+datetree "~/orgs/journal.org")
;;          "* %?"
;;          :empty-lines 1)

;;         ("m" "Meeting"
;;          entry (file+datetree "~/orgs/meetings.org")
;;          "* %? :meeting:%^g \n** Attendees\n - \n** Notes\n** Action Items\n*** TODO [#A] "
;;          :tree-type week
;;          :clock-in t
;;          :clock-resume t
;;          :empty-lines 0)

;;         ("n" "Note"
;;          entry (file+headline "~/orgs/notes.org" "Random Notes")
;;          "** %?"
;;          :empty-lines 0)
;;         ))

;; Adding tags
(setq org-tag-alist
      '(
        (:startgroup . nil)
        ("easy" . ?e)
        ("medium" . ?m)
        ("difficult" . ?d)
        (:endgroup . nil)

        (:startgroup . nil)
        ("@work" . ?w)
        ("@home" . ?h)
        ("@anywhere" . ?a)
        (:endgroup . nil)

        ("CRITICAL" . ?c)
        ))

(let* ((variable-tuple
        (cond ((x-list-fonts "ETBembo")         '(:font "ETBembo"))
              ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
              ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
              ((x-list-fonts "Verdana")         '(:font "Verdana"))
              ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
              (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
       (base-font-color     (face-foreground 'default nil 'default))
       (headline           `(:inherit default :weight bold :foreground ,base-font-color)))

  (custom-theme-set-faces
   'user
   `(org-level-8 ((t (,@headline ,@variable-tuple))))
   `(org-level-7 ((t (,@headline ,@variable-tuple))))
   `(org-level-6 ((t (,@headline ,@variable-tuple))))
   `(org-level-5 ((t (,@headline ,@variable-tuple))))
   `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
   `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.2))))
   `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.3))))
   `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.5))))
   `(org-document-title ((t (,@headline ,@variable-tuple :height 1.6 :underline nil))))))

(provide 'init-local)
