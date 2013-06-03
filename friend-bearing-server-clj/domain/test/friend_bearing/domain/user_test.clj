(ns friend-bearing.domain.user-test
  (:use midje.sweet
        friend-bearing.domain.user))

(facts
  "about user ID's"

  (fact "it is a number"
        (next-user-id!) => number?)

  (fact "successive calls create different user ID's"
        (next-user-id!) =not=> (next-user-id!)
        (count (distinct
                 (repeatedly 10 #(next-user-id!)))) => 10))

(facts
  "about session keys"

  (fact "it is a string"
        (type (next-session-key!)) => java.lang.String)

  (fact "length is reasonable"
        (count (next-session-key!)) => (roughly 300 50))

  (fact "successive calls create different session keys"
        (next-session-key!) =not=> (next-session-key!))
        (count (distinct
                 (repeatedly 10 #(next-user-id!)))) => 10)

