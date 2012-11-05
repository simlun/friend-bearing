(ns stubbed-webserver.handler
  (:use compojure.core)
  (:require [compojure.handler :as handler]
            [compojure.route :as route]))

(defroutes app-routes
  (GET "/" [] "Hello World")
  (POST "/session" [] {:status 201
                       :body "{\"user-id\": \"123\", \"session-key\": \"a1b2c3d4\"}\n"})
  (route/not-found {:status 404
                    :body "Not Found"}))

(def app
  (handler/site app-routes))