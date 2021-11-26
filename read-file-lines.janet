(with [f (file/open "character.json")]
  (loop [line :iterate (file/read f :line)]
    (print (string/trimr line))))
