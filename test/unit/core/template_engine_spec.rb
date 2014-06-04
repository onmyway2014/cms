require_relative '../../spec_helper'
require_relative '../../model_create_helper'
require './lib/core/template_engine/erb_template_engine'
require './lib/core/template_engine/haml_template_engine'
require './lib/core/template_engine/erubis_template_engine'
require './lib/core/template_engine/slim_template_engine'

module Cms

  module Core

    describe 'Core::TemplateEngine' do
      include ModelCreateHelper

      context 'using Null' do

      end

      context 'using ERB' do

        subject { ErbTemplateEngine.new }

        it 'should result correct for plan text' do
          subject.render(person_tom, 'my name:<%=model.name%>, children:<%=model.children.count%>').should == 'my name:tom, children:2'
        end

        it 'should result correct for html' do
          template = 'my name:<h1><%=model.name%></h1>, children:<b><%=model.children.count%></b>'

          output = 'my name:<h1>tom</h1>, children:<b>2</b>'

          subject.render(person_tom, template).should == output
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

          subject.render(person_tom, template).should == output
        end
      end

      context 'using Erubis' do
        subject { ErubisTemplateEngine.new }

        it 'should result correct for html' do
          template = 'my name:<%=model.name%>, children:<%=model.children.count%>'
          output = 'my name:tom, children:2'
          subject.render(person_tom, template).should == output

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

          subject.render(person_tom, template).should == output
        end

      end

    end

  end
end