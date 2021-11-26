(defn get-fiber []
  (fiber-fn :y
    (yield 1)
    (yield 2)
    (yield 3)
    4))

(print "Print yielded values and return value using loop :iterate")
(let [fiber (get-fiber)]
  (loop [_ :iterate (fiber/can-resume? fiber)]
    (print (resume fiber))))

(print "Print yielded values using loop")
(loop [number :in (get-fiber)]
  (print number))

(print "Print yielded values using each")
(each number (get-fiber)
  (print number))
