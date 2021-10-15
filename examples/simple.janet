(import ./args :as a)

(defn main [& args]
  (def flags (a/flags args))
  (each flag flags
    (case flag
      "a" (print "A flag found")
      "b" (print "B flag found")
      "c" (print "C flag found")
      "d" (print "D flag found")
      "help" (print "help message")
      (print "don't recognize flag " flag))))
