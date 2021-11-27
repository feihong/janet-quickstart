(import utf8)

(defn gen-random-ints [low high]
  (let [rng (math/rng (os/time))
        max (inc (- high low))
        add |(+ $0 low)]
    (generate [_ :iterate true]
      (-> (math/rng-int rng max) add))))

(def generator (gen-random-ints 0x4e00 0x9fff))

(defn random-hanzi [n]
  (-> (take n generator) utf8/encode))

(def count
  (let [x (-?> (dyn :args) (get 1) (scan-number))]
    (if (nil? x) 8 x)))

(for i 1 (inc count)
  (print (random-hanzi i)))
