(import json)

(def character {:name "朱元璋" :job "皇帝" :stats {:power 9001 :wisdom 5000 :magic 120 :stamina 7000}})

(print "Formatted output without unicode characters (just code points)")
(with [f (file/open "character.json" :w)]
  (let [output (json/encode character @"  ")]
    (print output)
    (file/write f output)))

(print "\nUse os/spawn with jq to get formatted output with unicode characters")
(def proc (os/spawn ["jq" "." "character.json"] :p {:out :pipe}))
(print (:read (proc :out) :all))
(:wait proc)

(print "\nUse os/spawn with jq on temporary file")
(with [f (file/temp)]
  (file/write f (json/encode character))
  (file/seek f :set 0)
  (def proc (os/spawn ["jq" "."] :p {:in f :out :pipe}))
  (print (:read (proc :out) :all))
  (:wait proc))
