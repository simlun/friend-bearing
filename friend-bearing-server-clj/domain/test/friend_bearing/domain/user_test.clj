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
                 (repeatedly 99 #(next-user-id!)))) => 99))

(facts
  "about session keys"
  (future-fact "regex check session key")
  (future-fact "successive calls create different session keys"))

