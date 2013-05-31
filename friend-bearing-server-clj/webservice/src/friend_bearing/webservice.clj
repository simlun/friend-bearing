(ns friend-bearing.webservice
  (:require [simlun.util :as util]
            [compojure.core :as compojure]
            [compojure.route :as route]
            [org.httpkit.server :as httpkit]
            [friend-bearing.domain :as domain]
            [cheshire.core :as cheshire]))

(defn- as-json
  [data]
  (cheshire/generate-string data))

(defn- create-session
  [_]
  (println "Creating session")
  {:status 201
   :body (as-json (domain/create-session))})

(defn- throw-exception
  [_]
  (throw (Exception. "Something went wrong")))

(compojure/defroutes routes
  (compojure/POST "/session" [] create-session)
  (compojure/GET "/error" [] throw-exception)
  (route/not-found "Not found"))

(defn- wrap-exception [f]
  (fn [request]
    (try (f request)
      (catch Exception e
         {:status 500
          :body "Internal server error. Sorry."}))))

(def handler
  (-> routes
      wrap-exception))

(defn start
  []
  (println "Starting web service")
  (util/on-shutdown #(println "Stopping web service"))
  (let [stop-server (httpkit/run-server handler {:port 3000})]
    (util/on-shutdown stop-server)))

(defn -main
  []
  (start))

