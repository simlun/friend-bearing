(ns friend-bearing.domain)

(def user-id-increment-value (atom 0))

(defn- next-user-id!
  []
  (swap! user-id-increment-value inc))

(defn create-session!
  []
  {:user-id (str (next-user-id!))
   :session-key "fdsa"})

