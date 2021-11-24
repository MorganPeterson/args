(import ../args :as "f")

(def test1 '("x.janet" "-a hello world"))
(def test2 '("x.janet" "-xy"))
(def test3 '("x.janet" "--help"))
(def test4 '("x.janet" "-a hello -b"))
(def test5 '("x.janet"))

(def result1 (f/flags test1))
(def result2 (f/flags test2))
(def result3 (f/flags test3))
(def result4 (f/flags test4))
(def result5 (f/flags test5))

(assert (= (get result1 0) "a") "result1: a flag")
(assert (= (get result1 1) "hello") "result1: no flag")
(assert (= (get result1 2) "world") "result1: no flag")

(assert (= (get result2 0) "x") "result2: x flag")
(assert (= (get result2 1) "y") "result2: y flag")

(assert (= (get result3 0) "help") "result3: help flag")

(assert (= (get result4 0) "a") "result4: a flag")
(assert (= (get result4 1) "hello") "result4: no flag")
(assert (= (get result4 2) "b") "result4: b flag")

(assert (= (length result5) 0) "result5 should be zero length")
