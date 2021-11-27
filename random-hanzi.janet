(import utf8)

(defn gen-random-ints [low high]
  (let [rng (math/rng (os/time))
        max (inc (- high low))
        add |(+ $0 low)]
    (generate [_ :iterate true]
      (-> (math/rng-int rng max) add))))

(def generator (gen-random-ints 0x4e00 0x9fff))

(defn random-hanzi [n]
  (->> (take n generator)
    (map |(utf8/encode [$0]))
    (string/join)))

(for i 1 8
  (print (random-hanzi i)))
