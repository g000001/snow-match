;;;; snow-match.asd

(cl:in-package :asdf)

(defsystem :snow-match
  :serial t
  :depends-on (:fiveam
               :quasiquote1
               :mbe
               :srfi-23
               :srfi-5)
  :components ((:file "package")
               (:file "snow-match")
               (:file "test")))

(defmethod perform ((o test-op) (c (eql (find-system :snow-match))))
  (load-system :snow-match)
  (or (flet ((_ (pkg sym)
               (intern (symbol-name sym) (find-package pkg))))
         (let ((result (funcall (_ :fiveam :run) (_ :snow-match.internal :snow-match))))
           (funcall (_ :fiveam :explain!) result)
           (funcall (_ :fiveam :results-status) result)))
      (error "test-op failed") ))
