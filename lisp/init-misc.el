(defun zilongshanren/load-my-layout ()
  (interactive)
  (persp-load-state-from-file (concat persp-save-dir "aprilwithme")))

(defun zilongshanren/save-my-layout ()
  (interactive)
  (persp-save-state-to-file (concat persp-save-dir "aprilwithme")))

(spacemacs/set-leader-keys "oll" 'zilongshanren/load-my-layout)
(spacemacs/set-leader-keys "ols" 'zilongshanren/save-my-layout)

(spacemacs|define-custom-layout "@linux"
  :binding "l"
  :body
  (find-file "~/OpenProjects/linux/README"))

(spacemacs|define-custom-layout "@mxnet"
  :binding "m"
  :body
  (find-file "~/OpenProjects/mxnet/README.md"))

(spacemacs|define-custom-layout "@zeromq"
  :binding "0"
  :body
  (find-file "~/OpenProjects/libzmq/README.md"))

(provide 'init-misc)
