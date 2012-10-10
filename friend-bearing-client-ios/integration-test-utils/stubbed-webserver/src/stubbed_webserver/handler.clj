(ns stubbed-webserver.handler
  (:use compojure.core)
  (:require [compojure.handler :as handler]
            [compojure.route :as route]))

(defroutes app-routes
  (GET "/" [] "Hello World")
  (route/not-found {:status 404
                    :body "Not Found"}))

(def app
  (handler/site app-routes))
