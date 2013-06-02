(ns friend-bearing.domain.service
  (:require [friend-bearing.domain.user :as user]))

(defn create-session!
  []
  {:user-id (str (user/next-user-id!))
   :session-key "fdsa"})

