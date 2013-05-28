(defproject friend-bearing/webservice "0.1.0-SNAPSHOT"
  :dependencies [[org.clojure/clojure "1.5.1"]
                 [simlun/util "0.1.0-SNAPSHOT"]
                 [http-kit "2.1.2"]]
  :profiles {:dev {:dependencies [[midje "1.5.1"]]
                   :plugins [[lein-midje "3.0.1"]]}}
  :main friend-bearing.webservice)

