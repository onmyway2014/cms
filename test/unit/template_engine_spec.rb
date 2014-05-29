require_relative '../spec_helper'
require './lib/core/template_engine/erb_template_engine'
require './lib/core/template_engine/haml_template_engine'
require './lib/core/template_engine/erubis_template_engine'
require './lib/core/template_engine/slim_template_engine'

module Cms

  module Core

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

    describe 'Core::TemplateEngine' do

      def create_person
        tom = TestPerson.new 'tom', 20, TestPerson::SEX_MALE
        boy1 = TestPerson.new 'boy1', 1, TestPerson::SEX_MALE
        boy2 = TestPerson.new 'boy2', 5, TestPerson::SEX_FEMALE
        tom.children << boy1 << boy2

        tom
      end

      context 'using Null' do

      end

      context 'using ERB' do

        subject { ErbTemplateEngine.new }

        it 'should result correct for plan text' do
          subject.render(create_person, 'my name:<%=model.name%>, children:<%=model.children.count%>').should == 'my name:tom, children:2'
        end

        it 'should result correct for html' do
          template = 'my name:<h1><%=model.name%></h1>, children:<b><%=model.children.count%></b>'

          output = 'my name:<h1>tom</h1>, children:<b>2</b>'

          subject.render(create_person, template).should == output
        end

      end

      context 'using Haml' do

        subject { HamlTemplateEngine.new }

        it 'should result correct for html' do
          template = %q(%html
  %div="my name:#{model.name}"
  %div="children:#{model.children.count}"
)

          output = "<html>\n  <div>my name:tom</div>\n  <div>children:2</div>\n</html>\n"

          subject.render(create_person, template).should == output
        end
      end

      context 'using Erubis' do
        subject { ErubisTemplateEngine.new }

        it 'should result correct for html' do
          template = 'my name:<%=model.name%>, children:<%=model.children.count%>'
          output = 'my name:tom, children:2'
          subject.render(create_person, template).should == output

        end
      end

      context 'using slim' do
        subject { SlimTemplateEngine.new }
        it 'should result correct for html' do
          template = %q(
html
  div = "my name:"+ model.name
  div = "children:#{model.children.count}"
)
          output = '<html><div>my name:tom</div><div>children:2</div></html>'

          subject.render(create_person, template).should == output
        end

      end

    end

  end
end