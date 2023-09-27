
(setq backup-directory-alist
        `((".*" . ,(concat user-emacs-directory "backups")))
      backup-by-copying t
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t
      auto-save-list-file-prefix (concat user-emacs-directory "backups/.autosaves-")
      auto-save-file-name-transforms
        `((".*" ,(concat user-emacs-directory "backups/auto-") t)))

(setq undo-tree-history-directory-alist `(("." . ,(concat user-emacs-directory "undo"))))

(provide 'backup-autosave)
