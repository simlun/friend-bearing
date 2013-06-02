(ns friend-bearing.domain.user)

(def user-id-increment-value (atom 0))

(defn next-user-id!
  []
  (swap! user-id-increment-value inc))

