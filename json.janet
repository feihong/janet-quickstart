(import json)

(def character {:name "朱元璋" :job "皇帝" :stats {:power 9001 :wisdom 5000 :magic 120 :stamina 7000}})

(with [f (file/open "character.json" :w)]
  # output won't contain unicode characters directly, just their code points
  (let [output (json/encode character)]
    (file/write f output)))
