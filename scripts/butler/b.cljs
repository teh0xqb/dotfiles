#!/usr/bin/env lumo

(ns butler.core
  (:require
   [cljs.nodejs :as nodejs :refer [process]]
   [clojure.string :as str]))

(defonce opn (nodejs/require "opn"))

(nodejs/enable-util-print!)
;; (def process (js/require "process"))
;; (def args (.slice (.-argv process) 3))

(def ds-prefix "https://datastax.jira.com/browse/")
(def c-prefix "https://issues.apache.org/jira/browse/")
(def urls {:opsc (str ds-prefix "OPSC-")
           :studio (str ds-prefix "STUDIO-")
           :cloud (str ds-prefix "CP-")
           :im (str ds-prefix "IM-")
           :cassandra (str c-prefix "CASSANDRA-")})

(defn jira
  [prj number]
  (opn
   (str (urls prj) number)))

(defn confluence
  [article]
  (opn
   "https://datastax.jira.com/wiki/spaces/DMC/pages/656474186/GraphQL+schema"))

(defn exit [code]
  (.exit process code))

(defn printx [st code]
  (println st)
  (exit code))

(defn validate-in
  "Ensure right format (project prefix with ticket number)"
  [in]
  (re-matches #"((o|c|n|s|i)\d+|g)$" in))

(defn display-prefixes-help
  ""
  []
  (print (str
            "Sample call: `b o123`\n"
            "Possible inputs:\n"
            "o123 -> OPSC-123\n"
            "i40 -> IM-40\n"
            "g -> confluence cloud graphql schema wiki article"
            "n30 -> CP-30\n"
            "c3000 -> CASSANDRA-3000\n"
            "s40 -> STUDIO-40")))

(defn help-n-exit [st code]
  (println st)
  (display-prefixes-help)
  (exit code))

(defn first-letter [st]
  (.substring st 0 1))

(defn in->ticket [st]
  (.substring st 1))

(defn check-arg ""
  [arg]
  (cond
    (not arg) (help-n-exit "No args provided." 2)
    (= arg "-h") (help-n-exit "Help:" 0)
    (nil? (validate-in arg)) (help-n-exit "invalid format for arg... " 4)))

(defn process-args "" []
  ;; (println *command-line-args*)
  (let [arg (first *command-line-args* )]
    (check-arg arg)
    (case (first-letter arg)
      "o" (jira :opsc (in->ticket arg))
      "i" (jira :im (in->ticket arg))
      "s" (jira :studio (in->ticket arg))
      "g" (confluence "schema")
      "n" (jira :cloud (in->ticket arg))
      "c" (jira :cassandra (in->ticket arg))
      (do
        (println "No match.")
        (.exit process 3))
      )))

(defn -main "" []
  (println "Ahoy!")
  (process-args)
  (println "Opening. Good-bye!")
  (.exit process 0))

(set! *main-cli-fn* -main)
