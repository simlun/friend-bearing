(ns friend-bearing.webservice
  (:require [simlun.util :as util]
            [org.httpkit.server :as httpkit]))

(defn app [req]
  {:status  200
   :headers {"Content-Type" "text/html"}
   :body    "hello HTTP!"})

(defn start
  []
  (println "Starting web service")
  (util/on-shutdown #(println "Stopping web service"))
  (httpkit/run-server app {:port 3000}))

(defn -main
  []
  (start))

