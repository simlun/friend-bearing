(ns friend-bearing.webservice
  (:require [simlun.util :as util]
            [compojure.core :as compojure]
            [compojure.route :as route]
            [org.httpkit.server :as httpkit]
            [friend-bearing.domain :as domain]
            [cheshire.core :as cheshire]))

(defn as-json
  [data]
  (cheshire/generate-string data))

(defn create-session
  [_]
  (println "Creating session")
  {:status 201
   :body (as-json (domain/create-session))})

(compojure/defroutes routes
  (compojure/POST "/session" [] create-session)
  (route/not-found "Not found"))

(defn start
  []
  (println "Starting web service")
  (util/on-shutdown #(println "Stopping web service"))
  (let [stop-server (httpkit/run-server routes {:port 3000})]
    (util/on-shutdown stop-server)))

(defn -main
  []
  (start))

