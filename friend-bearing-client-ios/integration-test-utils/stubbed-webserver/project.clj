(defproject stubbed-webserver "0.1.0-SNAPSHOT"
  :dependencies [[org.clojure/clojure "1.4.0"]
                 [org.clojure/data.json "0.2.0"]
                 [compojure "1.1.1"]]
  :plugins [[lein-ring "0.7.3"]]
  :ring {:handler stubbed-webserver.handler/app}
  :profiles {:dev {:dependencies [[ring-mock "0.1.3"]]}})
