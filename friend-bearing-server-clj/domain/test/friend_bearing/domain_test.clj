(ns friend-bearing.domain-test
  (:use midje.sweet
        friend-bearing.domain))

(facts
  "about create-session!"
  (fact
    "it returns a map of :user-id and :session-key strings"
    (keys (create-session!)) => (contains :user-id)
    (keys (create-session!)) => (contains :session-key)
    (type (:user-id (create-session!))) => java.lang.String
    (type (:session-key (create-session!))) => java.lang.String)

  (fact "its :user-id is a string of numbers"
        (:user-id (create-session!)) => #"^\d+$")

  (fact "successive calls create different :user-ids"
        (:user-id (create-session!)) =not=> (:user-id (create-session!))
        (count (distinct
                 (repeatedly 99 #(:user-id (create-session!))))) => 99)

  (future-fact "regex check :session-key")
  (future-fact "successive calls create different :session-keys"))

