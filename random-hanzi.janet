(import utf8)

(defn gen-random-ints [low high]
  (let [rng (math/rng)
        max (inc (- high low))
        add |(+ $0 low)]
    (generate [_ :iterate true]
      (-> (math/rng-int rng max) add))))

(defn encode [code-point]
  (utf8/encode [code-point]))

(def gen (gen-random-ints 0x4e00 0x9fff))

(for i 0 20
  (def n (resume gen))
  (print n)
  (print (encode n)))
