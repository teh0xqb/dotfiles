(require 'boot.repl)

(swap! boot.repl/*default-dependencies*
       concat '[[cider/cider-nrepl "0.18.0-snapshot"]
                [refactor-nrepl "2.4.0-SNAPSHOT"]])

(swap! boot.repl/*default-middleware*
       conj '[cider.nrepl/cider-middleware
              refactor-nrepl.middleware/wrap-refactor])
