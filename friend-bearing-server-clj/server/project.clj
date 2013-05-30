(defproject friend-bearing/server "0.1.0-SNAPSHOT"
  :dependencies [[org.clojure/clojure "1.5.1"]
                 [simlun/util "0.1.0-SNAPSHOT"]
                 [friend-bearing/webservice "0.1.0-SNAPSHOT"]]
  :profiles {:dev {:dependencies [[midje "1.5.1"]]
                   :plugins [[lein-midje "3.0.1"]]}}
  :main friend-bearing.server)

