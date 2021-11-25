(def fiber (fiber-fn :y
  (yield 1)
  (yield 2)
  (yield 3)
  4))

(def numbers (seq [_ :iterate (fiber/can-resume? fiber)] (resume fiber)))

(each number numbers
  (print number))
