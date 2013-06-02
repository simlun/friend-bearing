(ns friend-bearing.domain.service-test
  (:use midje.sweet
        friend-bearing.domain.service))

(facts
  "about create-session!"
  (fact
    "it returns a map of :user-id and :session-key strings"
    (keys (create-session!)) => (contains :user-id)
    (keys (create-session!)) => (contains :session-key)
    (type (:user-id (create-session!))) => java.lang.String
    (type (:session-key (create-session!))) => java.lang.String))

