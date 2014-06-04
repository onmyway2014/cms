require './test/spec_helper'
require './test/model_create_helper'
require './lib/core/template_engine/erb_template_engine'

module Cms
  module Core
    describe 'Engine::ErbTemplateEngine' do
      include ModelCreateHelper

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

  end
end