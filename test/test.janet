(import ../args :as "f")

(def test1 '("x.janet" "-a"))
(def test2 '("x.janet" "-xy"))
(def test3 '("x.janet" "--help"))

(def result1 (f/flags test1))
(def result2 (f/flags test2))
(def result3 (f/flags test3))

(assert (= (get result1 0) "a") "a flag")

(assert (= (get result2 0) "x") "x flag")

(assert (= (get result2 1) "y") "y flag")

(assert (= (get result3 0) "help") "help flag")
