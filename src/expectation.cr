module Spec2
  class Expectation(T)
    getter actual
    getter matcher

    def initialize(@actual : T)
    end

    def to(@matcher)
      return if matcher.match(actual)
      raise ExpectationNotMet.new(matcher.failure_message)
    end

    def not_to(@matcher)
      return unless matcher.match(actual)
      raise ExpectationNotMet.new(matcher.failure_message_when_negated)
    end
  end
end
