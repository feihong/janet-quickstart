(import pkgs)

(def packages
  (-> pkgs/packages
      pairs
      sort))

(each [k v] packages
  (print k ": " v))
