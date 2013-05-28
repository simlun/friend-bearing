(ns friend-bearing.webservice
  (:require [org.httpkit.server :as httpkit]))

(defn app [req]
  {:status  200
   :headers {"Content-Type" "text/html"}
   :body    "hello HTTP!"})

(defn- on-shutdown
  [f]
  (.. java.lang.Runtime
    (getRuntime)
    (addShutdownHook
      (Thread. f))))

(defn start
  []
  (on-shutdown #(println "Stopping web service"))
  (println "Starting web service")
  (httpkit/run-server app {:port 3000}))

(defn -main
  []
  (start))

