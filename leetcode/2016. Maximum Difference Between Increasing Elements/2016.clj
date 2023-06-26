; https://anon.to/FnWfmO
(def max-difference
  (comp
    #(if (zero? %) -1 %)
    (partial apply max)
    #(map - % (reductions min %))))

(println (max-difference [7 1 5 4])) ; 4
(println (max-difference [9 4 3 2])) ; -1
(println (max-difference [1 5 2 10])) ; 9
