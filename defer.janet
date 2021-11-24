(defer (print "done!")
  (for i 0 100
    (print i)
    (os/sleep 1)
    (if (= 5 i) (error "what!?!"))))
