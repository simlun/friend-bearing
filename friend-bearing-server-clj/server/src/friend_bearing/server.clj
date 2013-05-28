(ns friend-bearing.server
  (:require [simlun.util :as util]
            [friend-bearing.webservice :as webservice]))

(defn -main [& args]
  (println "Starting Friend Bearing server")
  (util/on-shutdown #(println "Stopping Friend Bearing server"))
  (webservice/start))

