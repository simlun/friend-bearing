(defproject friend-bearing/webservice "0.1.0-SNAPSHOT"
  :dependencies [[org.clojure/clojure "1.5.1"]
                 [simlun/util "0.1.0-SNAPSHOT"]
                 [friend-bearing/lib "0.1.0-SNAPSHOT"]
                 [http-kit "2.1.2"]
                 [compojure "1.1.5"]
                 [cheshire "5.2.0"]]
  :profiles {:dev {:dependencies [[midje "1.5.1"]
                                  [ring-mock "0.1.5"]]
                   :plugins [[lein-midje "3.0.1"]]}}
  :main friend-bearing.webservice)

