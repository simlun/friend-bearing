(ns friend-bearing.webservice-test
  (:use midje.sweet
        ring.mock.request)
  (:require [friend-bearing.webservice :as webservice]
            [friend-bearing.lib :as lib]))

(fact (+ 1 1) => 2)

(fact
  (webservice/routes (request :get "/doesnotexist"))
  => (contains {:status 404}))

(fact "POST to /session responds with the response as JSON"
  (webservice/routes (request :post "/session"))
  => (contains {:body "{\"foo\":17}"})
  (provided
    (lib/create-session) => {:foo 17}))

(fact "POST to /session responds with '201 Created' status code"
  (webservice/routes (request :post "/session"))
  => (contains {:status 201})
  (provided
    (lib/create-session) => {}))

