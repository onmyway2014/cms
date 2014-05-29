
module Cms
  module Core

    module ModelCreateHelper

      class TestPerson
        SEX_MALE='male'
        SEX_FEMALE='female'

        attr_accessor :name, :age, :sex

        attr_accessor :children

        def initialize(name, age, sex)

          @name = name
          @age = age
          @sex = sex

          @children = []
        end
      end


      def person_tom
        tom = TestPerson.new 'tom', 20, TestPerson::SEX_MALE
        boy1 = TestPerson.new 'boy1', 1, TestPerson::SEX_MALE
        boy2 = TestPerson.new 'boy2', 5, TestPerson::SEX_FEMALE
        tom.children << boy1 << boy2

        tom
      end

    end
  end
end