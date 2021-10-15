(defn- to-byte
  "convert char to byte"
  [x]
  (get (string/bytes x) 0))

(defn- parse
  "parse command line arguments"
  [args]
  (var results @[])
  (def f
    (fiber/new 
      (fn []
        (loop [x :in args]
          (yield x)))))
  (def dash (to-byte "-"))
  (def spce (to-byte " "))
  (while (fiber/can-resume? f)
    (var args0 (resume f))
    (if (not (= args0 dash)) (break))
    (set args0 (resume f))
    (if (and (= args0 dash) (not (fiber/can-resume? f))) (break))
    (cond
      (= args0 dash)
      (do
        (var a @[])
        (loop [x :in f :until (or (= x spce) (not (fiber/can-resume? f)))]
          (array/push a (string/from-bytes x)))
        (array/push results (string/join a)))
      (do
        (array/push results (string/from-bytes args0))
        (loop [x :in f :until (or (= x spce) (not (fiber/can-resume? f)))]
            (array/push results (string/from-bytes x))))))
  results)

(defn flags
  "take in raw commandline string"
  [args]
  (parse (string/join (tuple/slice args 1) " ")))
