# Doesn't work because jq process doesn't quit. It's expecting EOF but closing `(proc :in)` doesn't do it.

(def proc (os/spawn ["jq" "."] :p {:in :pipe}))
(:write (proc :in) @"[1,2,3]\n")
(:close (proc :in))
(:wait proc)
