(ns friend-bearing.webservice-test
  (:use midje.sweet
        ring.mock.request)
  (:require [friend-bearing.webservice :as webservice]
            [friend-bearing.domain.service :as service]
            [org.httpkit.client :as client]
            [org.httpkit.server :as server]))


(fact
  (webservice/routes (request :get "/doesnotexist"))
  => (contains {:status 404}))

(fact "POST to /session respond with the response as JSON"
  (webservice/routes (request :post "/session"))
  => (contains {:body "{\"foo\":17}"})
  (provided
    (service/create-session!) => {:foo 17}))

(fact "POST to /session respond with '201 Created' status code"
  (webservice/routes (request :post "/session"))
  => (contains {:status 201})
  (provided
    (service/create-session!) => {:foo 17}))


(defmacro with-server
  [& body]
  `(let [stop-server# (server/run-server webservice/handler {:port 3001})]
     (try
       ~@body
       (finally (stop-server#)))))

(with-server
  (fact "Exceptions respond with '500 Internal Server Error' status code"
    @(client/get "http://localhost:3001/error")
    => (contains {:status 500})))

