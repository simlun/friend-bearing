(ns stubbed-webserver.handler
  (:use compojure.core)
  (:require [compojure.handler :as handler]
            [compojure.route :as route]
            [clojure.data.json :as json]))

(defroutes app-routes
  (GET "/" [] 
       "Hello World")
  (POST "/session" [] 
        {:status 201
         :body (json/write-str {:user-id 123, :session-key "a1b2c3d4"})})
  (GET "/bearing/:user-id" [user-id]
       {:status 200
        :body (json/write-str {:magnetic-bearing 47})})
  (route/not-found {:status 404
                    :body "Not Found"}))

(def app
  (handler/site app-routes))
