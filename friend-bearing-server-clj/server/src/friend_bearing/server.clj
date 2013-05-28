(ns friend-bearing.server
  (:require [friend-bearing.webservice :as webservice]))

(defn -main []
  (webservice/start))

