(ns friend-bearing.domain.user
  (:require [crypto.random :as random]))

(def user-id-increment-value (atom 0))

(defn next-user-id!
  []
  (swap! user-id-increment-value inc))

(defn next-session-key!
  []
  (random/url-part 256))

