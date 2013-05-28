(ns friend-bearing.server
  (:require [friend-bearing.webservice :as webservice]))

(defn -main [& args]
  (webservice/start))

