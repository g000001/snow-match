;;;; package.lisp

(cl:in-package :cl-user)

(defpackage :snow-match
  (:use)
  (:export :match))

(defpackage :snow-match.internal
  (:use :snow-match :cl :fiveam :mbe :named-readtables
        :quasiquote1)
  (:shadowing-import-from :srfi-23 :error)
  (:shadowing-import-from :srfi-5 :let))
